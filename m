From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] zsmalloc: Add missing #include <linux/sched.h>
Date: Tue, 10 Mar 2015 22:46:31 +0100
Message-ID: <1426023991-30407-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:42307 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057AbbCJVqg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2015 17:46:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

mips/allmodconfig:

mm/zsmalloc.c: In function '__zs_compact':
mm/zsmalloc.c:1747:2: error: implicit declaration of function
'cond_resched' [-Werror=implicit-function-declaration]

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
http://kisskb.ellerman.id.au/kisskb/buildresult/12379881/
---
 mm/zsmalloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 73400f0534a773e7..dccc20c208725548 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -91,6 +91,7 @@
 #include <linux/cpu.h>
 #include <linux/vmalloc.h>
 #include <linux/hardirq.h>
+#include <linux/sched.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/debugfs.h>
-- 
1.9.1
