From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] wm97xx_batery: replace driver_data with dev_get_drvdata()
Date: Tue, 23 Jun 2009 17:50:06 +0400
Message-ID: <1245765006-10863-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.155]:33060 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753847AbZFWNuQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2009 09:50:16 -0400
Received: by fg-out-1718.google.com with SMTP id e12so116650fga.17
        for <linux-next@vger.kernel.org>; Tue, 23 Jun 2009 06:50:19 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, rmk+kernel@arm.linux.org.uk
Cc: gregkh@suse.de, Alexander Beregalov <a.beregalov@gmail.com>

See commit 53d8ba57 (Driver core: move dev_get/set_drvdata to
drivers/base/dd.c)
Fix build.

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/power/wm97xx_battery.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/wm97xx_battery.c b/drivers/power/wm97xx_battery.c
index 8bde921..b787335 100644
--- a/drivers/power/wm97xx_battery.c
+++ b/drivers/power/wm97xx_battery.c
@@ -33,14 +33,14 @@ static enum power_supply_property *prop;
 
 static unsigned long wm97xx_read_bat(struct power_supply *bat_ps)
 {
-	return wm97xx_read_aux_adc(bat_ps->dev->parent->driver_data,
+	return wm97xx_read_aux_adc(dev_get_drvdata(bat_ps->dev->parent),
 					pdata->batt_aux) * pdata->batt_mult /
 					pdata->batt_div;
 }
 
 static unsigned long wm97xx_read_temp(struct power_supply *bat_ps)
 {
-	return wm97xx_read_aux_adc(bat_ps->dev->parent->driver_data,
+	return wm97xx_read_aux_adc(dev_get_drvdata(bat_ps->dev->parent),
 					pdata->temp_aux) * pdata->temp_mult /
 					pdata->temp_div;
 }
-- 
1.6.3.1
