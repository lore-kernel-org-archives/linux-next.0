From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree with the security tree
Date: Mon, 24 Sep 2012 08:31:07 -0700
Message-ID: <87txunwi84.fsf@xmission.com>
References: <20120924215222.8933c5557b17239552f0b1d1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120924215222.8933c5557b17239552f0b1d1@canb.auug.org.au>
	(Stephen Rothwell's message of "Mon, 24 Sep 2012 21:52:22 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>, James Morris <jmorris@namei.org>, Dmitry Kasatkin <dmitry.kasatkin@intel.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> Today's linux-next merge of the userns tree got a conflict in
> security/integrity/ima/ima_policy.c between commit 07f6a79415d7 ("ima:
> add appraise action keywords and default rules") from the security tree
> and commit 8b94eea4bfb8 ("userns: Add user namespace support to IMA") from
> the userns tree.
>
> I fixed it up (see below) but it probably needs more and can carry the
> fix as necessary (no action is required).

Right.  To work when user namespace support is enabled fowner needs be
converted to a kuid_t as well.

When I did a trial earlier this is what I wound up with.  As long as
user namespaces are not enabled what you wound up with should be fine.

Eric

diff --cc security/integrity/ima/ima_policy.c
index c84df05,cda9031..346fe8f
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@@ -39,7 -45,8 +45,8 @@@ struct ima_rule_entry 
  	enum ima_hooks func;
  	int mask;
  	unsigned long fsmagic;
 -	uid_t uid;
 -	uid_t fowner;
 +	kuid_t uid;
++	kuid_t fowner;
  	struct {
  		void *rule;	/* LSM file metadata specific */
  		int type;	/* audit type */
@@@ -75,14 -82,28 +82,28 @@@ static struct ima_rule_entry default_ru
  	 .flags = IMA_FUNC | IMA_MASK | IMA_UID},
  };
  
- static LIST_HEAD(measure_default_rules);
- static LIST_HEAD(measure_policy_rules);
- static struct list_head *ima_measure;
+ static struct ima_rule_entry default_appraise_rules[] = {
+ 	{.action = DONT_APPRAISE,.fsmagic = PROC_SUPER_MAGIC,.flags = IMA_FSMAGIC},
+ 	{.action = DONT_APPRAISE,.fsmagic = SYSFS_MAGIC,.flags = IMA_FSMAGIC},
+ 	{.action = DONT_APPRAISE,.fsmagic = DEBUGFS_MAGIC,.flags = IMA_FSMAGIC},
+ 	{.action = DONT_APPRAISE,.fsmagic = TMPFS_MAGIC,.flags = IMA_FSMAGIC},
+ 	{.action = DONT_APPRAISE,.fsmagic = RAMFS_MAGIC,.flags = IMA_FSMAGIC},
+ 	{.action = DONT_APPRAISE,.fsmagic = DEVPTS_SUPER_MAGIC,.flags = IMA_FSMAGIC},
+ 	{.action = DONT_APPRAISE,.fsmagic = BINFMTFS_MAGIC,.flags = IMA_FSMAGIC},
+ 	{.action = DONT_APPRAISE,.fsmagic = SECURITYFS_MAGIC,.flags = IMA_FSMAGIC},
+ 	{.action = DONT_APPRAISE,.fsmagic = SELINUX_MAGIC,.flags = IMA_FSMAGIC},
+ 	{.action = DONT_APPRAISE,.fsmagic = CGROUP_SUPER_MAGIC,.flags = IMA_FSMAGIC},
 -	{.action = APPRAISE,.fowner = 0,.flags = IMA_FOWNER},
++	{.action = APPRAISE,.fowner = GLOBAL_ROOT_UID,.flags = IMA_FOWNER},
+ };
+ 
+ static LIST_HEAD(ima_default_rules);
+ static LIST_HEAD(ima_policy_rules);
+ static struct list_head *ima_rules;
  
- static DEFINE_MUTEX(ima_measure_mutex);
+ static DEFINE_MUTEX(ima_rules_mutex);
  
  static bool ima_use_tcb __initdata;
- static int __init default_policy_setup(char *str)
+ static int __init default_measure_policy_setup(char *str)
  {
  	ima_use_tcb = 1;
  	return 1;
@@@ -112,8 -141,10 +141,10 @@@ static bool ima_match_rules(struct ima_
  	if ((rule->flags & IMA_FSMAGIC)
  	    && rule->fsmagic != inode->i_sb->s_magic)
  		return false;
 -	if ((rule->flags & IMA_UID) && rule->uid != cred->uid)
 +	if ((rule->flags & IMA_UID) && !uid_eq(rule->uid, cred->uid))
  		return false;
 -	if ((rule->flags & IMA_FOWNER) && rule->fowner != inode->i_uid)
++	if ((rule->flags & IMA_FOWNER) && !uid_eq(rule->fowner, inode->i_uid))
+ 		return false;
  	for (i = 0; i < MAX_LSM_RULES; i++) {
  		int rc = 0;
  		u32 osid, sid;
@@@ -277,7 -336,8 +336,8 @@@ static int ima_parse_rule(char *rule, s
  
  	ab = audit_log_start(NULL, GFP_KERNEL, AUDIT_INTEGRITY_RULE);
  
 -	entry->uid = -1;
 -	entry->fowner = -1;
 +	entry->uid = INVALID_UID;
++	entry->fowner = INVALID_UID;
  	entry->action = UNKNOWN;
  	while ((p = strsep(&rule, " \t")) != NULL) {
  		substring_t args[MAX_OPT_ARGS];
@@@ -375,6 -459,23 +459,23 @@@
  					entry->flags |= IMA_UID;
  			}
  			break;
+ 		case Opt_fowner:
+ 			ima_log_string(ab, "fowner", args[0].from);
+ 
 -			if (entry->fowner != -1) {
++			if (uid_valid(entry->fowner)) {
+ 				result = -EINVAL;
+ 				break;
+ 			}
+ 
+ 			result = strict_strtoul(args[0].from, 10, &lnum);
+ 			if (!result) {
 -				entry->fowner = (uid_t) lnum;
 -				if (entry->fowner != lnum)
++				entry->fowner = make_kuid(current_user_ns(), (uid_t) lnum);
++				if (!uid_valid(entry->fowner) || ((uid_t)lnum != lnum))
+ 					result = -EINVAL;
+ 				else
+ 					entry->flags |= IMA_FOWNER;
+ 			}
+ 			break;
  		case Opt_obj_user:
  			ima_log_string(ab, "obj_user", args[0].from);
  			result = ima_lsm_rule_init(entry, args[0].from,
