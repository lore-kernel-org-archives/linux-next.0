From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Wed, 15 Oct 2008 20:55:22 +1100
Message-ID: <20081015205522.bcd25de3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44979 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751885AbYJOKn7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 06:43:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Frank Mayhar <fmayhar@google.com>, Ingo Molnar <mingo@elte.hu>

Hi David,

Today's linux-next merge of the creds tree got a conflict in
kernel/fork.c between commit f06febc96ba8e0af80bcc3eaec0a109e88275fac
("timers: fix itimer/many thread hang") from the timers tree and commit
3ef958261a38aaf9a7baab6565def2680e5743ed ("CRED: Separate per-task-group
keyrings from signal_struct") from the creds tree.

Overlapping addition/removal.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/fork.c
index d8de863,e392e5a..0000000
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@@ -794,15 -761,11 +793,14 @@@ static void posix_cpu_timers_init_group
  static int copy_signal(unsigned long clone_flags, struct task_struct *tsk)
  {
  	struct signal_struct *sig;
- 	int ret;
  
  	if (clone_flags & CLONE_THREAD) {
 -		atomic_inc(&current->signal->count);
 -		atomic_inc(&current->signal->live);
 -		return 0;
 +		ret = thread_group_cputime_clone_thread(current);
 +		if (likely(!ret)) {
 +			atomic_inc(&current->signal->count);
 +			atomic_inc(&current->signal->live);
 +		}
 +		return ret;
  	}
  	sig = kmem_cache_alloc(signal_cachep, GFP_KERNEL);
  	tsk->signal = sig;
@@@ -858,8 -830,6 +850,7 @@@
  
  void __cleanup_signal(struct signal_struct *sig)
  {
 +	thread_group_cputime_free(sig);
- 	exit_thread_group_keys(sig);
  	tty_kref_put(sig->tty);
  	kmem_cache_free(signal_cachep, sig);
  }
