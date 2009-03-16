From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the async_tx tree with the arm tree
Date: Mon, 16 Mar 2009 15:10:54 +1100
Message-ID: <20090316151054.b518091c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35365 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750716AbZCPELA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 00:11:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Guennadi Liakhovetski <lg@denx.de>

Hi Dan, Russell,

Today's linux-next merge of the async_tx tree got a conflict in
drivers/video/mx3fb.c between commit
9eb2eb8c40ffd30da322648c4415bae0288eb167 ("MX31 clkdev support") from the
arm tree and commits 1febd91acff907152e61eb5ad0a82dd8d7db21c6 ("Revert
"i.MX31: framebuffer driver"") and
6e1588cbd88590273300403648aef70e6bdaf5af ("i.MX31: framebuffer driver")
from the async_tx tree.

I fixed it up (see below) and can carry the fix as necessary).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/video/mx3fb.c
index 0c27961,3e84635..0000000
--- a/drivers/video/mx3fb.c
+++ b/drivers/video/mx3fb.c
@@@ -412,162 -412,162 +412,162 @@@ static int sdc_set_window_pos(struct mx
  
  /**
   * sdc_init_panel() - initialize a synchronous LCD panel.
-  * @mx3fb:             mx3fb context.
-  * @panel:             panel type.
-  * @pixel_clk:         desired pixel clock frequency in Hz.
-  * @width:             width of panel in pixels.
-  * @height:            height of panel in pixels.
-  * @pixel_fmt:         pixel format of buffer as FOURCC ASCII code.
-  * @h_start_width:     number of pixel clocks between the HSYNC signal pulse
-  *                     and the start of valid data.
-  * @h_sync_width:      width of the HSYNC signal in units of pixel clocks.
-  * @h_end_width:       number of pixel clocks between the end of valid data
-  *                     and the HSYNC signal for next line.
-  * @v_start_width:     number of lines between the VSYNC signal pulse and the
-  *                     start of valid data.
-  * @v_sync_width:      width of the VSYNC signal in units of lines
-  * @v_end_width:       number of lines between the end of valid data and the
-  *                     VSYNC signal for next frame.
-  * @sig:               bitfield of signal polarities for LCD interface.
-  * @return:            0 on success or negative error code on failure.
+  * @mx3fb:		mx3fb context.
+  * @panel:		panel type.
+  * @pixel_clk:		desired pixel clock frequency in Hz.
+  * @width:		width of panel in pixels.
+  * @height:		height of panel in pixels.
+  * @pixel_fmt:		pixel format of buffer as FOURCC ASCII code.
+  * @h_start_width:	number of pixel clocks between the HSYNC signal pulse
+  *			and the start of valid data.
+  * @h_sync_width:	width of the HSYNC signal in units of pixel clocks.
+  * @h_end_width:	number of pixel clocks between the end of valid data
+  *			and the HSYNC signal for next line.
+  * @v_start_width:	number of lines between the VSYNC signal pulse and the
+  *			start of valid data.
+  * @v_sync_width:	width of the VSYNC signal in units of lines
+  * @v_end_width:	number of lines between the end of valid data and the
+  *			VSYNC signal for next frame.
+  * @sig:		bitfield of signal polarities for LCD interface.
+  * @return:		0 on success or negative error code on failure.
   */
  static int sdc_init_panel(struct mx3fb_data *mx3fb, enum ipu_panel panel,
-                          uint32_t pixel_clk,
-                          uint16_t width, uint16_t height,
-                          enum pixel_fmt pixel_fmt,
-                          uint16_t h_start_width, uint16_t h_sync_width,
-                          uint16_t h_end_width, uint16_t v_start_width,
-                          uint16_t v_sync_width, uint16_t v_end_width,
-                          struct ipu_di_signal_cfg sig)
+ 			  uint32_t pixel_clk,
+ 			  uint16_t width, uint16_t height,
+ 			  enum pixel_fmt pixel_fmt,
+ 			  uint16_t h_start_width, uint16_t h_sync_width,
+ 			  uint16_t h_end_width, uint16_t v_start_width,
+ 			  uint16_t v_sync_width, uint16_t v_end_width,
+ 			  struct ipu_di_signal_cfg sig)
  {
-        unsigned long lock_flags;
-        uint32_t reg;
-        uint32_t old_conf;
-        uint32_t div;
-        struct clk *ipu_clk;
+ 	unsigned long lock_flags;
+ 	uint32_t reg;
+ 	uint32_t old_conf;
+ 	uint32_t div;
+ 	struct clk *ipu_clk;
  
-        dev_dbg(mx3fb->dev, "panel size = %d x %d", width, height);
+ 	dev_dbg(mx3fb->dev, "panel size = %d x %d", width, height);
  
-        if (v_sync_width == 0 || h_sync_width == 0)
-                return -EINVAL;
+ 	if (v_sync_width == 0 || h_sync_width == 0)
+ 		return -EINVAL;
  
-        /* Init panel size and blanking periods */
-        reg = ((uint32_t) (h_sync_width - 1) << 26) |
-                ((uint32_t) (width + h_start_width + h_end_width - 1) << 16);
-        mx3fb_write_reg(mx3fb, reg, SDC_HOR_CONF);
+ 	/* Init panel size and blanking periods */
+ 	reg = ((uint32_t) (h_sync_width - 1) << 26) |
+ 		((uint32_t) (width + h_start_width + h_end_width - 1) << 16);
+ 	mx3fb_write_reg(mx3fb, reg, SDC_HOR_CONF);
  
  #ifdef DEBUG
-        printk(KERN_CONT " hor_conf %x,", reg);
+ 	printk(KERN_CONT " hor_conf %x,", reg);
  #endif
  
-        reg = ((uint32_t) (v_sync_width - 1) << 26) | SDC_V_SYNC_WIDTH_L |
-            ((uint32_t) (height + v_start_width + v_end_width - 1) << 16);
-        mx3fb_write_reg(mx3fb, reg, SDC_VER_CONF);
+ 	reg = ((uint32_t) (v_sync_width - 1) << 26) | SDC_V_SYNC_WIDTH_L |
+ 	    ((uint32_t) (height + v_start_width + v_end_width - 1) << 16);
+ 	mx3fb_write_reg(mx3fb, reg, SDC_VER_CONF);
  
  #ifdef DEBUG
-        printk(KERN_CONT " ver_conf %x\n", reg);
+ 	printk(KERN_CONT " ver_conf %x\n", reg);
  #endif
  
-        mx3fb->h_start_width = h_start_width;
-        mx3fb->v_start_width = v_start_width;
- 
-        switch (panel) {
-        case IPU_PANEL_SHARP_TFT:
-                mx3fb_write_reg(mx3fb, 0x00FD0102L, SDC_SHARP_CONF_1);
-                mx3fb_write_reg(mx3fb, 0x00F500F4L, SDC_SHARP_CONF_2);
-                mx3fb_write_reg(mx3fb, SDC_COM_SHARP | SDC_COM_TFT_COLOR, SDC_COM_CONF);
-                break;
-        case IPU_PANEL_TFT:
-                mx3fb_write_reg(mx3fb, SDC_COM_TFT_COLOR, SDC_COM_CONF);
-                break;
-        default:
-                return -EINVAL;
-        }
- 
-        /* Init clocking */
- 
-        /*
-         * Calculate divider: fractional part is 4 bits so simply multiple by
-         * 24 to get fractional part, as long as we stay under ~250MHz and on
-         * i.MX31 it (HSP_CLK) is <= 178MHz. Currently 128.267MHz
-         */
-        dev_dbg(mx3fb->dev, "pixel clk = %d\n", pixel_clk);
- 
-        ipu_clk = clk_get(mx3fb->dev, NULL);
-        div = clk_get_rate(ipu_clk) * 16 / pixel_clk;
-        clk_put(ipu_clk);
- 
-        if (div < 0x40) {       /* Divider less than 4 */
-                dev_dbg(mx3fb->dev,
-                        "InitPanel() - Pixel clock divider less than 4\n");
-                div = 0x40;
-        }
- 
-        spin_lock_irqsave(&mx3fb->lock, lock_flags);
- 
-        /*
-         * DISP3_IF_CLK_DOWN_WR is half the divider value and 2 fraction bits
-         * fewer. Subtract 1 extra from DISP3_IF_CLK_DOWN_WR based on timing
-         * debug. DISP3_IF_CLK_UP_WR is 0
-         */
-        mx3fb_write_reg(mx3fb, (((div / 8) - 1) << 22) | div, DI_DISP3_TIME_CONF);
- 
-        /* DI settings */
-        old_conf = mx3fb_read_reg(mx3fb, DI_DISP_IF_CONF) & 0x78FFFFFF;
-        old_conf |= sig.datamask_en << DI_D3_DATAMSK_SHIFT |
-            sig.clksel_en << DI_D3_CLK_SEL_SHIFT |
-            sig.clkidle_en << DI_D3_CLK_IDLE_SHIFT;
-        mx3fb_write_reg(mx3fb, old_conf, DI_DISP_IF_CONF);
- 
-        old_conf = mx3fb_read_reg(mx3fb, DI_DISP_SIG_POL) & 0xE0FFFFFF;
-        old_conf |= sig.data_pol << DI_D3_DATA_POL_SHIFT |
-            sig.clk_pol << DI_D3_CLK_POL_SHIFT |
-            sig.enable_pol << DI_D3_DRDY_SHARP_POL_SHIFT |
-            sig.Hsync_pol << DI_D3_HSYNC_POL_SHIFT |
-            sig.Vsync_pol << DI_D3_VSYNC_POL_SHIFT;
-        mx3fb_write_reg(mx3fb, old_conf, DI_DISP_SIG_POL);
- 
-        switch (pixel_fmt) {
-        case IPU_PIX_FMT_RGB24:
-                mx3fb_write_reg(mx3fb, di_mappings[0], DI_DISP3_B0_MAP);
-                mx3fb_write_reg(mx3fb, di_mappings[1], DI_DISP3_B1_MAP);
-                mx3fb_write_reg(mx3fb, di_mappings[2], DI_DISP3_B2_MAP);
-                mx3fb_write_reg(mx3fb, mx3fb_read_reg(mx3fb, DI_DISP_ACC_CC) |
-                             ((di_mappings[3] - 1) << 12), DI_DISP_ACC_CC);
-                break;
-        case IPU_PIX_FMT_RGB666:
-                mx3fb_write_reg(mx3fb, di_mappings[4], DI_DISP3_B0_MAP);
-                mx3fb_write_reg(mx3fb, di_mappings[5], DI_DISP3_B1_MAP);
-                mx3fb_write_reg(mx3fb, di_mappings[6], DI_DISP3_B2_MAP);
-                mx3fb_write_reg(mx3fb, mx3fb_read_reg(mx3fb, DI_DISP_ACC_CC) |
-                             ((di_mappings[7] - 1) << 12), DI_DISP_ACC_CC);
-                break;
-        case IPU_PIX_FMT_BGR666:
-                mx3fb_write_reg(mx3fb, di_mappings[8], DI_DISP3_B0_MAP);
-                mx3fb_write_reg(mx3fb, di_mappings[9], DI_DISP3_B1_MAP);
-                mx3fb_write_reg(mx3fb, di_mappings[10], DI_DISP3_B2_MAP);
-                mx3fb_write_reg(mx3fb, mx3fb_read_reg(mx3fb, DI_DISP_ACC_CC) |
-                             ((di_mappings[11] - 1) << 12), DI_DISP_ACC_CC);
-                break;
-        default:
-                mx3fb_write_reg(mx3fb, di_mappings[12], DI_DISP3_B0_MAP);
-                mx3fb_write_reg(mx3fb, di_mappings[13], DI_DISP3_B1_MAP);
-                mx3fb_write_reg(mx3fb, di_mappings[14], DI_DISP3_B2_MAP);
-                mx3fb_write_reg(mx3fb, mx3fb_read_reg(mx3fb, DI_DISP_ACC_CC) |
-                             ((di_mappings[15] - 1) << 12), DI_DISP_ACC_CC);
-                break;
-        }
- 
-        spin_unlock_irqrestore(&mx3fb->lock, lock_flags);
- 
-        dev_dbg(mx3fb->dev, "DI_DISP_IF_CONF = 0x%08X\n",
-                mx3fb_read_reg(mx3fb, DI_DISP_IF_CONF));
-        dev_dbg(mx3fb->dev, "DI_DISP_SIG_POL = 0x%08X\n",
-                mx3fb_read_reg(mx3fb, DI_DISP_SIG_POL));
-        dev_dbg(mx3fb->dev, "DI_DISP3_TIME_CONF = 0x%08X\n",
-                mx3fb_read_reg(mx3fb, DI_DISP3_TIME_CONF));
- 
-        return 0;
+ 	mx3fb->h_start_width = h_start_width;
+ 	mx3fb->v_start_width = v_start_width;
+ 
+ 	switch (panel) {
+ 	case IPU_PANEL_SHARP_TFT:
+ 		mx3fb_write_reg(mx3fb, 0x00FD0102L, SDC_SHARP_CONF_1);
+ 		mx3fb_write_reg(mx3fb, 0x00F500F4L, SDC_SHARP_CONF_2);
+ 		mx3fb_write_reg(mx3fb, SDC_COM_SHARP | SDC_COM_TFT_COLOR, SDC_COM_CONF);
+ 		break;
+ 	case IPU_PANEL_TFT:
+ 		mx3fb_write_reg(mx3fb, SDC_COM_TFT_COLOR, SDC_COM_CONF);
+ 		break;
+ 	default:
+ 		return -EINVAL;
+ 	}
+ 
+ 	/* Init clocking */
+ 
+ 	/*
+ 	 * Calculate divider: fractional part is 4 bits so simply multiple by
+ 	 * 2^4 to get fractional part, as long as we stay under ~250MHz and on
+ 	 * i.MX31 it (HSP_CLK) is <= 178MHz. Currently 128.267MHz
+ 	 */
+ 	dev_dbg(mx3fb->dev, "pixel clk = %d\n", pixel_clk);
+ 
 -	ipu_clk = clk_get(mx3fb->dev, "ipu_clk");
++	ipu_clk = clk_get(mx3fb->dev, NULL);
+ 	div = clk_get_rate(ipu_clk) * 16 / pixel_clk;
+ 	clk_put(ipu_clk);
+ 
+ 	if (div < 0x40) {	/* Divider less than 4 */
+ 		dev_dbg(mx3fb->dev,
+ 			"InitPanel() - Pixel clock divider less than 4\n");
+ 		div = 0x40;
+ 	}
+ 
+ 	spin_lock_irqsave(&mx3fb->lock, lock_flags);
+ 
+ 	/*
+ 	 * DISP3_IF_CLK_DOWN_WR is half the divider value and 2 fraction bits
+ 	 * fewer. Subtract 1 extra from DISP3_IF_CLK_DOWN_WR based on timing
+ 	 * debug. DISP3_IF_CLK_UP_WR is 0
+ 	 */
+ 	mx3fb_write_reg(mx3fb, (((div / 8) - 1) << 22) | div, DI_DISP3_TIME_CONF);
+ 
+ 	/* DI settings */
+ 	old_conf = mx3fb_read_reg(mx3fb, DI_DISP_IF_CONF) & 0x78FFFFFF;
+ 	old_conf |= sig.datamask_en << DI_D3_DATAMSK_SHIFT |
+ 	    sig.clksel_en << DI_D3_CLK_SEL_SHIFT |
+ 	    sig.clkidle_en << DI_D3_CLK_IDLE_SHIFT;
+ 	mx3fb_write_reg(mx3fb, old_conf, DI_DISP_IF_CONF);
+ 
+ 	old_conf = mx3fb_read_reg(mx3fb, DI_DISP_SIG_POL) & 0xE0FFFFFF;
+ 	old_conf |= sig.data_pol << DI_D3_DATA_POL_SHIFT |
+ 	    sig.clk_pol << DI_D3_CLK_POL_SHIFT |
+ 	    sig.enable_pol << DI_D3_DRDY_SHARP_POL_SHIFT |
+ 	    sig.Hsync_pol << DI_D3_HSYNC_POL_SHIFT |
+ 	    sig.Vsync_pol << DI_D3_VSYNC_POL_SHIFT;
+ 	mx3fb_write_reg(mx3fb, old_conf, DI_DISP_SIG_POL);
+ 
+ 	switch (pixel_fmt) {
+ 	case IPU_PIX_FMT_RGB24:
+ 		mx3fb_write_reg(mx3fb, di_mappings[0], DI_DISP3_B0_MAP);
+ 		mx3fb_write_reg(mx3fb, di_mappings[1], DI_DISP3_B1_MAP);
+ 		mx3fb_write_reg(mx3fb, di_mappings[2], DI_DISP3_B2_MAP);
+ 		mx3fb_write_reg(mx3fb, mx3fb_read_reg(mx3fb, DI_DISP_ACC_CC) |
+ 			     ((di_mappings[3] - 1) << 12), DI_DISP_ACC_CC);
+ 		break;
+ 	case IPU_PIX_FMT_RGB666:
+ 		mx3fb_write_reg(mx3fb, di_mappings[4], DI_DISP3_B0_MAP);
+ 		mx3fb_write_reg(mx3fb, di_mappings[5], DI_DISP3_B1_MAP);
+ 		mx3fb_write_reg(mx3fb, di_mappings[6], DI_DISP3_B2_MAP);
+ 		mx3fb_write_reg(mx3fb, mx3fb_read_reg(mx3fb, DI_DISP_ACC_CC) |
+ 			     ((di_mappings[7] - 1) << 12), DI_DISP_ACC_CC);
+ 		break;
+ 	case IPU_PIX_FMT_BGR666:
+ 		mx3fb_write_reg(mx3fb, di_mappings[8], DI_DISP3_B0_MAP);
+ 		mx3fb_write_reg(mx3fb, di_mappings[9], DI_DISP3_B1_MAP);
+ 		mx3fb_write_reg(mx3fb, di_mappings[10], DI_DISP3_B2_MAP);
+ 		mx3fb_write_reg(mx3fb, mx3fb_read_reg(mx3fb, DI_DISP_ACC_CC) |
+ 			     ((di_mappings[11] - 1) << 12), DI_DISP_ACC_CC);
+ 		break;
+ 	default:
+ 		mx3fb_write_reg(mx3fb, di_mappings[12], DI_DISP3_B0_MAP);
+ 		mx3fb_write_reg(mx3fb, di_mappings[13], DI_DISP3_B1_MAP);
+ 		mx3fb_write_reg(mx3fb, di_mappings[14], DI_DISP3_B2_MAP);
+ 		mx3fb_write_reg(mx3fb, mx3fb_read_reg(mx3fb, DI_DISP_ACC_CC) |
+ 			     ((di_mappings[15] - 1) << 12), DI_DISP_ACC_CC);
+ 		break;
+ 	}
+ 
+ 	spin_unlock_irqrestore(&mx3fb->lock, lock_flags);
+ 
+ 	dev_dbg(mx3fb->dev, "DI_DISP_IF_CONF = 0x%08X\n",
+ 		mx3fb_read_reg(mx3fb, DI_DISP_IF_CONF));
+ 	dev_dbg(mx3fb->dev, "DI_DISP_SIG_POL = 0x%08X\n",
+ 		mx3fb_read_reg(mx3fb, DI_DISP_SIG_POL));
+ 	dev_dbg(mx3fb->dev, "DI_DISP3_TIME_CONF = 0x%08X\n",
+ 		mx3fb_read_reg(mx3fb, DI_DISP3_TIME_CONF));
+ 
+ 	return 0;
  }
  
  /**
