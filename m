From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Thu, 13 Nov 2008 16:09:37 +1100
Message-ID: <20081113160937.276bbd71.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43531 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750728AbYKMFJq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Nov 2008 00:09:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>

Hi David,

Today's linux-next merge of the creds tree got a conflict in
include/linux/security.h between commit
06112163f5fd9e491a7f810443d81efa9d88e247 ("Add a new capable interface
that will be used by systems that use audit to") from the
security-testing tree and commit a9018998dcc1e3b4401a7f6d2050ffedbd1b64da
("CRED: Inaugurate COW credentials") from the creds tree.

Context changes.  I fixed it up (see below) and can carry it for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/security.h
index 5fe28a6,9a71bcf..0000000
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@@ -1303,15 -1281,12 +1285,12 @@@ struct security_operations 
  	int (*capget) (struct task_struct *target,
  		       kernel_cap_t *effective,
  		       kernel_cap_t *inheritable, kernel_cap_t *permitted);
- 	int (*capset_check) (struct task_struct *target,
- 			     kernel_cap_t *effective,
- 			     kernel_cap_t *inheritable,
- 			     kernel_cap_t *permitted);
- 	void (*capset_set) (struct task_struct *target,
- 			    kernel_cap_t *effective,
- 			    kernel_cap_t *inheritable,
- 			    kernel_cap_t *permitted);
+ 	int (*capset) (struct cred *new,
+ 		       const struct cred *old,
+ 		       const kernel_cap_t *effective,
+ 		       const kernel_cap_t *inheritable,
+ 		       const kernel_cap_t *permitted);
 -	int (*capable) (struct task_struct *tsk, int cap);
 +	int (*capable) (struct task_struct *tsk, int cap, int audit);
  	int (*acct) (struct file *file);
  	int (*sysctl) (struct ctl_table *table, int op);
  	int (*quotactl) (int cmds, int type, int id, struct super_block *sb);
@@@ -1572,16 -1548,11 +1552,12 @@@ int security_capget(struct task_struct 
  		    kernel_cap_t *effective,
  		    kernel_cap_t *inheritable,
  		    kernel_cap_t *permitted);
- int security_capset_check(struct task_struct *target,
- 			  kernel_cap_t *effective,
- 			  kernel_cap_t *inheritable,
- 			  kernel_cap_t *permitted);
- void security_capset_set(struct task_struct *target,
- 			 kernel_cap_t *effective,
- 			 kernel_cap_t *inheritable,
- 			 kernel_cap_t *permitted);
+ int security_capset(struct cred *new, const struct cred *old,
+ 		    const kernel_cap_t *effective,
+ 		    const kernel_cap_t *inheritable,
+ 		    const kernel_cap_t *permitted);
  int security_capable(struct task_struct *tsk, int cap);
 +int security_capable_noaudit(struct task_struct *tsk, int cap);
  int security_acct(struct file *file);
  int security_sysctl(struct ctl_table *table, int op);
  int security_quotactl(int cmds, int type, int id, struct super_block *sb);
