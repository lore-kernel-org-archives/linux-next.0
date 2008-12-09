From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the audit tree
Date: Tue, 9 Dec 2008 17:57:26 +1100
Message-ID: <20081209175726.682d77cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52297 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751950AbYLIG5e (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 01:57:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, Eric Paris <eparis@redhat.com>, Serge Hallyn <serue@us.ibm.com>

Hi Al,

Today's linux-next merge of the audit tree got a lot of conflict in
include/linux/audit.h, kernel/auditsc.c, kernel/capability.c and
security/commoncap.c against commits in the security-testing tree.

Its not obvious how to resolve these, so can you, Eric, James and Dave
have a conversation and see what you can come up with.  Some will be
easy, but there are several overlapping changes here.

Looking harder, it looks like some (all?) of Eric's patches may already
be in the security-testing tree ...

I have dropped the audit tree for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/audit.h
index 26c4f6f,1471971..0000000
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@@ -455,10 -455,8 +455,15 @@@ extern int __audit_mq_timedsend(mqd_t m
  extern int __audit_mq_timedreceive(mqd_t mqdes, size_t msg_len, unsigned int __user *u_msg_prio, const struct timespec __user *u_abs_timeout);
  extern int __audit_mq_notify(mqd_t mqdes, const struct sigevent __user *u_notification);
  extern int __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat);
++<<<<<<< HEAD:include/linux/audit.h
 +extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
 +				  const struct cred *new,
 +				  const struct cred *old);
 +extern int __audit_log_capset(pid_t pid, const struct cred *new, const struct cred *old);
++=======
+ extern void __audit_log_bprm_fcaps(struct linux_binprm *bprm, kernel_cap_t *pP, kernel_cap_t *pE);
+ extern int __audit_log_capset(pid_t pid, kernel_cap_t *eff, kernel_cap_t *inh, kernel_cap_t *perm);
++>>>>>>> audit/for-next:include/linux/audit.h
  
  static inline int audit_ipc_obj(struct kern_ipc_perm *ipcp)
  {
@@@ -509,20 -507,32 +514,49 @@@ static inline int audit_mq_getsetattr(m
  	return 0;
  }
  
++<<<<<<< HEAD:include/linux/audit.h
 +static inline int audit_log_bprm_fcaps(struct linux_binprm *bprm,
 +				       const struct cred *new,
 +				       const struct cred *old)
 +{
 +	if (unlikely(!audit_dummy_context()))
 +		return __audit_log_bprm_fcaps(bprm, new, old);
 +	return 0;
 +}
 +
 +static inline int audit_log_capset(pid_t pid, const struct cred *new,
 +				   const struct cred *old)
 +{
 +	if (unlikely(!audit_dummy_context()))
 +		return __audit_log_capset(pid, new, old);
++=======
+ /*
+  * ieieeeeee, an audit function without a return code!
+  *
+  * This function might fail!  I decided that it didn't matter.  We are too late
+  * to fail the syscall and the information isn't REQUIRED for any purpose.  It's
+  * just nice to have.  We should be able to look at past audit logs to figure
+  * out this process's current cap set along with the fcaps from the PATH record
+  * and use that to come up with the final set.  Yeah, its ugly, but all the info
+  * is still in the audit log.  So I'm not going to bother mentioning we failed
+  * if we couldn't allocate memory.
+  *
+  * If someone changes their mind they could create the aux record earlier and
+  * then search here and use that earlier allocation.  But I don't wanna.
+  *
+  * -Eric
+  */
+ static inline void audit_log_bprm_fcaps(struct linux_binprm *bprm, kernel_cap_t *pP, kernel_cap_t *pE)
+ {
+ 	if (unlikely(!audit_dummy_context()))
+ 		__audit_log_bprm_fcaps(bprm, pP, pE);
+ }
+ 
+ static inline int audit_log_capset(pid_t pid, kernel_cap_t *eff, kernel_cap_t *inh, kernel_cap_t *perm)
+ {
+ 	if (unlikely(!audit_dummy_context()))
+ 		return __audit_log_capset(pid, eff, inh, perm);
++>>>>>>> audit/for-next:include/linux/audit.h
  	return 0;
  }
  
@@@ -558,8 -568,8 +592,13 @@@ extern int audit_signals
  #define audit_mq_timedreceive(d,l,p,t) ({ 0; })
  #define audit_mq_notify(d,n) ({ 0; })
  #define audit_mq_getsetattr(d,s) ({ 0; })
++<<<<<<< HEAD:include/linux/audit.h
 +#define audit_log_bprm_fcaps(b, ncr, ocr) ({ 0; })
 +#define audit_log_capset(pid, ncr, ocr) ({ 0; })
++=======
+ #define audit_log_bprm_fcaps(b, p, e) do { ; } while (0)
+ #define audit_log_capset(pid, e, i, p) ({ 0; })
++>>>>>>> audit/for-next:include/linux/audit.h
  #define audit_ptrace(t) ((void)0)
  #define audit_n_rules 0
  #define audit_signals 0
diff --cc kernel/auditsc.c
index 4819f37,87fd50b..0000000
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@@ -89,8 -89,8 +89,13 @@@ struct audit_cap_data 
  	kernel_cap_t		permitted;
  	kernel_cap_t		inheritable;
  	union {
++<<<<<<< HEAD:kernel/auditsc.c
 +		unsigned int	fE;		/* effective bit of a file capability */
 +		kernel_cap_t	effective;	/* effective set of a process */
++=======
+ 		unsigned int	fE;
+ 		kernel_cap_t	effective;
++>>>>>>> audit/for-next:kernel/auditsc.c
  	};
  };
  
@@@ -2564,17 -2557,18 +2569,31 @@@ int __audit_signal_info(int sig, struc
  
  /**
   * __audit_log_bprm_fcaps - store information about a loading bprm and relevant fcaps
++<<<<<<< HEAD:kernel/auditsc.c
 + * @bprm: pointer to the bprm being processed
 + * @new: the proposed new credentials
 + * @old: the old credentials
++=======
+  * @bprm pointer to the bprm being processed
+  * @caps the caps read from the disk
++>>>>>>> audit/for-next:kernel/auditsc.c
   *
   * Simply check if the proc already has the caps given by the file and if not
   * store the priv escalation info for later auditing at the end of the syscall
   *
++<<<<<<< HEAD:kernel/auditsc.c
 + * -Eric
 + */
 +int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
 +			   const struct cred *new, const struct cred *old)
++=======
+  * this can fail and we don't care.  See the note in audit.h for
+  * audit_log_bprm_fcaps() for my explaination....
+  *
+  * -Eric
+  */
+ void __audit_log_bprm_fcaps(struct linux_binprm *bprm, kernel_cap_t *pP, kernel_cap_t *pE)
++>>>>>>> audit/for-next:kernel/auditsc.c
  {
  	struct audit_aux_data_bprm_fcaps *ax;
  	struct audit_context *context = current->audit_context;
@@@ -2583,7 -2577,7 +2602,11 @@@
  
  	ax = kmalloc(sizeof(*ax), GFP_KERNEL);
  	if (!ax)
++<<<<<<< HEAD:kernel/auditsc.c
 +		return -ENOMEM;
++=======
+ 		return;
++>>>>>>> audit/for-next:kernel/auditsc.c
  
  	ax->d.type = AUDIT_BPRM_FCAPS;
  	ax->d.next = context->aux;
@@@ -2598,27 -2592,26 +2621,48 @@@
  	ax->fcap.fE = !!(vcaps.magic_etc & VFS_CAP_FLAGS_EFFECTIVE);
  	ax->fcap_ver = (vcaps.magic_etc & VFS_CAP_REVISION_MASK) >> VFS_CAP_REVISION_SHIFT;
  
++<<<<<<< HEAD:kernel/auditsc.c
 +	ax->old_pcap.permitted   = old->cap_permitted;
 +	ax->old_pcap.inheritable = old->cap_inheritable;
 +	ax->old_pcap.effective   = old->cap_effective;
 +
 +	ax->new_pcap.permitted   = new->cap_permitted;
 +	ax->new_pcap.inheritable = new->cap_inheritable;
 +	ax->new_pcap.effective   = new->cap_effective;
 +	return 0;
++=======
+ 	ax->old_pcap.permitted = *pP;
+ 	ax->old_pcap.inheritable = current->cap_inheritable;
+ 	ax->old_pcap.effective = *pE;
+ 
+ 	ax->new_pcap.permitted = current->cap_permitted;
+ 	ax->new_pcap.inheritable = current->cap_inheritable;
+ 	ax->new_pcap.effective = current->cap_effective;
++>>>>>>> audit/for-next:kernel/auditsc.c
  }
  
  /**
   * __audit_log_capset - store information about the arguments to the capset syscall
++<<<<<<< HEAD:kernel/auditsc.c
 + * @pid: target pid of the capset call
 + * @new: the new credentials
 + * @old: the old (current) credentials
++=======
+  * @pid target pid of the capset call
+  * @eff effective cap set
+  * @inh inheritible cap set
+  * @perm permited cap set
++>>>>>>> audit/for-next:kernel/auditsc.c
   *
   * Record the aguments userspace sent to sys_capset for later printing by the
   * audit system if applicable
   */
++<<<<<<< HEAD:kernel/auditsc.c
 +int __audit_log_capset(pid_t pid,
 +		       const struct cred *new, const struct cred *old)
++=======
+ int __audit_log_capset(pid_t pid, kernel_cap_t *eff, kernel_cap_t *inh, kernel_cap_t *perm)
++>>>>>>> audit/for-next:kernel/auditsc.c
  {
  	struct audit_aux_data_capset *ax;
  	struct audit_context *context = current->audit_context;
@@@ -2635,9 -2628,9 +2679,15 @@@
  	context->aux = (void *)ax;
  
  	ax->pid = pid;
++<<<<<<< HEAD:kernel/auditsc.c
 +	ax->cap.effective   = new->cap_effective;
 +	ax->cap.inheritable = new->cap_effective;
 +	ax->cap.permitted   = new->cap_permitted;
++=======
+ 	ax->cap.effective = *eff;
+ 	ax->cap.inheritable = *eff;
+ 	ax->cap.permitted = *perm;
++>>>>>>> audit/for-next:kernel/auditsc.c
  
  	return 0;
  }
diff --cc kernel/capability.c
index 36b4b4d,aaa2262..0000000
--- a/kernel/capability.c
+++ b/kernel/capability.c
@@@ -271,23 -458,36 +271,42 @@@ asmlinkage long sys_capset(cap_user_hea
  		i++;
  	}
  
++<<<<<<< HEAD:kernel/capability.c
 +	new = prepare_creds();
 +	if (!new)
 +		return -ENOMEM;
++=======
+ 	ret = audit_log_capset(pid, &effective, &inheritable, &permitted);
+ 	if (ret)
+ 		return ret;
+ 
+ 	if (pid && (pid != task_pid_vnr(current)))
+ 		ret = do_sys_capset_other_tasks(pid, &effective, &inheritable,
+ 						&permitted);
+ 	else {
+ 		/*
+ 		 * This lock is required even when filesystem
+ 		 * capability support is configured - it protects the
+ 		 * sys_capget() call from returning incorrect data in
+ 		 * the case that the targeted process is not the
+ 		 * current one.
+ 		 */
+ 		spin_lock(&task_capability_lock);
++>>>>>>> audit/for-next:kernel/capability.c
  
 -		ret = security_capset_check(current, &effective, &inheritable,
 -					    &permitted);
 -		/*
 -		 * Having verified that the proposed changes are
 -		 * legal, we now put them into effect.
 -		 */
 -		if (!ret)
 -			security_capset_set(current, &effective, &inheritable,
 -					    &permitted);
 -		spin_unlock(&task_capability_lock);
 -	}
 +	ret = security_capset(new, current_cred(),
 +			      &effective, &inheritable, &permitted);
 +	if (ret < 0)
 +		goto error;
 +
 +	ret = audit_log_capset(pid, new, current_cred());
 +	if (ret < 0)
 +		return ret;
  
 +	return commit_creds(new);
  
 +error:
 +	abort_creds(new);
  	return ret;
  }
  
diff --cc security/commoncap.c
index 7971354,0b88160..0000000
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@@ -265,50 -203,46 +265,93 @@@ int cap_inode_killpriv(struct dentry *d
  	return inode->i_op->removexattr(dentry, XATTR_NAME_CAPS);
  }
  
++<<<<<<< HEAD:security/commoncap.c
 +/*
 + * Calculate the new process capability sets from the capability sets attached
 + * to a file.
 + */
 +static inline int bprm_caps_from_vfs_caps(struct cpu_vfs_cap_data *caps,
 +					  struct linux_binprm *bprm,
 +					  bool *effective)
 +{
 +	struct cred *new = bprm->cred;
 +	unsigned i;
 +	int ret = 0;
 +
 +	if (caps->magic_etc & VFS_CAP_FLAGS_EFFECTIVE)
 +		*effective = true;
 +
 +	CAP_FOR_EACH_U32(i) {
 +		__u32 permitted = caps->permitted.cap[i];
 +		__u32 inheritable = caps->inheritable.cap[i];
 +
 +		/*
 +		 * pP' = (X & fP) | (pI & fI)
 +		 */
 +		new->cap_permitted.cap[i] =
 +			(new->cap_bset.cap[i] & permitted) |
 +			(new->cap_inheritable.cap[i] & inheritable);
 +
 +		if (permitted & ~new->cap_permitted.cap[i])
 +			/* insufficient to execute correctly */
 +			ret = -EPERM;
 +	}
 +
 +	/*
 +	 * For legacy apps, with no internal support for recognizing they
 +	 * do not have enough capabilities, we return an error if they are
 +	 * missing some "forced" (aka file-permitted) capabilities.
 +	 */
 +	return *effective ? ret : 0;
 +}
 +
 +/*
 + * Extract the on-exec-apply capability sets for an executable file.
 + */
 +int get_vfs_caps_from_disk(const struct dentry *dentry, struct cpu_vfs_cap_data *cpu_caps)
 +{
++=======
+ static inline int bprm_caps_from_vfs_caps(struct cpu_vfs_cap_data *caps,
+ 					  struct linux_binprm *bprm)
+ {
+ 	unsigned i;
+ 	int ret = 0;
+ 
+ 	if (caps->magic_etc & VFS_CAP_FLAGS_EFFECTIVE)
+ 		bprm->cap_effective = true;
+ 	else
+ 		bprm->cap_effective = false;
+ 
+ 	CAP_FOR_EACH_U32(i) {
+ 		__u32 permitted = caps->permitted.cap[i];
+ 		__u32 inheritable = caps->inheritable.cap[i];
+ 
+ 		/*
+ 		 * pP' = (X & fP) | (pI & fI)
+ 		 */
+ 		bprm->cap_post_exec_permitted.cap[i] =
+ 			(current->cap_bset.cap[i] & permitted) |
+ 			(current->cap_inheritable.cap[i] & inheritable);
+ 
+ 		if (permitted & ~bprm->cap_post_exec_permitted.cap[i]) {
+ 			/*
+ 			 * insufficient to execute correctly
+ 			 */
+ 			ret = -EPERM;
+ 		}
+ 	}
+ 
+ 	/*
+ 	 * For legacy apps, with no internal support for recognizing they
+ 	 * do not have enough capabilities, we return an error if they are
+ 	 * missing some "forced" (aka file-permitted) capabilities.
+ 	 */
+ 	return bprm->cap_effective ? ret : 0;
+ }
+ 
+ int get_vfs_caps_from_disk(const struct dentry *dentry, struct cpu_vfs_cap_data *cpu_caps)
+ {
++>>>>>>> audit/for-next:security/commoncap.c
  	struct inode *inode = dentry->d_inode;
  	__u32 magic_etc;
  	unsigned tocopy, i;
@@@ -322,9 -256,10 +365,16 @@@
  
  	size = inode->i_op->getxattr((struct dentry *)dentry, XATTR_NAME_CAPS, &caps,
  				   XATTR_CAPS_SZ);
++<<<<<<< HEAD:security/commoncap.c
 +	if (size == -ENODATA || size == -EOPNOTSUPP)
 +		/* no data, that's ok */
 +		return -ENODATA;
++=======
+ 	if (size == -ENODATA || size == -EOPNOTSUPP) {
+ 		/* no data, that's ok */
+ 		return -ENODATA;
+ 	}
++>>>>>>> audit/for-next:security/commoncap.c
  	if (size < 0)
  		return size;
  
@@@ -354,7 -289,6 +404,10 @@@
  		cpu_caps->permitted.cap[i] = le32_to_cpu(caps.data[i].permitted);
  		cpu_caps->inheritable.cap[i] = le32_to_cpu(caps.data[i].inheritable);
  	}
++<<<<<<< HEAD:security/commoncap.c
 +
++=======
++>>>>>>> audit/for-next:security/commoncap.c
  	return 0;
  }
  
@@@ -389,10 -316,7 +442,14 @@@ static int get_file_caps(struct linux_b
  		goto out;
  	}
  
++<<<<<<< HEAD:security/commoncap.c
 +	rc = bprm_caps_from_vfs_caps(&vcaps, bprm, effective);
 +	if (rc == -EINVAL)
 +		printk(KERN_NOTICE "%s: cap_from_disk returned %d for %s\n",
 +		       __func__, rc, bprm->filename);
++=======
+ 	rc = bprm_caps_from_vfs_caps(&vcaps, bprm);
++>>>>>>> audit/for-next:security/commoncap.c
  
  out:
  	dput(dentry);
@@@ -471,47 -356,59 +528,74 @@@ int cap_bprm_set_creds(struct linux_bin
  		 * executables under compatibility mode, we override the
  		 * capability sets for the file.
  		 *
 -		 * If only the real uid is 0, we do not set the effective
 -		 * bit.
 +		 * If only the real uid is 0, we do not set the effective bit.
  		 */
 -		if (bprm->e_uid == 0 || current->uid == 0) {
 +		if (new->euid == 0 || new->uid == 0) {
  			/* pP' = (cap_bset & ~0) | (pI & ~0) */
 -			bprm->cap_post_exec_permitted = cap_combine(
 -				current->cap_bset, current->cap_inheritable
 -				);
 -			bprm->cap_effective = (bprm->e_uid == 0);
 -			ret = 0;
 +			new->cap_permitted = cap_combine(old->cap_bset,
 +							 old->cap_inheritable);
  		}
 +		if (new->euid == 0)
 +			effective = true;
  	}
  
++<<<<<<< HEAD:security/commoncap.c
 +	/* Don't let someone trace a set[ug]id/setpcap binary with the revised
 +	 * credentials unless they have the appropriate permit
 +	 */
 +	if ((new->euid != old->uid ||
 +	     new->egid != old->gid ||
 +	     !cap_issubset(new->cap_permitted, old->cap_permitted)) &&
 +	    bprm->unsafe & ~LSM_UNSAFE_PTRACE_CAP) {
 +		/* downgrade; they get no more than they had, and maybe less */
 +		if (!capable(CAP_SETUID)) {
 +			new->euid = new->uid;
 +			new->egid = new->gid;
++=======
+ 	return ret;
+ }
+ 
+ void cap_bprm_apply_creds (struct linux_binprm *bprm, int unsafe)
+ {
+ 	kernel_cap_t pP = current->cap_permitted;
+ 	kernel_cap_t pE = current->cap_effective;
+ 
+ 	if (bprm->e_uid != current->uid || bprm->e_gid != current->gid ||
+ 	    !cap_issubset(bprm->cap_post_exec_permitted,
+ 			  current->cap_permitted)) {
+ 		set_dumpable(current->mm, suid_dumpable);
+ 		current->pdeath_signal = 0;
+ 
+ 		if (unsafe & ~LSM_UNSAFE_PTRACE_CAP) {
+ 			if (!capable(CAP_SETUID)) {
+ 				bprm->e_uid = current->uid;
+ 				bprm->e_gid = current->gid;
+ 			}
+ 			if (cap_limit_ptraced_target()) {
+ 				bprm->cap_post_exec_permitted = cap_intersect(
+ 					bprm->cap_post_exec_permitted,
+ 					current->cap_permitted);
+ 			}
++>>>>>>> audit/for-next:security/commoncap.c
  		}
 +		if (cap_limit_ptraced_target())
 +			new->cap_permitted = cap_intersect(new->cap_permitted,
 +							   old->cap_permitted);
  	}
  
 -	current->suid = current->euid = current->fsuid = bprm->e_uid;
 -	current->sgid = current->egid = current->fsgid = bprm->e_gid;
 +	new->suid = new->fsuid = new->euid;
 +	new->sgid = new->fsgid = new->egid;
  
 -	/* For init, we want to retain the capabilities set
 -	 * in the init_task struct. Thus we skip the usual
 -	 * capability rules */
 +	/* For init, we want to retain the capabilities set in the initial
 +	 * task.  Thus we skip the usual capability rules
 +	 */
  	if (!is_global_init(current)) {
 -		current->cap_permitted = bprm->cap_post_exec_permitted;
 -		if (bprm->cap_effective)
 -			current->cap_effective = bprm->cap_post_exec_permitted;
 +		if (effective)
 +			new->cap_effective = new->cap_permitted;
  		else
 -			cap_clear(current->cap_effective);
 +			cap_clear(new->cap_effective);
  	}
 +	bprm->cap_effective = effective;
  
  	/*
  	 * Audit candidate if current->cap_effective is set
@@@ -525,38 -422,22 +609,46 @@@
  	 * Number 1 above might fail if you don't have a full bset, but I think
  	 * that is interesting information to audit.
  	 */
++<<<<<<< HEAD:security/commoncap.c
 +	if (!cap_isclear(new->cap_effective)) {
 +		if (!cap_issubset(CAP_FULL_SET, new->cap_effective) ||
 +		    new->euid != 0 || new->uid != 0 ||
 +		    issecure(SECURE_NOROOT)) {
 +			ret = audit_log_bprm_fcaps(bprm, new, old);
 +			if (ret < 0)
 +				return ret;
 +		}
++=======
+ 	if (!cap_isclear(current->cap_effective)) {
+ 		if (!cap_issubset(CAP_FULL_SET, current->cap_effective) ||
+ 		    (bprm->e_uid != 0) || (current->uid != 0) ||
+ 		    issecure(SECURE_NOROOT))
+ 			audit_log_bprm_fcaps(bprm, &pP, &pE);
++>>>>>>> audit/for-next:security/commoncap.c
  	}
  
 -	current->securebits &= ~issecure_mask(SECURE_KEEP_CAPS);
 +	new->securebits &= ~issecure_mask(SECURE_KEEP_CAPS);
 +	return 0;
  }
  
 -int cap_bprm_secureexec (struct linux_binprm *bprm)
 +/**
 + * cap_bprm_secureexec - Determine whether a secure execution is required
 + * @bprm: The execution parameters
 + *
 + * Determine whether a secure execution is required, return 1 if it is, and 0
 + * if it is not.
 + *
 + * The credentials have been committed by this point, and so are no longer
 + * available through @bprm->cred.
 + */
 +int cap_bprm_secureexec(struct linux_binprm *bprm)
  {
 -	if (current->uid != 0) {
 +	const struct cred *cred = current_cred();
 +
 +	if (cred->uid != 0) {
  		if (bprm->cap_effective)
  			return 1;
 -		if (!cap_isclear(bprm->cap_post_exec_permitted))
 +		if (!cap_isclear(cred->cap_permitted))
  			return 1;
  	}
  
