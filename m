From: "Dmitry V. Levin" <ldv@altlinux.org>
Subject: [PATCH] signal: remove unused variable
Date: Thu, 14 Sep 2017 05:44:58 +0300
Message-ID: <20170914024454.GC3324@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vmicros1.altlinux.org ([194.107.17.57]:45926 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751311AbdINCxU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Sep 2017 22:53:20 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 9b24ec57688a ("get_compat_sigset()")
Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
---
 kernel/signal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 3198a7d2e5ff..36a523640894 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3440,7 +3440,6 @@ COMPAT_SYSCALL_DEFINE4(rt_sigaction, int, sig,
 
 	if (act) {
 		compat_uptr_t handler;
-		compat_sigset_t mask;
 		ret = get_user(handler, &act->sa_handler);
 		new_ka.sa.sa_handler = compat_ptr(handler);
 #ifdef __ARCH_HAS_SA_RESTORER

-- 
ldv
