From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Fri, 31 Oct 2008 16:56:06 +1100
Message-ID: <20081031165606.52de69dc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37015 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752472AbYJaGMB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Oct 2008 02:12:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@redhat.com>, Andrew Morton <akpm@linux-foundation.org>

Hi David,

Today's linux-next merge of the creds tree got conflicts in
include/linux/security.h and security/security.c between commit
731572d39fcd3498702eda4600db4c43d51e0b26 ("nfsd: fix vm overcommit
crash") from Linus' tree and commit
a3338909826d32d821158a6adc43ce0a1654b31d ("CRED: Make execve() take
advantage of copy-on-write credentials") from the creds tree.

Just overlapping additions changes. I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/security.h
index c13f1ce,438958c..0000000
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@@ -1585,13 -1561,10 +1561,11 @@@ int security_syslog(int type)
  int security_settime(struct timespec *ts, struct timezone *tz);
  int security_vm_enough_memory(long pages);
  int security_vm_enough_memory_mm(struct mm_struct *mm, long pages);
 +int security_vm_enough_memory_kern(long pages);
- int security_bprm_alloc(struct linux_binprm *bprm);
- void security_bprm_free(struct linux_binprm *bprm);
- void security_bprm_apply_creds(struct linux_binprm *bprm, int unsafe);
- void security_bprm_post_apply_creds(struct linux_binprm *bprm);
- int security_bprm_set(struct linux_binprm *bprm);
+ int security_bprm_set_creds(struct linux_binprm *bprm);
  int security_bprm_check(struct linux_binprm *bprm);
+ void security_bprm_committing_creds(struct linux_binprm *bprm);
+ void security_bprm_committed_creds(struct linux_binprm *bprm);
  int security_bprm_secureexec(struct linux_binprm *bprm);
  int security_sb_alloc(struct super_block *sb);
  void security_sb_free(struct super_block *sb);
diff --cc security/security.c
index c0acfa7,8ad807a..0000000
--- a/security/security.c
+++ b/security/security.c
@@@ -208,41 -199,24 +201,31 @@@ int security_vm_enough_memory_mm(struc
  	return security_ops->vm_enough_memory(mm, pages);
  }
  
 +int security_vm_enough_memory_kern(long pages)
 +{
 +	/* If current->mm is a kernel thread then we will pass NULL,
 +	   for this specific case that is fine */
 +	return security_ops->vm_enough_memory(current->mm, pages);
 +}
 +
- int security_bprm_alloc(struct linux_binprm *bprm)
+ int security_bprm_set_creds(struct linux_binprm *bprm)
  {
- 	return security_ops->bprm_alloc_security(bprm);
+ 	return security_ops->bprm_set_creds(bprm);
  }
  
- void security_bprm_free(struct linux_binprm *bprm)
- {
- 	security_ops->bprm_free_security(bprm);
- }
- 
- void security_bprm_apply_creds(struct linux_binprm *bprm, int unsafe)
- {
- 	security_ops->bprm_apply_creds(bprm, unsafe);
- }
- 
- void security_bprm_post_apply_creds(struct linux_binprm *bprm)
+ int security_bprm_check(struct linux_binprm *bprm)
  {
- 	security_ops->bprm_post_apply_creds(bprm);
+ 	return security_ops->bprm_check_security(bprm);
  }
  
- int security_bprm_set(struct linux_binprm *bprm)
+ void security_bprm_committing_creds(struct linux_binprm *bprm)
  {
- 	return security_ops->bprm_set_security(bprm);
+ 	return security_ops->bprm_committing_creds(bprm);
  }
  
- int security_bprm_check(struct linux_binprm *bprm)
+ void security_bprm_committed_creds(struct linux_binprm *bprm)
  {
- 	return security_ops->bprm_check_security(bprm);
+ 	return security_ops->bprm_committed_creds(bprm);
  }
  
  int security_bprm_secureexec(struct linux_binprm *bprm)
