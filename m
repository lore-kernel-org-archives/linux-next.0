From: Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH] xtensa: pull signal definitions from signal-defs.h
Date: Tue,  8 Jan 2013 08:48:42 +0400
Message-ID: <1357620522-20696-1-git-send-email-jcmvbkbc@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:55383 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214Ab3AHE4e (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jan 2013 23:56:34 -0500
Received: by mail-la0-f52.google.com with SMTP id fq12so19603lab.11
        for <linux-next@vger.kernel.org>; Mon, 07 Jan 2013 20:56:33 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Chris Zankel <chris@zankel.net>, linux-next@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>

This fixes the following build error in the current linux-next:

include/linux/signal.h:261:2: error: unknown type name '__sigrestore_t'
make[2]: *** [arch/xtensa/kernel/asm-offsets.s] Error 1
make[1]: *** [prepare0] Error 2
make: *** [sub-make] Error 2

that appeared after 32dae82 'consolidate kernel-side struct sigaction declarations'

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/uapi/asm/signal.h |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/arch/xtensa/include/uapi/asm/signal.h b/arch/xtensa/include/uapi/asm/signal.h
index dacf716..586756e 100644
--- a/arch/xtensa/include/uapi/asm/signal.h
+++ b/arch/xtensa/include/uapi/asm/signal.h
@@ -102,16 +102,7 @@ typedef struct {
 
 #ifndef __ASSEMBLY__
 
-#define SIG_BLOCK          0	/* for blocking signals */
-#define SIG_UNBLOCK        1	/* for unblocking signals */
-#define SIG_SETMASK        2	/* for setting the signal mask */
-
-/* Type of a signal handler.  */
-typedef void (*__sighandler_t)(int);
-
-#define SIG_DFL	((__sighandler_t)0)	/* default signal handling */
-#define SIG_IGN	((__sighandler_t)1)	/* ignore signal */
-#define SIG_ERR	((__sighandler_t)-1)	/* error return from signal */
+#include <asm-generic/signal-defs.h>
 
 #ifndef __KERNEL__
 
-- 
1.7.7.6
