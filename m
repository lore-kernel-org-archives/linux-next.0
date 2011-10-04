From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the omap_dss2 tree with the arm-soc
 tree
Date: Tue, 4 Oct 2011 15:06:49 +1100
Message-ID: <20111004150649.345c9046ba1984216112aec7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>
List-Id: linux-next.vger.kernel.org

Hi Tomi,

Today's linux-next merge of the omap_dss2 tree got a conflict in
arch/arm/mach-omap2/board-2430sdp.c between commit 8f5b5a41ebc7 ("ARM:
OMAP: Introduce SoC specific early_init") from the arm-soc tree and
commit 6e896ff9ff1c ("OMAP: 2420SDP: Port the display driver to new
DSS2") from the omap_dss2 tree.

Just context changes.  I fixed it up (I think - see below) and can carry
the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-omap2/board-2430sdp.c
index 4191743,6ab6350..0000000
--- a/arch/arm/mach-omap2/board-2430sdp.c
+++ b/arch/arm/mach-omap2/board-2430sdp.c
@@@ -137,10 -192,12 +192,6 @@@ static inline void board_smc91x_init(vo
  
  #endif
  
- static struct omap_board_config_kernel sdp2430_config[] __initdata = {
- 	{OMAP_TAG_LCD, &sdp2430_lcd_config},
- };
- 
 -static void __init omap_2430sdp_init_early(void)
 -{
 -	omap2_init_common_infrastructure();
 -	omap2_init_common_devices(NULL, NULL);
 -}
 -
  static struct regulator_consumer_supply sdp2430_vmmc1_supplies[] = {
  	REGULATOR_SUPPLY("vmmc", "omap_hsmmc.0"),
  };
