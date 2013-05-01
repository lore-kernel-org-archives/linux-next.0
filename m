From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: manual merge of the drm-intel tree with the drm tree
Date: Wed, 1 May 2013 10:08:40 +0200
Message-ID: <CAKMK7uE8M3gCbwmuxBrh0StqyRd0hyX+7YgZhUg-PcX8uJg+5Q@mail.gmail.com>
References: <20130501143734.5305cf8e4cef42c19a1bd5ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:43193 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753821Ab3EAIIm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 May 2013 04:08:42 -0400
Received: by mail-ie0-f176.google.com with SMTP id x14so1650174ief.35
        for <linux-next@vger.kernel.org>; Wed, 01 May 2013 01:08:41 -0700 (PDT)
In-Reply-To: <20130501143734.5305cf8e4cef42c19a1bd5ce@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-next <linux-next@vger.kernel.org>, =?ISO-8859-1?Q?linux=2Dkernel=40vger=2Ekernel=2Eorg=2E_Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Dave Airlie <airlied@linux.ie>

On Wed, May 1, 2013 at 6:37 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the drm-intel tree got a conflict in
> drivers/gpu/drm/i915/i915_reg.h between commit a65851af5938 ("drm/i915:
> Make data/link N value power of two") from the drm tree and commit
> 72419203cab9 ("drm/i915: hw state readout support for fdi m/n") from the
> drm-intel tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.
-Daniel

>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>
> diff --cc drivers/gpu/drm/i915/i915_reg.h
> index 83f9c26,b5d87bd..0000000
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@@ -2652,11 -2774,11 +2774,12 @@@
>   #define _PIPEB_GMCH_DATA_M                    0x71050
>
>   /* Transfer unit size for display port - 1, default is 0x3f (for TU size 64) */
>  -#define   PIPE_GMCH_DATA_M_TU_SIZE_MASK               (0x3f << 25)
>  -#define   PIPE_GMCH_DATA_M_TU_SIZE_SHIFT      25
>  +#define  TU_SIZE(x)             (((x)-1) << 25) /* default size 64 */
>  +#define  TU_SIZE_MASK           (0x3f << 25)
> + #define  TU_SIZE_SHIFT                25
>
>  -#define   PIPE_GMCH_DATA_M_MASK                       (0xffffff)
>  +#define  DATA_LINK_M_N_MASK   (0xffffff)
>  +#define  DATA_LINK_N_MAX      (0x800000)
>
>   #define _PIPEA_GMCH_DATA_N                    0x70054
>   #define _PIPEB_GMCH_DATA_N                    0x71054



--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
