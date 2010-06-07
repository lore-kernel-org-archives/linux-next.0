From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (tile tree
 related)
Date: Mon, 7 Jun 2010 14:01:40 +1000
Message-ID: <20100607140140.870c0fb5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51337 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751077Ab0FGEBu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jun 2010 00:01:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Metcalf <cmetcalf@tilera.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>

Hi Chris,

After merging the final tree, today's linux-next build (sparc32 defconfig)
failed like this:

arch/sparc/kernel/sys_sparc_32.c:229: error: conflicting types for 'sys_rt_sigaction'
include/linux/syscalls.h:367: note: previous declaration of 'sys_rt_sigaction' was here

Caused by commit 5360bd776f73d0a7da571d72a09a03f237e99900 ("Fix up the
"generic" unistd.h ABI to be more useful") from the tile tree.  Sparc's
sys_rt_sigaction has an extra argument.

I applied this patch for today.  Something better could probably be
done.  I note that there is already a declaration of sys_rt_sigaction in
include/asm-generic/syscalls.h ...

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 7 Jun 2010 13:49:46 +1000
Subject: [PATCH] Only declare sys_rt_sigaction if it is wanted.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/syscalls.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 61663cb..4193907 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -364,9 +364,11 @@ asmlinkage long sys_init_module(void __user *umod, unsigned long len,
 asmlinkage long sys_delete_module(const char __user *name_user,
 				unsigned int flags);
 
+#ifdef __ARCH_WANT_SYS_RT_SIGACTION
 asmlinkage long sys_rt_sigaction(int sig, const struct sigaction __user *act,
 				 struct sigaction __user *oact,
 				 size_t sigsetsize);
+#endif
 asmlinkage long sys_rt_sigprocmask(int how, sigset_t __user *set,
 				sigset_t __user *oset, size_t sigsetsize);
 asmlinkage long sys_rt_sigpending(sigset_t __user *set, size_t sigsetsize);
-- 
1.7.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
