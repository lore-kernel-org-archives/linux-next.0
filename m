From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20160518 build: 2 failures 20 warnings (next-20160518)
Date: Thu, 19 May 2016 10:00:08 +1000
Message-ID: <20160519100008.1b55c5e7@canb.auug.org.au>
References: <E1b2vXq-0003Ij-Ek@optimist>
	<20160518101559.GJ8104@sirena.org.uk>
	<20160518102357.GG30479@nuc-i3427.alporthouse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42854 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750736AbcESAAO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 May 2016 20:00:14 -0400
In-Reply-To: <20160518102357.GG30479@nuc-i3427.alporthouse.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>, Jie Qiu <jie.qiu@mediatek.com>, CK Hu <ck.hu@mediatek.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Chris,

On Wed, 18 May 2016 11:23:57 +0100 Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> I'm pretty sure they didn't exist when I wrote the patch!

Yeah, but they do in the drm-misc tree where your patch was applied ...
so someone should do a fix patch to be applied to that tree.  In the
mean time, I will apply the below as a merge fix in linux-next.

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_fb.c b/drivers/gpu/drm/mediatek/mtk_drm_fb.c
> index 33d30c19f35f..147df85399ab 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_fb.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_fb.c
> @@ -138,7 +138,7 @@ struct drm_framebuffer *mtk_drm_mode_fb_create(struct drm_device *dev,
>         if (drm_format_num_planes(cmd->pixel_format) != 1)
>                 return ERR_PTR(-EINVAL);
>  
> -       gem = drm_gem_object_lookup(dev, file, cmd->handles[0]);
> +       gem = drm_gem_object_lookup(file, cmd->handles[0]);
>         if (!gem)
>                 return ERR_PTR(-ENOENT);
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index a773bfaea913..fa2ec0cd00e8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -139,7 +139,7 @@ int mtk_drm_gem_dumb_map_offset(struct drm_file *file_priv,
>         struct drm_gem_object *obj;
>         int ret;
>  
> -       obj = drm_gem_object_lookup(dev, file_priv, handle);
> +       obj = drm_gem_object_lookup(file_priv, handle);
>         if (!obj) {
>                 DRM_ERROR("failed to lookup gem object.\n");
>                 return -EINVAL;

-- 
Cheers,
Stephen Rothwell
