From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the omap_dss2 tree with the arm-soc
 tree
Date: Tue, 4 Oct 2011 15:06:40 +1100
Message-ID: <20111004150640.1dee91eae44e71729ccce90c@canb.auug.org.au>
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
arch/arm/mach-omap2/board-h4.c between commit 8f5b5a41ebc7 ("ARM: OMAP:
Introduce SoC specific early_init") from the arm-soc tree and commit
cbf1455bfc9f ("OMAP: H4: Port the display driver to new DSS2") from the
omap_dss2 tree.

Just context changes.  I fixed it up (I think - see below) and can carry
the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/arm/mach-omap2/board-h4.c
index f0ddc27,f7c09de..0000000
--- a/arch/arm/mach-omap2/board-h4.c
+++ b/arch/arm/mach-omap2/board-h4.c
@@@ -285,10 -301,12 +300,6 @@@ static struct omap_usb_config h4_usb_co
  	.hmc_mode	= 0x00,		/* 0:dev|otg 1:disable 2:disable */
  };
  
- static struct omap_board_config_kernel h4_config[] __initdata = {
- 	{ OMAP_TAG_LCD,		&h4_lcd_config },
- };
- 
 -static void __init omap_h4_init_early(void)
 -{
 -	omap2_init_common_infrastructure();
 -	omap2_init_common_devices(NULL, NULL);
 -}
 -
  static void __init omap_h4_init_irq(void)
  {
  	omap2_init_irq();
@@@ -364,8 -379,9 +372,10 @@@ static void __init omap_h4_init(void
  	platform_add_devices(h4_devices, ARRAY_SIZE(h4_devices));
  	omap2_usbfs_init(&h4_usb_config);
  	omap_serial_init();
 +	omap_sdrc_init(NULL, NULL);
  	h4_init_flash();
+ 
+ 	omap_display_init(&h4_dss_data);
  }
  
  static void __init omap_h4_map_io(void)
