From: Andreas Herrmann <andreas.herrmann3@amd.com>
Subject: [PATCH] x86: memtest: fix compile warning
Date: Thu, 11 Jun 2009 12:29:27 +0200
Message-ID: <20090611102927.GE12431@alberich.amd.com>
References: <20090611112746.802a24cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]:36408 "EHLO
	TX2EHSOBE010.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757491AbZFKKpb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2009 06:45:31 -0400
Content-Disposition: inline
In-Reply-To: <20090611112746.802a24cb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Commit c9690998ef48ffefeccb91c70a7739eebdea57f9
(x86: memtest: remove 64-bit division) introduced following compile warning:

 arch/x86/mm/memtest.c: In function 'memtest':
 arch/x86/mm/memtest.c:56: warning: comparison of distinct pointer types lacks a cast
 arch/x86/mm/memtest.c:58: warning: comparison of distinct pointer types lacks a cast

Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>
---
 arch/x86/mm/memtest.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

Sorry.
Please apply.

Thanks,
Andreas

diff --git a/arch/x86/mm/memtest.c b/arch/x86/mm/memtest.c
index c0bedcd..1a8b48f 100644
--- a/arch/x86/mm/memtest.c
+++ b/arch/x86/mm/memtest.c
@@ -53,9 +53,9 @@ static void __init memtest(u64 pattern, u64 start_phys, u64 size)
 	start_bad = 0;
 	last_bad = 0;
 
-	for (p = start; p < end; p++)
+	for (p = start; (void *) p < end; p++)
 		*p = pattern;
-	for (p = start; p < end; p++, start_phys_aligned += incr) {
+	for (p = start; (void *) p < end; p++, start_phys_aligned += incr) {
 		if (*p == pattern)
 			continue;
 		if (start_phys_aligned == last_bad + incr) {
-- 
1.6.3.1
