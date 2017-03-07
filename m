From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: linux-next: manual merge of the sunxi tree with the drm-misc tree
Date: Tue, 7 Mar 2017 11:05:30 +0800
Message-ID: <CAGb2v64AnGU=y7ZcOPV=ppNsxjiOHO3TgsBUgP5cp5=vfaTMaA@mail.gmail.com>
References: <20170307105906.214e7bec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:56372 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754829AbdCGDIV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Mar 2017 22:08:21 -0500
In-Reply-To: <20170307105906.214e7bec@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Chen-Yu Tsai <wens@csie.org>

On Tue, Mar 7, 2017 at 7:59 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the sunxi tree got a conflict in:
>
>   drivers/gpu/drm/sun4i/sun4i_drv.c
>
> between commit:
>
>   50480a78e282 ("drm: sun4i: use vblank hooks in struct drm_crtc_funcs")
>
> from the drm-misc tree and commit:
>
>   1c313a69e3ea ("drm/sun4i: Move layers from sun4i_drv to sun4i_crtc")
>
> from the sunxi tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/gpu/drm/sun4i/sun4i_drv.c
> index 9ccf7c4deb6d,1ec5b825aa64..000000000000
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@@ -20,10 -21,31 +21,8 @@@
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_of.h>
>
> - #include "sun4i_crtc.h"
>   #include "sun4i_drv.h"
>   #include "sun4i_framebuffer.h"
> - #include "sun4i_layer.h"
>  -#include "sun4i_tcon.h"
>  -
>  -static int sun4i_drv_enable_vblank(struct drm_device *drm, unsigned int pipe)
>  -{
>  -      struct sun4i_drv *drv = drm->dev_private;
>  -      struct sun4i_tcon *tcon = drv->tcon;
>  -
>  -      DRM_DEBUG_DRIVER("Enabling VBLANK on pipe %d\n", pipe);
>  -
>  -      sun4i_tcon_enable_vblank(tcon, true);
>  -
>  -      return 0;
>  -}
>  -
>  -static void sun4i_drv_disable_vblank(struct drm_device *drm, unsigned int pipe)
>  -{
>  -      struct sun4i_drv *drv = drm->dev_private;
>  -      struct sun4i_tcon *tcon = drv->tcon;
>  -
>  -      DRM_DEBUG_DRIVER("Disabling VBLANK on pipe %d\n", pipe);
>  -
>  -      sun4i_tcon_enable_vblank(tcon, false);
>  -}
>
>   static const struct file_operations sun4i_drv_fops = {
>         .owner          = THIS_MODULE,

Thanks. This looks correct when combined with the fix you sent out.

Maxime, how would you like to handle this?

ChenYu
