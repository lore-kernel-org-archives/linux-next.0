From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/2] CPUFREQ: Use static or it won't compile if conservative and ondemand are set =y
Date: Thu,  5 Feb 2009 11:18:29 +0100
Message-ID: <1233829109-23358-3-git-send-email-trenn@suse.de>
References: <1233829109-23358-1-git-send-email-trenn@suse.de>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.suse.de ([195.135.220.2]:33072 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753919AbZBEKSa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 05:18:30 -0500
In-Reply-To: <1233829109-23358-1-git-send-email-trenn@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: davej@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Thomas Renninger <trenn@suse.de>

Signed-off-by: Thomas Renninger <trenn@suse.de>
---
 drivers/cpufreq/cpufreq_conservative.c |    2 +-
 drivers/cpufreq/cpufreq_ondemand.c     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 3aa99e6..8d541c6 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -60,7 +60,7 @@ static unsigned int def_sampling_rate;
  *   - MIN_STAT_SAMPLING_RATE
  * To avoid that userspace shoots itself.
 */
-unsigned int minimum_sampling_rate(void)
+static unsigned int minimum_sampling_rate(void)
 {
 	return max(def_sampling_rate / 10, MIN_STAT_SAMPLING_RATE);
 }
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index 3220749..338f428 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -58,7 +58,7 @@ static unsigned int def_sampling_rate;
  *   - MIN_STAT_SAMPLING_RATE
  * To avoid that userspace shoots itself.
 */
-unsigned int minimum_sampling_rate(void)
+static unsigned int minimum_sampling_rate(void)
 {
 	return max(def_sampling_rate / 10, MIN_STAT_SAMPLING_RATE);
 }
-- 
1.6.0.2
