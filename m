From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the limits tree
Date: Fri, 4 Dec 2009 18:55:10 +1100
Message-ID: <20091204185510.3d7e038f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49900 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753539AbZLDHzI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Dec 2009 02:55:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Naohiro Ooiwa <nooiwa@miraclelinux.com>, Jiri Slaby <jslaby@suse.cz>

Hi all,

Today's linux-next merge of the tip tree got a conflict in
kernel/signal.c between commit 65193106e8d5ae20156909c6f050aae272035e07
("core: use helpers for rlimits") from the limits tree and commit
f84d49b218b7d4c6cba2e0b41f24bd4045403962 ("signal: Print warning message
when dropping signals") from the tip tree.

Just some context changes.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/signal.c
index 74dfa5f,6b982f2..0000000
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@@ -207,10 -225,15 +225,15 @@@ __sigqueue_alloc(int sig, struct task_s
  	 */
  	user = get_uid(__task_cred(t)->user);
  	atomic_inc(&user->sigpending);
+ 
  	if (override_rlimit ||
  	    atomic_read(&user->sigpending) <=
- 			task_rlimit(t, RLIMIT_SIGPENDING))
 -			t->signal->rlim[RLIMIT_SIGPENDING].rlim_cur) {
++			task_rlimit(t, RLIMIT_SIGPENDING)) {
  		q = kmem_cache_alloc(sigqueue_cachep, flags);
+ 	} else {
+ 		print_dropped_signal(sig);
+ 	}
+ 
  	if (unlikely(q == NULL)) {
  		atomic_dec(&user->sigpending);
  		free_uid(user);
