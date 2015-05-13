From: Pawel Moll <pawel.moll@arm.com>
Subject: [PATCH] bus: arm-ccn: Use hrtimer_start()
Date: Wed, 13 May 2015 16:21:24 +0100
Message-ID: <1431530484-3389-1-git-send-email-pawel.moll@arm.com>
References: <alpine.DEB.2.11.1505131712320.4225@nanos>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:36460 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934441AbbEMPWA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 May 2015 11:22:00 -0400
In-Reply-To: <alpine.DEB.2.11.1505131712320.4225@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>

hrtimer_start() does not longer defer already expired timers to the
softirq. Get rid of the __hrtimer_start_range_ns() invocation.

Reported-by: Mark Brown <mark.brown@arm.com>
Signed-off-by: Pawel Moll <pawel.moll@arm.com>
---

Arnd, Olof, Kevin,

This patch solves the linux-next build issue reported by Mark Brown:

http://article.gmane.org/gmane.linux.kernel.next/35377

and is an equivalent of the following change:

http://marc.info/?l=linux-kernel&m=142904610220085

Could you, please, queue it?

Thanks!

 drivers/bus/arm-ccn.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/arm-ccn.c b/drivers/bus/arm-ccn.c
index df5f307..7d9879e 100644
--- a/drivers/bus/arm-ccn.c
+++ b/drivers/bus/arm-ccn.c
@@ -921,9 +921,8 @@ static void arm_ccn_pmu_event_start(struct perf_event *event, int flags)
 	 * attribute).
 	 */
 	if (!ccn->irq)
-		__hrtimer_start_range_ns(&ccn->dt.hrtimer,
-				arm_ccn_pmu_timer_period(), 0,
-				HRTIMER_MODE_REL_PINNED, 0);
+		hrtimer_start(&ccn->dt.hrtimer, arm_ccn_pmu_timer_period(),
+				HRTIMER_MODE_REL_PINNED);
 
 	/* Set the DT bus input, engaging the counter */
 	arm_ccn_pmu_xp_dt_config(event, 1);
-- 
2.1.0
