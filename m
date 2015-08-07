From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the char-misc tree
Date: Fri, 7 Aug 2015 16:32:14 +1000
Message-ID: <20150807163214.25c10a5f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56171 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752142AbbHGGcQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Aug 2015 02:32:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>, Andy Lutomirski <luto@kernel.org>

Hi all,

After merging the char-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/hv/hv.c: In function 'read_hv_clock_tsc':
drivers/hv/hv.c:154:4: error: implicit declaration of function 'rdtscll' [-Werror=implicit-function-declaration]
    rdtscll(cur_tsc);
    ^

Caused by commit

  ca9357bd26c2 ("Drivers: hv: vmbus: Implement a clocksource based on the TSC page")

interacting with commits

  87be28aaf145 ("x86/asm/tsc: Replace rdtscll() with native_read_tsc()")
  4ea1636b04db ("x86/asm/tsc: Rename native_read_tsc() to rdtsc()")

from the tip tree.

Please consider maintaining API's for a release cycle when changing them.

I have applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 7 Aug 2015 16:21:32 +1000
Subject: [PATCH] Drivers: hv: vmbus: fix for the removal of rdtscll()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/hv/hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
index 6341be8739ae..335064f01c37 100644
--- a/drivers/hv/hv.c
+++ b/drivers/hv/hv.c
@@ -151,7 +151,7 @@ static cycle_t read_hv_clock_tsc(struct clocksource *arg)
 			u64 scale = tsc_pg->tsc_scale;
 			s64 offset = tsc_pg->tsc_offset;
 
-			rdtscll(cur_tsc);
+			cur_tsc = rdtsc();
 			/* current_tick = ((cur_tsc *scale) >> 64) + offset */
 			asm("mulq %3"
 				: "=d" (current_tick), "=a" (tmp)
-- 
2.5.0

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
