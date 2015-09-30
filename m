From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree with the drm-intel tree
Date: Wed, 30 Sep 2015 11:39:21 +1000
Message-ID: <20150930113921.3ce0b9e4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45579 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751633AbbI3BjW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Sep 2015 21:39:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Libin Yang <libin.yang@intel.com>

Hi Takashi,

Today's linux-next merge of the sound tree got a conflict in:

  drivers/gpu/drm/i915/intel_audio.c

between commit:

  3c85f5027595 ("drm/i915: s/mode/adjusted_mode/ in functions that really get passed the adjusted_mode")

from the drm-intel tree and commit:

  7e8275c2f2bb ("drm/i915: set proper N/CTS in modeset")

from the sound tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_audio.c
index b08b4a7fae49,bf2642eb4ee7..000000000000
--- a/drivers/gpu/drm/i915/intel_audio.c
+++ b/drivers/gpu/drm/i915/intel_audio.c
@@@ -68,8 -68,33 +68,33 @@@ static const struct 
  	{ 148500, AUD_CONFIG_PIXEL_CLOCK_HDMI_148500 },
  };
  
+ /* HDMI N/CTS table */
+ #define TMDS_297M 297000
+ #define TMDS_296M DIV_ROUND_UP(297000 * 1000, 1001)
+ static const struct {
+ 	int sample_rate;
+ 	int clock;
+ 	int n;
+ 	int cts;
+ } aud_ncts[] = {
+ 	{ 44100, TMDS_296M, 4459, 234375 },
+ 	{ 44100, TMDS_297M, 4704, 247500 },
+ 	{ 48000, TMDS_296M, 5824, 281250 },
+ 	{ 48000, TMDS_297M, 5120, 247500 },
+ 	{ 32000, TMDS_296M, 5824, 421875 },
+ 	{ 32000, TMDS_297M, 3072, 222750 },
+ 	{ 88200, TMDS_296M, 8918, 234375 },
+ 	{ 88200, TMDS_297M, 9408, 247500 },
+ 	{ 96000, TMDS_296M, 11648, 281250 },
+ 	{ 96000, TMDS_297M, 10240, 247500 },
+ 	{ 176400, TMDS_296M, 17836, 234375 },
+ 	{ 176400, TMDS_297M, 18816, 247500 },
+ 	{ 192000, TMDS_296M, 23296, 281250 },
+ 	{ 192000, TMDS_297M, 20480, 247500 },
+ };
+ 
  /* get AUD_CONFIG_PIXEL_CLOCK_HDMI_* value for mode */
 -static u32 audio_config_hdmi_pixel_clock(struct drm_display_mode *mode)
 +static u32 audio_config_hdmi_pixel_clock(const struct drm_display_mode *adjusted_mode)
  {
  	int i;
  
@@@ -252,8 -325,28 +326,28 @@@ static void hsw_audio_codec_enable(stru
  	if (intel_pipe_has_type(intel_crtc, INTEL_OUTPUT_DISPLAYPORT))
  		tmp |= AUD_CONFIG_N_VALUE_INDEX;
  	else
 -		tmp |= audio_config_hdmi_pixel_clock(mode);
 +		tmp |= audio_config_hdmi_pixel_clock(adjusted_mode);
+ 
+ 	tmp &= ~AUD_CONFIG_N_PROG_ENABLE;
 -	if (audio_rate_need_prog(intel_crtc, mode)) {
++	if (audio_rate_need_prog(intel_crtc, adjusted_mode)) {
+ 		if (!acomp)
+ 			rate = 0;
+ 		else if (port >= PORT_A && port <= PORT_E)
+ 			rate = acomp->aud_sample_rate[port];
+ 		else {
+ 			DRM_ERROR("invalid port: %d\n", port);
+ 			rate = 0;
+ 		}
 -		n = audio_config_get_n(mode, rate);
++		n = audio_config_get_n(adjusted_mode, rate);
+ 		if (n != 0)
+ 			tmp = audio_config_setup_n_reg(n, tmp);
+ 		else
+ 			DRM_DEBUG_KMS("no suitable N value is found\n");
+ 	}
+ 
  	I915_WRITE(HSW_AUD_CFG(pipe), tmp);
+ 
+ 	mutex_unlock(&dev_priv->av_mutex);
  }
  
  static void ilk_audio_codec_disable(struct intel_encoder *encoder)
