From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Fri, 7 Nov 2008 18:49:34 +1100
Message-ID: <20081107184934.8ad8b6ca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54172 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750929AbYKGHtl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 02:49:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>

Hi David,

Today's linux-next merge of the creds tree got conflicts in
security/selinux/hooks.c between commit
8b6a5a37f87a414ef8636e36ec75accb27bb7508 ("") from the security-testing
tree and commit selinux_dentry_open ("CRED: Make inode_has_perm() and
file_has_perm() take a cred pointer") from the creds tree.

Just overlapping changes.  I fixed it up (see below) and can carry the
fix.

The file also got a conflict between commit
41d9f9c524a53477467b7e0111ff3d644198f191 ("SELinux: hold tasklist_lock
and siglock while waking wait_chldexit") from the security-testing tree
and commit a3338909826d32d821158a6adc43ce0a1654b31d ("CRED: Make execve()
take advantage of copy-on-write credentials") from the creds tree.

This was more complex but I fixed it up as best I could (see below) and
can carry the fix.  Please let me know if it is not correct (or could be
better).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc security/selinux/hooks.c
index eb7955d,b530cd1..0000000
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@@ -2262,39 -2323,32 +2324,34 @@@ static void selinux_bprm_committing_cre
  }
  
  /*
-  * called after apply_creds without the task lock held
+  * Clean up the process immediately after the installation of new credentials
+  * due to exec
   */
- static void selinux_bprm_post_apply_creds(struct linux_binprm *bprm)
+ static void selinux_bprm_committed_creds(struct linux_binprm *bprm)
  {
- 	struct task_security_struct *tsec;
- 	struct rlimit *rlim, *initrlim;
+ 	const struct task_security_struct *tsec = current_security();
  	struct itimerval itimer;
- 	struct bprm_security_struct *bsec;
 +	struct sighand_struct *psig;
+ 	u32 osid, sid;
  	int rc, i;
 +	unsigned long flags;
  
- 	tsec = current->security;
- 	bsec = bprm->security;
+ 	secondary_ops->bprm_committed_creds(bprm);
  
- 	if (bsec->unsafe) {
- 		force_sig_specific(SIGKILL, current);
- 		return;
- 	}
- 	if (tsec->osid == tsec->sid)
+ 	osid = tsec->osid;
+ 	sid = tsec->sid;
+ 
+ 	if (sid == osid)
  		return;
  
- 	/* Close files for which the new task SID is not authorized. */
- 	flush_unauthorized_files(current->files);
- 
- 	/* Check whether the new SID can inherit signal state
- 	   from the old SID.  If not, clear itimers to avoid
- 	   subsequent signal generation and flush and unblock
- 	   signals. This must occur _after_ the task SID has
- 	  been updated so that any kill done after the flush
- 	  will be checked against the new SID. */
- 	rc = avc_has_perm(tsec->osid, tsec->sid, SECCLASS_PROCESS,
- 			  PROCESS__SIGINH, NULL);
+ 	/* Check whether the new SID can inherit signal state from the old SID.
+ 	 * If not, clear itimers to avoid subsequent signal generation and
+ 	 * flush and unblock signals.
+ 	 *
+ 	 * This must occur _after_ the task SID has been updated so that any
+ 	 * kill done after the flush will be checked against the new SID.
+ 	 */
+ 	rc = avc_has_perm(osid, sid, SECCLASS_PROCESS, PROCESS__SIGINH, NULL);
  	if (rc) {
  		memset(&itimer, 0, sizeof itimer);
  		for (i = 0; i < 3; i++)
@@@ -2307,38 -2361,9 +2364,14 @@@
  		spin_unlock_irq(&current->sighand->siglock);
  	}
  
- 	/* Always clear parent death signal on SID transitions. */
- 	current->pdeath_signal = 0;
- 
- 	/* Check whether the new SID can inherit resource limits
- 	   from the old SID.  If not, reset all soft limits to
- 	   the lower of the current task's hard limit and the init
- 	   task's soft limit.  Note that the setting of hard limits
- 	   (even to lower them) can be controlled by the setrlimit
- 	   check. The inclusion of the init task's soft limit into
- 	   the computation is to avoid resetting soft limits higher
- 	   than the default soft limit for cases where the default
- 	   is lower than the hard limit, e.g. RLIMIT_CORE or
- 	   RLIMIT_STACK.*/
- 	rc = avc_has_perm(tsec->osid, tsec->sid, SECCLASS_PROCESS,
- 			  PROCESS__RLIMITINH, NULL);
- 	if (rc) {
- 		for (i = 0; i < RLIM_NLIMITS; i++) {
- 			rlim = current->signal->rlim + i;
- 			initrlim = init_task.signal->rlim+i;
- 			rlim->rlim_cur = min(rlim->rlim_max, initrlim->rlim_cur);
- 		}
- 		update_rlimit_cpu(rlim->rlim_cur);
- 	}
- 
  	/* Wake up the parent if it is waiting so that it can
  	   recheck wait permission to the new task SID. */
 +	read_lock_irq(&tasklist_lock);
 +	psig = current->parent->sighand;
 +	spin_lock_irqsave(&psig->siglock, flags);
  	wake_up_interruptible(&current->parent->signal->wait_chldexit);
 +	spin_unlock_irqrestore(&psig->siglock, flags);
 +	read_unlock_irq(&tasklist_lock);
  }
  
  /* superblock security operations */
@@@ -2657,8 -2691,8 +2699,8 @@@ static int selinux_inode_permission(str
  		return 0;
  	}
  
- 	return inode_has_perm(current, inode,
+ 	return inode_has_perm(cred, inode,
 -			      open_file_mask_to_av(inode->i_mode, mask), NULL);
 +			      file_mask_to_av(inode->i_mode, mask), NULL);
  }
  
  static int selinux_inode_setattr(struct dentry *dentry, struct iattr *iattr)
@@@ -3174,7 -3225,7 +3233,7 @@@ static int selinux_dentry_open(struct f
  	 * new inode label or new policy.
  	 * This check is not redundant - do not remove.
  	 */
- 	return inode_has_perm(current, inode, open_file_to_av(file), NULL);
 -	return inode_has_perm(cred, inode, file_to_av(file), NULL);
++	return inode_has_perm(cred, inode, open_file_to_av(file), NULL);
  }
  
  /* task security operations */
