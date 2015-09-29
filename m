From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Date: Tue, 29 Sep 2015 11:20:01 +1000
Message-ID: <20150929112001.0195ae6c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58056 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753742AbbI2BUD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Sep 2015 21:20:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Henningsson <david.henningsson@canonical.com>, Takashi Iwai <tiwai@suse.de>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_audio.c

between commit:

  51e1d83cab99 ("drm/i915: Call audio pin/ELD notify function")

from Linus' tree and commit:

  b8abe859c9d6 ("drm/i915: Always call the adjusted mode 'adjusted_mode'")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_audio.c
index 2a5c76faf9f8,b12df81e4dcc..000000000000
--- a/drivers/gpu/drm/i915/intel_audio.c
+++ b/drivers/gpu/drm/i915/intel_audio.c
@@@ -400,11 -401,8 +401,11 @@@ void intel_audio_codec_enable(struct in
  	struct drm_connector *connector;
  	struct drm_device *dev = encoder->dev;
  	struct drm_i915_private *dev_priv = dev->dev_private;
 +	struct i915_audio_component *acomp = dev_priv->audio_component;
 +	struct intel_digital_port *intel_dig_port = enc_to_dig_port(encoder);
 +	enum port port = intel_dig_port->port;
  
- 	connector = drm_select_eld(encoder, mode);
+ 	connector = drm_select_eld(encoder, adjusted_mode);
  	if (!connector)
  		return;
  
@@@ -419,13 -417,11 +420,14 @@@
  	if (intel_pipe_has_type(crtc, INTEL_OUTPUT_DISPLAYPORT))
  		connector->eld[5] |= (1 << 2);
  
- 	connector->eld[6] = drm_av_sync_delay(connector, mode) / 2;
+ 	connector->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
  
  	if (dev_priv->display.audio_codec_enable)
- 		dev_priv->display.audio_codec_enable(connector, intel_encoder, mode);
+ 		dev_priv->display.audio_codec_enable(connector, intel_encoder,
+ 						     adjusted_mode);
 +
 +	if (acomp && acomp->audio_ops && acomp->audio_ops->pin_eld_notify)
 +		acomp->audio_ops->pin_eld_notify(acomp->audio_ops->audio_ptr, (int) port);
  }
  
  /**
