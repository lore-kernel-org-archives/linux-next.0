From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the security-testing tree with the arm
 tree
Date: Thu, 3 Sep 2009 15:47:00 +1000
Message-ID: <20090903154700.2d4538cf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34413 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754276AbZICFrB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Sep 2009 01:47:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mikael Pettersson <mikpe@it.uu.se>, Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>

Hi James,

Today's linux-next merge of the security-testing tree got a conflicts in
arch/arm/kernel/signal.c between commit
369842658a36bcea28ecb643ba4bdb53919330dd ("ARM: 5677/1: ARM support for
TIF_RESTORE_SIGMASK/pselect6/ppoll/epoll_pwait") from the arm tree and
commits d0420c83f39f79afb82010c2d2cafd150eef651b ("KEYS: Extend
TIF_NOTIFY_RESUME to (almost) all architectures [try #6]") and
ee18d64c1f632043a02e6f5ba5e045bb26a5465f ("KEYS: Add a keyctl to install
a process's session keyring on its parent [try #6]") from the
security-testing tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/kernel/signal.c
index f7194e4,ea4ad3a..0000000
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@@ -694,5 -706,12 +694,12 @@@ asmlinkage voi
  do_notify_resume(struct pt_regs *regs, unsigned int thread_flags, int syscall)
  {
  	if (thread_flags & _TIF_SIGPENDING)
 -		do_signal(&current->blocked, regs, syscall);
 +		do_signal(regs, syscall);
+ 
+ 	if (thread_flags & _TIF_NOTIFY_RESUME) {
+ 		clear_thread_flag(TIF_NOTIFY_RESUME);
+ 		tracehook_notify_resume(regs);
+ 		if (current->replacement_session_keyring)
+ 			key_replace_session_keyring();
+ 	}
  }
