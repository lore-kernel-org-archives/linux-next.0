From: "Richard A. Holden III" <aciddeath@gmail.com>
Subject: [PATCH] Fix arch/x86/kernel/cpu/mtrr/main.c build warning
Date: Thu, 20 Nov 2008 11:03:21 -0700
Message-ID: <1227204203-32112-1-git-send-email-aciddeath@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.238]:10640 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753543AbYKTRBb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Nov 2008 12:01:31 -0500
Received: by rv-out-0506.google.com with SMTP id k40so541081rvb.1
        for <linux-next@vger.kernel.org>; Thu, 20 Nov 2008 09:01:30 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Fix
arch/x86/kernel/cpu/mtrr/main.c: In function 'mtrr_bp_init':
arch/x86/kernel/cpu/mtrr/main.c:1364: warning: 'gran_base' may be used uninitialized in this function

gran_base is only used within the if (debug_print) sections of the for loop, so combine both sections
and move the declaration to within if (debug_print). The overhead of to_size_factor may be a consideration
but the compiler should be able to optimize out the multiple calls.

Signed-off-by: Richard A. Holden III <aciddeath@gmail.com>
---
 arch/x86/kernel/cpu/mtrr/main.c |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/mtrr/main.c b/arch/x86/kernel/cpu/mtrr/main.c
index c091d06..b751e3a 100644
--- a/arch/x86/kernel/cpu/mtrr/main.c
+++ b/arch/x86/kernel/cpu/mtrr/main.c
@@ -1360,20 +1360,16 @@ static int __init mtrr_cleanup(unsigned address_bits)
 	memset(min_loss_pfn, 0xff, sizeof(min_loss_pfn));
 	memset(result, 0, sizeof(result));
 	for (gran_size = (1ULL<<16); gran_size < (1ULL<<32); gran_size <<= 1) {
-		char gran_factor;
-		unsigned long gran_base;
-
-		if (debug_print)
-			gran_base = to_size_factor(gran_size >> 10, &gran_factor);
 
 		for (chunk_size = gran_size; chunk_size < (1ULL<<32);
 		     chunk_size <<= 1) {
 			int num_reg;
 
 			if (debug_print) {
-				char chunk_factor;
-				unsigned long chunk_base;
+				char gran_factor, chunk_factor;
+				unsigned long gran_base, chunk_base;
 
+				gran_base = to_size_factor(gran_size >> 10, &gran_factor);
 				chunk_base = to_size_factor(chunk_size>>10, &chunk_factor),
 				printk(KERN_INFO "\n");
 				printk(KERN_INFO "gran_size: %ld%c   chunk_size: %ld%c \n",
-- 
1.5.6.4
