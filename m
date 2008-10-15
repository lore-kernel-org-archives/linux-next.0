From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Wed, 15 Oct 2008 21:12:21 +1100
Message-ID: <20081015211221.1c4a1346.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45002 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752347AbYJOKoL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 06:44:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Frank Mayhar <fmayhar@google.com>, Ingo Molnar <mingo@elte.hu>

Hi David,

Today's linux-next merge of the creds tree got a conflict in
security/selinux/hooks.c between commit
f06febc96ba8e0af80bcc3eaec0a109e88275fac ("timers: fix itimer/many thread
hang") from the timers tree and commit
e87a7f7a60e07326cd18987f1d490e42c083792c ("CRED: Make execve() take
advantage of copy-on-write credentials") from the creds tree.

I think I fixed it up right (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc security/selinux/hooks.c
index 3e3fde7,dffd963..0000000
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@@ -2202,59 -2276,53 +2277,46 @@@ static inline void flush_unauthorized_f
  	spin_unlock(&files->file_lock);
  }
  
- static void selinux_bprm_apply_creds(struct linux_binprm *bprm, int unsafe)
+ /*
+  * Prepare a process for imminent new credential changes due to exec
+  */
+ static void selinux_bprm_committing_creds(struct linux_binprm *bprm)
  {
- 	struct task_security_struct *tsec;
- 	struct bprm_security_struct *bsec;
- 	u32 sid;
- 	int rc;
- 
- 	secondary_ops->bprm_apply_creds(bprm, unsafe);
- 
- 	tsec = current->security;
+ 	struct task_security_struct *new_tsec;
+ 	struct rlimit *rlim, *initrlim;
+ 	int rc, i;
  
- 	bsec = bprm->security;
- 	sid = bsec->sid;
+ 	secondary_ops->bprm_committing_creds(bprm);
  
- 	tsec->osid = tsec->sid;
- 	bsec->unsafe = 0;
- 	if (tsec->sid != sid) {
- 		/* Check for shared state.  If not ok, leave SID
- 		   unchanged and kill. */
- 		if (unsafe & LSM_UNSAFE_SHARE) {
- 			rc = avc_has_perm(tsec->sid, sid, SECCLASS_PROCESS,
- 					PROCESS__SHARE, NULL);
- 			if (rc) {
- 				bsec->unsafe = 1;
- 				return;
- 			}
- 		}
+ 	new_tsec = bprm->cred->security;
+ 	if (new_tsec->sid == new_tsec->osid)
+ 		return;
  
- 		/* Check for ptracing, and update the task SID if ok.
- 		   Otherwise, leave SID unchanged and kill. */
- 		if (unsafe & (LSM_UNSAFE_PTRACE | LSM_UNSAFE_PTRACE_CAP)) {
- 			struct task_struct *tracer;
- 			struct task_security_struct *sec;
- 			u32 ptsid = 0;
+ 	/* Close files for which the new task SID is not authorized. */
+ 	flush_unauthorized_files(bprm->cred, current->files);
  
- 			rcu_read_lock();
- 			tracer = tracehook_tracer_task(current);
- 			if (likely(tracer != NULL)) {
- 				sec = tracer->security;
- 				ptsid = sec->sid;
- 			}
- 			rcu_read_unlock();
+ 	/* Always clear parent death signal on SID transitions. */
+ 	current->pdeath_signal = 0;
  
- 			if (ptsid != 0) {
- 				rc = avc_has_perm(ptsid, sid, SECCLASS_PROCESS,
- 						  PROCESS__PTRACE, NULL);
- 				if (rc) {
- 					bsec->unsafe = 1;
- 					return;
- 				}
- 			}
+ 	/* Check whether the new SID can inherit resource limits from the old
+ 	 * SID.  If not, reset all soft limits to the lower of the current
+ 	 * task's hard limit and the init task's soft limit.
+ 	 *
+ 	 * Note that the setting of hard limits (even to lower them) can be
+ 	 * controlled by the setrlimit check.  The inclusion of the init task's
+ 	 * soft limit into the computation is to avoid resetting soft limits
+ 	 * higher than the default soft limit for cases where the default is
+ 	 * lower than the hard limit, e.g. RLIMIT_CORE or RLIMIT_STACK.
+ 	 */
+ 	rc = avc_has_perm(new_tsec->osid, new_tsec->sid, SECCLASS_PROCESS,
+ 			  PROCESS__RLIMITINH, NULL);
+ 	if (rc) {
+ 		for (i = 0; i < RLIM_NLIMITS; i++) {
+ 			rlim = current->signal->rlim + i;
+ 			initrlim = init_task.signal->rlim+i;
+ 			rlim->rlim_cur = min(rlim->rlim_max, initrlim->rlim_cur);
  		}
- 		tsec->sid = sid;
 -
 -		if (current->signal->rlim[RLIMIT_CPU].rlim_cur != RLIM_INFINITY) {
 -			/*
 -			 * This will cause RLIMIT_CPU calculations to be
 -			 * refigured.
 -			 */
 -			current->it_prof_expires = jiffies_to_cputime(1);
 -		}
++		update_rlimit_cpu(rlim->rlim_cur);
  	}
  }
  
