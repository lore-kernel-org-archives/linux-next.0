From: <michael.hennerich@analog.com>
Subject: [PATCH] video: backlight: adp8870: Fix warn_unused_result warning reported by Stephen Rothwell
Date: Fri, 29 Oct 2010 16:54:26 +0200
Message-ID: <1288364066-18709-1-git-send-email-michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nwd2mail10.analog.com ([137.71.25.55]:60016 "EHLO
	nwd2mail10.analog.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757194Ab0J2PBV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Oct 2010 11:01:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, device-drivers-devel@blackfin.uclinux.org, drivers@analog.com, rpurdie@linux.intel.com, linux-next@vger.kernel.org, sfr@canb.auug.org.au, Michael Hennerich <michael.hennerich@analog.com>

From: Michael Hennerich <michael.hennerich@analog.com>

handle return value, strict_strtoul is declared with attribute warn_unused_result

Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
---
 drivers/video/backlight/adp8860_bl.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/video/backlight/adp8860_bl.c b/drivers/video/backlight/adp8860_bl.c
index 3ec2460..8746303 100644
--- a/drivers/video/backlight/adp8860_bl.c
+++ b/drivers/video/backlight/adp8860_bl.c
@@ -502,8 +502,10 @@ static ssize_t adp8860_bl_l1_daylight_max_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t count)
 {
 	struct adp8860_bl *data = dev_get_drvdata(dev);
+	int ret = strict_strtoul(buf, 10, &data->cached_daylight_max);
+	if (ret)
+		return ret;
 
-	strict_strtoul(buf, 10, &data->cached_daylight_max);
 	return adp8860_store(dev, buf, count, ADP8860_BLMX1);
 }
 static DEVICE_ATTR(l1_daylight_max, 0664, adp8860_bl_l1_daylight_max_show,
-- 
1.6.0.2
