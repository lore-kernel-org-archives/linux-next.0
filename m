From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the arm tree
Date: Tue, 22 Nov 2016 12:34:56 +1100
Message-ID: <20161122123456.63d40fac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43919 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754238AbcKVBe7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Nov 2016 20:34:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Russell King <rmk@armlinux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Baoyou Xie <baoyou.xie@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i2c/tda998x_drv.c

between commit:

  ad975f9364a3 ("drm/i2c: tda998x: group audio functions together")

from the arm tree and commit:

  c20ea8fd4986 ("drm/i2c/tda998x: mark symbol static where possible")

from the drm tree.

I fixed it up (see below - it is much simpler than it appears) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i2c/tda998x_drv.c
index 86f47e190309,027521f30b6e..000000000000
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@@ -838,164 -819,269 +838,165 @@@ tda998x_configure_audio(struct tda998x_
  	return tda998x_write_aif(priv, &params->cea);
  }
  
 -/* DRM encoder functions */
 -
 -static void tda998x_encoder_set_config(struct tda998x_priv *priv,
 -				       const struct tda998x_encoder_params *p)
 -{
 -	priv->vip_cntrl_0 = VIP_CNTRL_0_SWAP_A(p->swap_a) |
 -			    (p->mirr_a ? VIP_CNTRL_0_MIRR_A : 0) |
 -			    VIP_CNTRL_0_SWAP_B(p->swap_b) |
 -			    (p->mirr_b ? VIP_CNTRL_0_MIRR_B : 0);
 -	priv->vip_cntrl_1 = VIP_CNTRL_1_SWAP_C(p->swap_c) |
 -			    (p->mirr_c ? VIP_CNTRL_1_MIRR_C : 0) |
 -			    VIP_CNTRL_1_SWAP_D(p->swap_d) |
 -			    (p->mirr_d ? VIP_CNTRL_1_MIRR_D : 0);
 -	priv->vip_cntrl_2 = VIP_CNTRL_2_SWAP_E(p->swap_e) |
 -			    (p->mirr_e ? VIP_CNTRL_2_MIRR_E : 0) |
 -			    VIP_CNTRL_2_SWAP_F(p->swap_f) |
 -			    (p->mirr_f ? VIP_CNTRL_2_MIRR_F : 0);
 -
 -	priv->audio_params = p->audio_params;
 -}
 -
 -static void tda998x_encoder_dpms(struct drm_encoder *encoder, int mode)
 +static int tda998x_audio_hw_params(struct device *dev, void *data,
 +				   struct hdmi_codec_daifmt *daifmt,
 +				   struct hdmi_codec_params *params)
  {
 -	struct tda998x_priv *priv = enc_to_tda998x_priv(encoder);
 -
 -	/* we only care about on or off: */
 -	if (mode != DRM_MODE_DPMS_ON)
 -		mode = DRM_MODE_DPMS_OFF;
 +	struct tda998x_priv *priv = dev_get_drvdata(dev);
 +	int i, ret;
 +	struct tda998x_audio_params audio = {
 +		.sample_width = params->sample_width,
 +		.sample_rate = params->sample_rate,
 +		.cea = params->cea,
 +	};
  
 -	if (mode == priv->dpms)
 -		return;
 +	memcpy(audio.status, params->iec.status,
 +	       min(sizeof(audio.status), sizeof(params->iec.status)));
  
 -	switch (mode) {
 -	case DRM_MODE_DPMS_ON:
 -		/* enable video ports, audio will be enabled later */
 -		reg_write(priv, REG_ENA_VP_0, 0xff);
 -		reg_write(priv, REG_ENA_VP_1, 0xff);
 -		reg_write(priv, REG_ENA_VP_2, 0xff);
 -		/* set muxing after enabling ports: */
 -		reg_write(priv, REG_VIP_CNTRL_0, priv->vip_cntrl_0);
 -		reg_write(priv, REG_VIP_CNTRL_1, priv->vip_cntrl_1);
 -		reg_write(priv, REG_VIP_CNTRL_2, priv->vip_cntrl_2);
 +	switch (daifmt->fmt) {
 +	case HDMI_I2S:
 +		if (daifmt->bit_clk_inv || daifmt->frame_clk_inv ||
 +		    daifmt->bit_clk_master || daifmt->frame_clk_master) {
 +			dev_err(dev, "%s: Bad flags %d %d %d %d\n", __func__,
 +				daifmt->bit_clk_inv, daifmt->frame_clk_inv,
 +				daifmt->bit_clk_master,
 +				daifmt->frame_clk_master);
 +			return -EINVAL;
 +		}
 +		for (i = 0; i < ARRAY_SIZE(priv->audio_port); i++)
 +			if (priv->audio_port[i].format == AFMT_I2S)
 +				audio.config = priv->audio_port[i].config;
 +		audio.format = AFMT_I2S;
  		break;
 -	case DRM_MODE_DPMS_OFF:
 -		/* disable video ports */
 -		reg_write(priv, REG_ENA_VP_0, 0x00);
 -		reg_write(priv, REG_ENA_VP_1, 0x00);
 -		reg_write(priv, REG_ENA_VP_2, 0x00);
 +	case HDMI_SPDIF:
 +		for (i = 0; i < ARRAY_SIZE(priv->audio_port); i++)
 +			if (priv->audio_port[i].format == AFMT_SPDIF)
 +				audio.config = priv->audio_port[i].config;
 +		audio.format = AFMT_SPDIF;
  		break;
 +	default:
 +		dev_err(dev, "%s: Invalid format %d\n", __func__, daifmt->fmt);
 +		return -EINVAL;
  	}
  
 -	priv->dpms = mode;
 -}
 +	if (audio.config == 0) {
 +		dev_err(dev, "%s: No audio configuration found\n", __func__);
 +		return -EINVAL;
 +	}
  
 -static int tda998x_connector_mode_valid(struct drm_connector *connector,
 -					struct drm_display_mode *mode)
 -{
 -	/* TDA19988 dotclock can go up to 165MHz */
 -	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
 +	mutex_lock(&priv->audio_mutex);
 +	if (priv->supports_infoframes && priv->sink_has_audio)
 +		ret = tda998x_configure_audio(priv, &audio);
 +	else
 +		ret = 0;
  
 -	if (mode->clock > ((priv->rev == TDA19988) ? 165000 : 150000))
 -		return MODE_CLOCK_HIGH;
 -	if (mode->htotal >= BIT(13))
 -		return MODE_BAD_HVALUE;
 -	if (mode->vtotal >= BIT(11))
 -		return MODE_BAD_VVALUE;
 -	return MODE_OK;
 +	if (ret == 0)
 +		priv->audio_params = audio;
 +	mutex_unlock(&priv->audio_mutex);
 +
 +	return ret;
  }
  
 -static void
 -tda998x_encoder_mode_set(struct drm_encoder *encoder,
 -			 struct drm_display_mode *mode,
 -			 struct drm_display_mode *adjusted_mode)
 +static void tda998x_audio_shutdown(struct device *dev, void *data)
  {
 -	struct tda998x_priv *priv = enc_to_tda998x_priv(encoder);
 -	u16 ref_pix, ref_line, n_pix, n_line;
 -	u16 hs_pix_s, hs_pix_e;
 -	u16 vs1_pix_s, vs1_pix_e, vs1_line_s, vs1_line_e;
 -	u16 vs2_pix_s, vs2_pix_e, vs2_line_s, vs2_line_e;
 -	u16 vwin1_line_s, vwin1_line_e;
 -	u16 vwin2_line_s, vwin2_line_e;
 -	u16 de_pix_s, de_pix_e;
 -	u8 reg, div, rep;
 +	struct tda998x_priv *priv = dev_get_drvdata(dev);
  
 -	/*
 -	 * Internally TDA998x is using ITU-R BT.656 style sync but
 -	 * we get VESA style sync. TDA998x is using a reference pixel
 -	 * relative to ITU to sync to the input frame and for output
 -	 * sync generation. Currently, we are using reference detection
 -	 * from HS/VS, i.e. REFPIX/REFLINE denote frame start sync point
 -	 * which is position of rising VS with coincident rising HS.
 -	 *
 -	 * Now there is some issues to take care of:
 -	 * - HDMI data islands require sync-before-active
 -	 * - TDA998x register values must be > 0 to be enabled
 -	 * - REFLINE needs an additional offset of +1
 -	 * - REFPIX needs an addtional offset of +1 for UYUV and +3 for RGB
 -	 *
 -	 * So we add +1 to all horizontal and vertical register values,
 -	 * plus an additional +3 for REFPIX as we are using RGB input only.
 -	 */
 -	n_pix        = mode->htotal;
 -	n_line       = mode->vtotal;
 +	mutex_lock(&priv->audio_mutex);
  
 -	hs_pix_e     = mode->hsync_end - mode->hdisplay;
 -	hs_pix_s     = mode->hsync_start - mode->hdisplay;
 -	de_pix_e     = mode->htotal;
 -	de_pix_s     = mode->htotal - mode->hdisplay;
 -	ref_pix      = 3 + hs_pix_s;
 +	reg_write(priv, REG_ENA_AP, 0);
  
 -	/*
 -	 * Attached LCD controllers may generate broken sync. Allow
 -	 * those to adjust the position of the rising VS edge by adding
 -	 * HSKEW to ref_pix.
 -	 */
 -	if (adjusted_mode->flags & DRM_MODE_FLAG_HSKEW)
 -		ref_pix += adjusted_mode->hskew;
 +	priv->audio_params.format = AFMT_UNUSED;
  
 -	if ((mode->flags & DRM_MODE_FLAG_INTERLACE) == 0) {
 -		ref_line     = 1 + mode->vsync_start - mode->vdisplay;
 -		vwin1_line_s = mode->vtotal - mode->vdisplay - 1;
 -		vwin1_line_e = vwin1_line_s + mode->vdisplay;
 -		vs1_pix_s    = vs1_pix_e = hs_pix_s;
 -		vs1_line_s   = mode->vsync_start - mode->vdisplay;
 -		vs1_line_e   = vs1_line_s +
 -			       mode->vsync_end - mode->vsync_start;
 -		vwin2_line_s = vwin2_line_e = 0;
 -		vs2_pix_s    = vs2_pix_e  = 0;
 -		vs2_line_s   = vs2_line_e = 0;
 -	} else {
 -		ref_line     = 1 + (mode->vsync_start - mode->vdisplay)/2;
 -		vwin1_line_s = (mode->vtotal - mode->vdisplay)/2;
 -		vwin1_line_e = vwin1_line_s + mode->vdisplay/2;
 -		vs1_pix_s    = vs1_pix_e = hs_pix_s;
 -		vs1_line_s   = (mode->vsync_start - mode->vdisplay)/2;
 -		vs1_line_e   = vs1_line_s +
 -			       (mode->vsync_end - mode->vsync_start)/2;
 -		vwin2_line_s = vwin1_line_s + mode->vtotal/2;
 -		vwin2_line_e = vwin2_line_s + mode->vdisplay/2;
 -		vs2_pix_s    = vs2_pix_e = hs_pix_s + mode->htotal/2;
 -		vs2_line_s   = vs1_line_s + mode->vtotal/2 ;
 -		vs2_line_e   = vs2_line_s +
 -			       (mode->vsync_end - mode->vsync_start)/2;
 -	}
 +	mutex_unlock(&priv->audio_mutex);
 +}
  
- int tda998x_audio_digital_mute(struct device *dev, void *data, bool enable)
 -	div = 148500 / mode->clock;
 -	if (div != 0) {
 -		div--;
 -		if (div > 3)
 -			div = 3;
 -	}
++static int
++tda998x_audio_digital_mute(struct device *dev, void *data, bool enable)
 +{
 +	struct tda998x_priv *priv = dev_get_drvdata(dev);
  
 -	/* mute the audio FIFO: */
 -	reg_set(priv, REG_AIP_CNTRL_0, AIP_CNTRL_0_RST_FIFO);
 +	mutex_lock(&priv->audio_mutex);
  
 -	/* set HDMI HDCP mode off: */
 -	reg_write(priv, REG_TBG_CNTRL_1, TBG_CNTRL_1_DWIN_DIS);
 -	reg_clear(priv, REG_TX33, TX33_HDMI);
 -	reg_write(priv, REG_ENC_CNTRL, ENC_CNTRL_CTL_CODE(0));
 +	tda998x_audio_mute(priv, enable);
  
 -	/* no pre-filter or interpolator: */
 -	reg_write(priv, REG_HVF_CNTRL_0, HVF_CNTRL_0_PREFIL(0) |
 -			HVF_CNTRL_0_INTPOL(0));
 -	reg_write(priv, REG_VIP_CNTRL_5, VIP_CNTRL_5_SP_CNT(0));
 -	reg_write(priv, REG_VIP_CNTRL_4, VIP_CNTRL_4_BLANKIT(0) |
 -			VIP_CNTRL_4_BLC(0));
 +	mutex_unlock(&priv->audio_mutex);
 +	return 0;
 +}
  
 -	reg_clear(priv, REG_PLL_SERIAL_1, PLL_SERIAL_1_SRL_MAN_IZ);
 -	reg_clear(priv, REG_PLL_SERIAL_3, PLL_SERIAL_3_SRL_CCIR |
 -					  PLL_SERIAL_3_SRL_DE);
 -	reg_write(priv, REG_SERIALIZER, 0);
 -	reg_write(priv, REG_HVF_CNTRL_1, HVF_CNTRL_1_VQR(0));
 +static int tda998x_audio_get_eld(struct device *dev, void *data,
 +				 uint8_t *buf, size_t len)
 +{
 +	struct tda998x_priv *priv = dev_get_drvdata(dev);
  
 -	/* TODO enable pixel repeat for pixel rates less than 25Msamp/s */
 -	rep = 0;
 -	reg_write(priv, REG_RPT_CNTRL, 0);
 -	reg_write(priv, REG_SEL_CLK, SEL_CLK_SEL_VRF_CLK(0) |
 -			SEL_CLK_SEL_CLK1 | SEL_CLK_ENA_SC_CLK);
 +	mutex_lock(&priv->audio_mutex);
 +	memcpy(buf, priv->connector.eld,
 +	       min(sizeof(priv->connector.eld), len));
 +	mutex_unlock(&priv->audio_mutex);
  
 -	reg_write(priv, REG_PLL_SERIAL_2, PLL_SERIAL_2_SRL_NOSC(div) |
 -			PLL_SERIAL_2_SRL_PR(rep));
 +	return 0;
 +}
  
 -	/* set color matrix bypass flag: */
 -	reg_write(priv, REG_MAT_CONTRL, MAT_CONTRL_MAT_BP |
 -				MAT_CONTRL_MAT_SC(1));
 +static const struct hdmi_codec_ops audio_codec_ops = {
 +	.hw_params = tda998x_audio_hw_params,
 +	.audio_shutdown = tda998x_audio_shutdown,
 +	.digital_mute = tda998x_audio_digital_mute,
 +	.get_eld = tda998x_audio_get_eld,
 +};
  
 -	/* set BIAS tmds value: */
 -	reg_write(priv, REG_ANA_GENERAL, 0x09);
 +static int tda998x_audio_codec_init(struct tda998x_priv *priv,
 +				    struct device *dev)
 +{
 +	struct hdmi_codec_pdata codec_data = {
 +		.ops = &audio_codec_ops,
 +		.max_i2s_channels = 2,
 +	};
 +	int i;
  
 -	/*
 -	 * Sync on rising HSYNC/VSYNC
 -	 */
 -	reg = VIP_CNTRL_3_SYNC_HS;
 +	for (i = 0; i < ARRAY_SIZE(priv->audio_port); i++) {
 +		if (priv->audio_port[i].format == AFMT_I2S &&
 +		    priv->audio_port[i].config != 0)
 +			codec_data.i2s = 1;
 +		if (priv->audio_port[i].format == AFMT_SPDIF &&
 +		    priv->audio_port[i].config != 0)
 +			codec_data.spdif = 1;
 +	}
  
 -	/*
 -	 * TDA19988 requires high-active sync at input stage,
 -	 * so invert low-active sync provided by master encoder here
 -	 */
 -	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
 -		reg |= VIP_CNTRL_3_H_TGL;
 -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 -		reg |= VIP_CNTRL_3_V_TGL;
 -	reg_write(priv, REG_VIP_CNTRL_3, reg);
 +	priv->audio_pdev = platform_device_register_data(
 +		dev, HDMI_CODEC_DRV_NAME, PLATFORM_DEVID_AUTO,
 +		&codec_data, sizeof(codec_data));
  
 -	reg_write(priv, REG_VIDFORMAT, 0x00);
 -	reg_write16(priv, REG_REFPIX_MSB, ref_pix);
 -	reg_write16(priv, REG_REFLINE_MSB, ref_line);
 -	reg_write16(priv, REG_NPIX_MSB, n_pix);
 -	reg_write16(priv, REG_NLINE_MSB, n_line);
 -	reg_write16(priv, REG_VS_LINE_STRT_1_MSB, vs1_line_s);
 -	reg_write16(priv, REG_VS_PIX_STRT_1_MSB, vs1_pix_s);
 -	reg_write16(priv, REG_VS_LINE_END_1_MSB, vs1_line_e);
 -	reg_write16(priv, REG_VS_PIX_END_1_MSB, vs1_pix_e);
 -	reg_write16(priv, REG_VS_LINE_STRT_2_MSB, vs2_line_s);
 -	reg_write16(priv, REG_VS_PIX_STRT_2_MSB, vs2_pix_s);
 -	reg_write16(priv, REG_VS_LINE_END_2_MSB, vs2_line_e);
 -	reg_write16(priv, REG_VS_PIX_END_2_MSB, vs2_pix_e);
 -	reg_write16(priv, REG_HS_PIX_START_MSB, hs_pix_s);
 -	reg_write16(priv, REG_HS_PIX_STOP_MSB, hs_pix_e);
 -	reg_write16(priv, REG_VWIN_START_1_MSB, vwin1_line_s);
 -	reg_write16(priv, REG_VWIN_END_1_MSB, vwin1_line_e);
 -	reg_write16(priv, REG_VWIN_START_2_MSB, vwin2_line_s);
 -	reg_write16(priv, REG_VWIN_END_2_MSB, vwin2_line_e);
 -	reg_write16(priv, REG_DE_START_MSB, de_pix_s);
 -	reg_write16(priv, REG_DE_STOP_MSB, de_pix_e);
 +	return PTR_ERR_OR_ZERO(priv->audio_pdev);
 +}
  
 -	if (priv->rev == TDA19988) {
 -		/* let incoming pixels fill the active space (if any) */
 -		reg_write(priv, REG_ENABLE_SPACE, 0x00);
 -	}
 +/* DRM connector functions */
  
 -	/*
 -	 * Always generate sync polarity relative to input sync and
 -	 * revert input stage toggled sync at output stage
 -	 */
 -	reg = TBG_CNTRL_1_DWIN_DIS | TBG_CNTRL_1_TGL_EN;
 -	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
 -		reg |= TBG_CNTRL_1_H_TGL;
 -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 -		reg |= TBG_CNTRL_1_V_TGL;
 -	reg_write(priv, REG_TBG_CNTRL_1, reg);
 +static int tda998x_connector_dpms(struct drm_connector *connector, int mode)
 +{
 +	if (drm_core_check_feature(connector->dev, DRIVER_ATOMIC))
 +		return drm_atomic_helper_connector_dpms(connector, mode);
 +	else
 +		return drm_helper_connector_dpms(connector, mode);
 +}
  
 -	/* must be last register set: */
 -	reg_write(priv, REG_TBG_CNTRL_0, 0);
 +static int tda998x_connector_fill_modes(struct drm_connector *connector,
 +					uint32_t maxX, uint32_t maxY)
 +{
 +	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
 +	int ret;
  
 -	/* Only setup the info frames if the sink is HDMI */
 -	if (priv->is_hdmi_sink) {
 -		/* We need to turn HDMI HDCP stuff on to get audio through */
 -		reg &= ~TBG_CNTRL_1_DWIN_DIS;
 -		reg_write(priv, REG_TBG_CNTRL_1, reg);
 -		reg_write(priv, REG_ENC_CNTRL, ENC_CNTRL_CTL_CODE(1));
 -		reg_set(priv, REG_TX33, TX33_HDMI);
 +	mutex_lock(&priv->audio_mutex);
 +	ret = drm_helper_probe_single_connector_modes(connector, maxX, maxY);
  
 -		tda998x_write_avi(priv, adjusted_mode);
 +	if (connector->edid_blob_ptr) {
 +		struct edid *edid = (void *)connector->edid_blob_ptr->data;
  
 -		if (priv->audio_params.format != AFMT_UNUSED) {
 -			mutex_lock(&priv->audio_mutex);
 -			tda998x_configure_audio(priv,
 -						&priv->audio_params,
 -						adjusted_mode->clock);
 -			mutex_unlock(&priv->audio_mutex);
 -		}
 +		priv->sink_has_audio = drm_detect_monitor_audio(edid);
 +	} else {
 +		priv->sink_has_audio = false;
  	}
 +	mutex_unlock(&priv->audio_mutex);
 +
 +	return ret;
  }
  
  static enum drm_connector_status
