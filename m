From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the arm tree
Date: Thu, 17 Nov 2016 12:39:00 +1100
Message-ID: <20161117123900.7a67a97a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59223 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753665AbcKQBjD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Nov 2016 20:39:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Russell King <rmk@armlinux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Baoyou Xie <baoyou.xie@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i2c/tda998x_drv.c

between commit:

  5d564ba2705d ("drm/i2c: tda998x: group audio functions together")

from the arm tree and commit:

  c20ea8fd4986 ("drm/i2c/tda998x: mark symbol static where possible")

from the drm tree.

I fixed it up (see below - its a much simpler conflict than it appears
to be below) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i2c/tda998x_drv.c
index bf5eec0c1b4f,027521f30b6e..000000000000
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@@ -824,281 -819,58 +824,282 @@@ tda998x_configure_audio(struct tda998x_
  	return tda998x_write_aif(priv, &params->cea);
  }
  
 -/* DRM encoder functions */
 +static int tda998x_audio_hw_params(struct device *dev, void *data,
 +				   struct hdmi_codec_daifmt *daifmt,
 +				   struct hdmi_codec_params *params)
 +{
 +	struct tda998x_priv *priv = dev_get_drvdata(dev);
 +	int i, ret;
 +	struct tda998x_audio_params audio = {
 +		.sample_width = params->sample_width,
 +		.sample_rate = params->sample_rate,
 +		.cea = params->cea,
 +	};
 +
 +	memcpy(audio.status, params->iec.status,
 +	       min(sizeof(audio.status), sizeof(params->iec.status)));
  
 -static void tda998x_encoder_set_config(struct tda998x_priv *priv,
 -				       const struct tda998x_encoder_params *p)
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
 +		break;
 +	case HDMI_SPDIF:
 +		for (i = 0; i < ARRAY_SIZE(priv->audio_port); i++)
 +			if (priv->audio_port[i].format == AFMT_SPDIF)
 +				audio.config = priv->audio_port[i].config;
 +		audio.format = AFMT_SPDIF;
 +		break;
 +	default:
 +		dev_err(dev, "%s: Invalid format %d\n", __func__, daifmt->fmt);
 +		return -EINVAL;
 +	}
 +
 +	if (audio.config == 0) {
 +		dev_err(dev, "%s: No audio configutation found\n", __func__);
 +		return -EINVAL;
 +	}
 +
 +	mutex_lock(&priv->audio_mutex);
 +	if (priv->supports_infoframes && priv->sink_has_audio)
 +		ret = tda998x_configure_audio(priv, &audio);
 +	else
 +		ret = 0;
 +
 +	if (ret == 0)
 +		priv->audio_params = audio;
 +	mutex_unlock(&priv->audio_mutex);
 +
 +	return ret;
 +}
 +
 +static void tda998x_audio_shutdown(struct device *dev, void *data)
  {
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
 +	struct tda998x_priv *priv = dev_get_drvdata(dev);
  
 -	priv->audio_params = p->audio_params;
 +	mutex_lock(&priv->audio_mutex);
 +
 +	reg_write(priv, REG_ENA_AP, 0);
 +
 +	priv->audio_params.format = AFMT_UNUSED;
 +
 +	mutex_unlock(&priv->audio_mutex);
  }
  
- int tda998x_audio_digital_mute(struct device *dev, void *data, bool enable)
 -static void tda998x_encoder_dpms(struct drm_encoder *encoder, int mode)
++static int
++tda998x_audio_digital_mute(struct device *dev, void *data, bool enable)
  {
 -	struct tda998x_priv *priv = enc_to_tda998x_priv(encoder);
 +	struct tda998x_priv *priv = dev_get_drvdata(dev);
  
 -	/* we only care about on or off: */
 -	if (mode != DRM_MODE_DPMS_ON)
 -		mode = DRM_MODE_DPMS_OFF;
 +	mutex_lock(&priv->audio_mutex);
  
 -	if (mode == priv->dpms)
 -		return;
 +	tda998x_audio_mute(priv, enable);
  
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
 -		break;
 -	case DRM_MODE_DPMS_OFF:
 -		/* disable video ports */
 -		reg_write(priv, REG_ENA_VP_0, 0x00);
 -		reg_write(priv, REG_ENA_VP_1, 0x00);
 -		reg_write(priv, REG_ENA_VP_2, 0x00);
 -		break;
 +	mutex_unlock(&priv->audio_mutex);
 +	return 0;
 +}
 +
 +static int tda998x_audio_get_eld(struct device *dev, void *data,
 +				 uint8_t *buf, size_t len)
 +{
 +	struct tda998x_priv *priv = dev_get_drvdata(dev);
 +
 +	mutex_lock(&priv->audio_mutex);
 +	memcpy(buf, priv->connector.eld,
 +	       min(sizeof(priv->connector.eld), len));
 +	mutex_unlock(&priv->audio_mutex);
 +
 +	return 0;
 +}
 +
 +static const struct hdmi_codec_ops audio_codec_ops = {
 +	.hw_params = tda998x_audio_hw_params,
 +	.audio_shutdown = tda998x_audio_shutdown,
 +	.digital_mute = tda998x_audio_digital_mute,
 +	.get_eld = tda998x_audio_get_eld,
 +};
 +
 +static int tda998x_audio_codec_init(struct tda998x_priv *priv,
 +				    struct device *dev)
 +{
 +	struct hdmi_codec_pdata codec_data = {
 +		.ops = &audio_codec_ops,
 +		.max_i2s_channels = 2,
 +	};
 +	int i;
 +
 +	for (i = 0; i < ARRAY_SIZE(priv->audio_port); i++) {
 +		if (priv->audio_port[i].format == AFMT_I2S &&
 +		    priv->audio_port[i].config != 0)
 +			codec_data.i2s = 1;
 +		if (priv->audio_port[i].format == AFMT_SPDIF &&
 +		    priv->audio_port[i].config != 0)
 +			codec_data.spdif = 1;
 +	}
 +
 +	priv->audio_pdev = platform_device_register_data(
 +		dev, HDMI_CODEC_DRV_NAME, PLATFORM_DEVID_AUTO,
 +		&codec_data, sizeof(codec_data));
 +
 +	return PTR_ERR_OR_ZERO(priv->audio_pdev);
 +}
 +
 +/* DRM connector functions */
 +
 +static int tda998x_connector_dpms(struct drm_connector *connector, int mode)
 +{
 +	if (drm_core_check_feature(connector->dev, DRIVER_ATOMIC))
 +		return drm_atomic_helper_connector_dpms(connector, mode);
 +	else
 +		return drm_helper_connector_dpms(connector, mode);
 +}
 +
 +static int tda998x_connector_fill_modes(struct drm_connector *connector,
 +					uint32_t maxX, uint32_t maxY)
 +{
 +	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
 +	int ret;
 +
 +	mutex_lock(&priv->audio_mutex);
 +	ret = drm_helper_probe_single_connector_modes(connector, maxX, maxY);
 +
 +	if (connector->edid_blob_ptr) {
 +		struct edid *edid = (void *)connector->edid_blob_ptr->data;
 +
 +		priv->sink_has_audio = drm_detect_monitor_audio(edid);
 +	} else {
 +		priv->sink_has_audio = false;
 +	}
 +	mutex_unlock(&priv->audio_mutex);
 +
 +	return ret;
 +}
 +
 +static enum drm_connector_status
 +tda998x_connector_detect(struct drm_connector *connector, bool force)
 +{
 +	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
 +	u8 val = cec_read(priv, REG_CEC_RXSHPDLEV);
 +
 +	return (val & CEC_RXSHPDLEV_HPD) ? connector_status_connected :
 +			connector_status_disconnected;
 +}
 +
 +static void tda998x_connector_destroy(struct drm_connector *connector)
 +{
 +	drm_connector_cleanup(connector);
 +}
 +
 +static const struct drm_connector_funcs tda998x_connector_funcs = {
 +	.dpms = tda998x_connector_dpms,
 +	.reset = drm_atomic_helper_connector_reset,
 +	.fill_modes = tda998x_connector_fill_modes,
 +	.detect = tda998x_connector_detect,
 +	.destroy = tda998x_connector_destroy,
 +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 +};
 +
 +static int read_edid_block(void *data, u8 *buf, unsigned int blk, size_t length)
 +{
 +	struct tda998x_priv *priv = data;
 +	u8 offset, segptr;
 +	int ret, i;
 +
 +	offset = (blk & 1) ? 128 : 0;
 +	segptr = blk / 2;
 +
 +	reg_write(priv, REG_DDC_ADDR, 0xa0);
 +	reg_write(priv, REG_DDC_OFFS, offset);
 +	reg_write(priv, REG_DDC_SEGM_ADDR, 0x60);
 +	reg_write(priv, REG_DDC_SEGM, segptr);
 +
 +	/* enable reading EDID: */
 +	priv->wq_edid_wait = 1;
 +	reg_write(priv, REG_EDID_CTRL, 0x1);
 +
 +	/* flag must be cleared by sw: */
 +	reg_write(priv, REG_EDID_CTRL, 0x0);
 +
 +	/* wait for block read to complete: */
 +	if (priv->hdmi->irq) {
 +		i = wait_event_timeout(priv->wq_edid,
 +					!priv->wq_edid_wait,
 +					msecs_to_jiffies(100));
 +		if (i < 0) {
 +			dev_err(&priv->hdmi->dev, "read edid wait err %d\n", i);
 +			return i;
 +		}
 +	} else {
 +		for (i = 100; i > 0; i--) {
 +			msleep(1);
 +			ret = reg_read(priv, REG_INT_FLAGS_2);
 +			if (ret < 0)
 +				return ret;
 +			if (ret & INT_FLAGS_2_EDID_BLK_RD)
 +				break;
 +		}
 +	}
 +
 +	if (i == 0) {
 +		dev_err(&priv->hdmi->dev, "read edid timeout\n");
 +		return -ETIMEDOUT;
  	}
  
 -	priv->dpms = mode;
 +	ret = reg_read_range(priv, REG_EDID_DATA_0, buf, length);
 +	if (ret != length) {
 +		dev_err(&priv->hdmi->dev, "failed to read edid block %d: %d\n",
 +			blk, ret);
 +		return ret;
 +	}
 +
 +	return 0;
 +}
 +
 +static int tda998x_connector_get_modes(struct drm_connector *connector)
 +{
 +	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
 +	struct edid *edid;
 +	int n;
 +
 +	/*
 +	 * If we get killed while waiting for the HPD timeout, return
 +	 * no modes found: we are not in a restartable path, so we
 +	 * can't handle signals gracefully.
 +	 */
 +	if (tda998x_edid_delay_wait(priv))
 +		return 0;
 +
 +	if (priv->rev == TDA19988)
 +		reg_clear(priv, REG_TX4, TX4_PD_RAM);
 +
 +	edid = drm_do_get_edid(connector, read_edid_block, priv);
 +
 +	if (priv->rev == TDA19988)
 +		reg_set(priv, REG_TX4, TX4_PD_RAM);
 +
 +	if (!edid) {
 +		dev_warn(&priv->hdmi->dev, "failed to read EDID\n");
 +		return 0;
 +	}
 +
 +	drm_mode_connector_update_edid_property(connector, edid);
 +	n = drm_add_edid_modes(connector, edid);
 +	drm_edid_to_eld(connector, edid);
 +
 +	kfree(edid);
 +
 +	return n;
  }
  
  static int tda998x_connector_mode_valid(struct drm_connector *connector,
