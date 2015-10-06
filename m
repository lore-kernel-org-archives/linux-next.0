From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Tue, 6 Oct 2015 18:03:25 +1100
Message-ID: <20151006180325.42fc9b17@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

kernel/time/clocksource.c: In function 'clocksource_watchdog':
kernel/time/clocksource.c:220:3: error: implicit declaration of function 'abs64' [-Werror=implicit-function-declaration]
   if (abs64(cs_nsec - wd_nsec) > WATCHDOG_THRESHOLD) {
   ^

Caused by commit

  67dfae0cd72f ("clocksource: Fix abs() usage w/ 64bit values")

>From Linus' tree interacting with commit

  e75a4c084376 ("Remove abs64()")

from the akpm tree.

I have applied the following fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 6 Oct 2015 17:59:03 +1100
Subject: [PATCH] clocksource: Fix for "Remove abs64()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/time/clocksource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index f2c9b06c8ab7..6b473e4b2dad 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -217,7 +217,7 @@ static void clocksource_watchdog(unsigned long data)
 			continue;
 
 		/* Check the deviation from the watchdog clocksource. */
-		if (abs64(cs_nsec - wd_nsec) > WATCHDOG_THRESHOLD) {
+		if (abs(cs_nsec - wd_nsec) > WATCHDOG_THRESHOLD) {
 			pr_warn("timekeeping watchdog: Marking clocksource '%s' as unstable because the skew is too large:\n",
 				cs->name);
 			pr_warn("                      '%s' wd_now: %llx wd_last: %llx mask: %llx\n",
-- 
2.5.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
