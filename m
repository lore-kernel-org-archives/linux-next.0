From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the omap_dss2 tree with the arm-soc
 tree
Date: Tue, 4 Oct 2011 15:06:44 +1100
Message-ID: <20111004150644.f05eb7f6b12059d5b0c4573b@canb.auug.org.au>
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
arch/arm/mach-omap2/board-apollon.c between commit a4ca9dbe44a1 ("ARM:
OMAP: Move omap2_init_common_devices out of init_early") from the arm-soc
tree and commit da91e89fb2f5 ("OMAP: Apollon: Port the display driver to
new DSS2") from the omap_dss2 tree.

Just context changes.  I fixed it up (I think - see below) and can carry
the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-omap2/board-apollon.c
index 868d5f0,d8eb81e..0000000
--- a/arch/arm/mach-omap2/board-apollon.c
+++ b/arch/arm/mach-omap2/board-apollon.c
@@@ -265,14 -262,34 +262,28 @@@ static struct omap_usb_config apollon_u
  	.pins[0]	= 6,
  };
  
- static struct omap_lcd_config apollon_lcd_config __initdata = {
- 	.ctrl_name	= "internal",
+ static struct panel_generic_dpi_data apollon_panel_data = {
+ 	.name			= "apollon",
  };
  
- static struct omap_board_config_kernel apollon_config[] __initdata = {
- 	{ OMAP_TAG_LCD,		&apollon_lcd_config },
+ static struct omap_dss_device apollon_lcd_device = {
+ 	.name			= "lcd",
+ 	.driver_name		= "generic_dpi_panel",
+ 	.type			= OMAP_DISPLAY_TYPE_DPI,
+ 	.phy.dpi.data_lines	= 18,
+ 	.data			= &apollon_panel_data,
+ };
+ 
+ static struct omap_dss_device *apollon_dss_devices[] = {
+ 	&apollon_lcd_device,
+ };
+ 
+ static struct omap_dss_board_info apollon_dss_data = {
+ 	.num_devices	= ARRAY_SIZE(apollon_dss_devices),
+ 	.devices	= apollon_dss_devices,
+ 	.default_device	= &apollon_lcd_device,
  };
  
 -static void __init omap_apollon_init_early(void)
 -{
 -	omap2_init_common_infrastructure();
 -	omap2_init_common_devices(NULL, NULL);
 -}
 -
  static struct gpio apollon_gpio_leds[] __initdata = {
  	{ LED0_GPIO13, GPIOF_OUT_INIT_LOW, "LED0" }, /* LED0 - AA10 */
  	{ LED1_GPIO14, GPIOF_OUT_INIT_LOW, "LED1" }, /* LED1 - AA6  */
@@@ -334,7 -349,8 +343,9 @@@ static void __init omap_apollon_init(vo
  	 */
  	platform_add_devices(apollon_devices, ARRAY_SIZE(apollon_devices));
  	omap_serial_init();
 +	omap_sdrc_init(NULL, NULL);
+ 
+ 	omap_display_init(&apollon_dss_data);
  }
  
  static void __init omap_apollon_map_io(void)
