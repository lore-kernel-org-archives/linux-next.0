From: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: [PATCH 1/1] [ALSA] SOC: Fix setting codec register with debugfs filesystem merge error
Date: Mon,  3 Nov 2008 12:22:07 -0700
Message-ID: <1225740127-30042-1-git-send-email-troy.kisky@boundarydevices.com>
References: <s5h63n7wz51.wl%tiwai@suse.de>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mpls-qmqp-04.inet.qwest.net ([63.231.195.115]:52644 "EHLO
	mpls-qmqp-04.inet.qwest.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751840AbYKCTsa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 14:48:30 -0500
In-Reply-To: <s5h63n7wz51.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: tiwai@suse.de
Cc: broonie@sirena.org.uk, linux-next@vger.kernel.org, Troy Kisky <troy.kisky@boundarydevices.com>

Call device_create_file only once in snd_soc_dapm_sys_add function.

Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7bf3c40..0fecbb4 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -822,14 +822,8 @@ static DEVICE_ATTR(dapm_widget, 0444, dapm_widget_show, NULL);
 
 int snd_soc_dapm_sys_add(struct device *dev)
 {
-	int ret;
-
 	if (!dapm_status)
 		return 0;
-
-	ret = device_create_file(dev, &dev_attr_dapm_widget);
-	if (ret != 0)
-		return ret;
 	return device_create_file(dev, &dev_attr_dapm_widget);
 }
 
-- 
1.5.4.3
