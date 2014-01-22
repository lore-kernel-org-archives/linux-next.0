From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: manual merge of the drm-intel tree with the drm tree
Date: Wed, 22 Jan 2014 11:06:25 +0100
Message-ID: <CAKMK7uF+p96YtDo3NG4nBV5S5gYXk55p5KUOxsb+PMY+MH_Zyw@mail.gmail.com>
References: <20140122140402.20163da276690810a1040909@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:39173 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751773AbaAVKGZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Jan 2014 05:06:25 -0500
Received: by mail-ie0-f180.google.com with SMTP id at1so8348232iec.39
        for <linux-next@vger.kernel.org>; Wed, 22 Jan 2014 02:06:25 -0800 (PST)
In-Reply-To: <20140122140402.20163da276690810a1040909@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?ISO-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>

Hi Stephen,

On Wed, Jan 22, 2014 at 4:04 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the drm-intel tree got a conflict in
> drivers/gpu/drm/i915/i915_irq.c between commit abca9e454498 ("drm: Pass
> 'flags' from the caller to .get_scanout_position()") from the drm tree
> and commit d59a63ad8234 ("drm/i915: Add intel_get_crtc_scanline()") from
> the drm-intel tree.
>
> I fixed it up (I think - see below) and can carry the fix as necessary
> (no action is required).

Oops, this patch escaped - it's only for 3.15. I've shuffled my
branches around now for the merge window so this should not pop up in
your -next tree again until 3.15 starts.

Yours, Daniel

>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>
> diff --cc drivers/gpu/drm/i915/i915_irq.c
> index 17d8fcb1b6f7,ffb56a9db9cc..000000000000
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@@ -649,8 -675,9 +649,9 @@@ static bool ilk_pipe_in_vblank_locked(s
>   }
>
>   static int i915_get_crtc_scanoutpos(struct drm_device *dev, int pipe,
>  -                                  int *vpos, int *hpos,
>  +                                  unsigned int flags, int *vpos, int *hpos,
> -                                   ktime_t *stime, ktime_t *etime)
> +                                   ktime_t *stime, ktime_t *etime,
> +                                   bool adjust)
>   {
>         struct drm_i915_private *dev_priv = dev->dev_private;
>         struct drm_crtc *crtc = dev_priv->pipe_to_crtc_mapping[pipe];
> @@@ -788,6 -786,24 +791,24 @@@
>         return ret;
>   }
>
> + static int i915_get_scanout_position(struct drm_device *dev, int pipe,
> +                                    int *vpos, int *hpos,
> +                                    ktime_t *stime, ktime_t *etime)
> + {
>  -      return i915_get_crtc_scanoutpos(dev, pipe, vpos, hpos,
> ++      return i915_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
> +                                       stime, etime, true);
> + }
> +
> + int intel_get_crtc_scanline(struct drm_crtc *crtc)
> + {
> +       int vpos = 0, hpos = 0;
> +
>  -      i915_get_crtc_scanoutpos(crtc->dev, to_intel_crtc(crtc)->pipe,
> ++      i915_get_crtc_scanoutpos(crtc->dev, to_intel_crtc(crtc)->pipe, 0,
> +                                &vpos, &hpos, NULL, NULL, false);
> +
> +       return vpos;
> + }
> +
>   static int i915_get_vblank_timestamp(struct drm_device *dev, int pipe,
>                               int *max_error,
>                               struct timeval *vblank_time,



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
