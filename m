From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the battery tree with Linus' tree
Date: Mon, 7 Sep 2009 14:52:01 +1000
Message-ID: <20090907145201.34704d7b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754718AbZIGEwE@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Alexander Beregalov <a.beregalov@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>
List-Id: linux-next.vger.kernel.org

Hi Anton,

Today's linux-next merge of the battery tree got a conflict in
drivers/power/wm97xx_battery.c between commit
38c7dc373029e4666b17850054dd43c1c96bb264 ("wm97xx_batery: replace
driver_data with dev_get_drvdata()") from Linus' tree and commit
b8bdc1d0cfc488ac0d94724639f9a61b0a5a1d40 ("wm97xx_battery: Use
platform_data") from the battery tree.

Just context changes.  I fixed it up (see below) and can carry the fixes
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/power/wm97xx_battery.c
index b787335,c552082c..0000000
--- a/drivers/power/wm97xx_battery.c
+++ b/drivers/power/wm97xx_battery.c
@@@ -33,14 -33,20 +33,20 @@@ static enum power_supply_property *prop
  
  static unsigned long wm97xx_read_bat(struct power_supply *bat_ps)
  {
+ 	struct wm97xx_pdata *wmdata = bat_ps->dev->parent->platform_data;
+ 	struct wm97xx_batt_pdata *pdata = wmdata->batt_pdata;
+ 
 -	return wm97xx_read_aux_adc(bat_ps->dev->parent->driver_data,
 +	return wm97xx_read_aux_adc(dev_get_drvdata(bat_ps->dev->parent),
  					pdata->batt_aux) * pdata->batt_mult /
  					pdata->batt_div;
  }
  
  static unsigned long wm97xx_read_temp(struct power_supply *bat_ps)
  {
+ 	struct wm97xx_pdata *wmdata = bat_ps->dev->parent->platform_data;
+ 	struct wm97xx_batt_pdata *pdata = wmdata->batt_pdata;
+ 
 -	return wm97xx_read_aux_adc(bat_ps->dev->parent->driver_data,
 +	return wm97xx_read_aux_adc(dev_get_drvdata(bat_ps->dev->parent),
  					pdata->temp_aux) * pdata->temp_mult /
  					pdata->temp_div;
  }
