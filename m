From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the omap_dss2 tree with the omap tree
Date: Thu, 17 Feb 2011 13:10:19 +1100
Message-ID: <20110217131019.62ca3c27.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53767 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755497Ab1BQCKZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Feb 2011 21:10:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@nokia.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Charulatha V <charu@ti.com>, "Govindraj.R" <govindraj.raja@ti.com>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Senthilvadivu Guruswamy <svadivu@ti.com>, Sumit Semwal <sumit.semwal@ti.com>

Hi Tomi,

Today's linux-next merge of the omap_dss2 tree got a conflict in
arch/arm/mach-omap2/omap_hwmod_2430_data.c between commit
1ae9e33689d1346f7f85845857639a923e0796e3 ("OMAP2430: hwmod data: Add
McSPI") from the omap tree and commit
452e3eed4ee6eb8d61b290dad53d48508a3438d8 ("OMAP2430: hwmod data: add DSS
DISPC RFBI VENC") from the omap_dss2 tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-omap2/omap_hwmod_2430_data.c
index 60fe4aa,1ef3f3f..0000000
--- a/arch/arm/mach-omap2/omap_hwmod_2430_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_2430_data.c
@@@ -18,7 -18,7 +18,8 @@@
  #include <plat/serial.h>
  #include <plat/i2c.h>
  #include <plat/gpio.h>
 +#include <plat/mcspi.h>
+ #include <plat/l3_2xxx.h>
  
  #include "omap_hwmod_common_data.h"
  
