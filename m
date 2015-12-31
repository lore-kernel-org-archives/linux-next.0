From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the thermal-soc tree
Date: Thu, 31 Dec 2015 12:53:56 +1100
Message-ID: <20151231125356.233ae279@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37158 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752028AbbLaByE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Dec 2015 20:54:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Hi Eduardo,

After merging the thermal-soc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/thermal/thermal_core.c: In function 'trip_point_temp_store':
drivers/thermal/thermal_core.c:764:2: error: too few arguments to function 'thermal_zone_device_update'
  thermal_zone_device_update(tz);   
  ^
drivers/thermal/thermal_core.c:612:6: note: declared here
 void thermal_zone_device_update(struct thermal_zone_device *tz,
      ^

Caused by commit

  ce0265dd6f8e ("thermal: trip_point_temp_store() calls thermal_zone_device_update()")

from the thermal-soc tree interacting with commit

  c4117cc3526e ("thermal: core: enhance thermal_zone_device_update")

from the thermal tree.

I have applied the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 31 Dec 2015 12:47:22 +1100
Subject: [PATCH] thermal: fix for thermal_zone_device_update() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/thermal/thermal_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index bd175218141f..7f7a3caf8892 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -761,7 +761,7 @@ trip_point_temp_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
-	thermal_zone_device_update(tz);
+	thermal_zone_device_update(tz, THERMAL_DEVICE_EVENT_NONE);
 
 	return count;
 }
-- 
2.6.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
