From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 24 Feb 2015 01:59:09 +0100
Message-ID: <20150224005909.GN24485@phenom.ffwll.local>
References: <20150224114140.3d310574@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:42760 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752429AbbBXA5d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Feb 2015 19:57:33 -0500
Received: by wghl2 with SMTP id l2so2207868wgh.9
        for <linux-next@vger.kernel.org>; Mon, 23 Feb 2015 16:57:32 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20150224114140.3d310574@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

On Tue, Feb 24, 2015 at 11:41:40AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/gpu/drm/tegra/drm.c: In function 'tegra_atomic_complete':
> drivers/gpu/drm/tegra/drm.c:58:2: error: implicit declaration of function 'drm_atomic_helper_commit_pre_planes' [-Werror=implicit-function-declaration]
>   drm_atomic_helper_commit_pre_planes(drm, state);
>   ^
> drivers/gpu/drm/tegra/drm.c:60:2: error: implicit declaration of function 'drm_atomic_helper_commit_post_planes' [-Werror=implicit-function-declaration]
>   drm_atomic_helper_commit_post_planes(drm, state);
>   ^
> 
> Caused by commit ad9e7c89a4e4 ("drm/atomic-helper: Rename
> commmit_post/pre_planes") interacting with commit 1503ca47d76e
> ("drm/tegra: Atomic conversion, phase 3, step 3") from v4.0-rc1.
> 
> I added the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 24 Feb 2015 11:37:11 +1100
> Subject: [PATCH] drm/atomic-helper: fix for Rename commmit_post/pre_planes
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

I've squashed this into the relevant patch in drm-misc, thanks for
reporting and fixing this.
-Daniel

> ---
>  drivers/gpu/drm/tegra/drm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 7dd328d77996..5f1880766110 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -55,9 +55,9 @@ static void tegra_atomic_complete(struct tegra_drm *tegra,
>  	 * current layout.
>  	 */
>  
> -	drm_atomic_helper_commit_pre_planes(drm, state);
> +	drm_atomic_helper_commit_modeset_disables(drm, state);
>  	drm_atomic_helper_commit_planes(drm, state);
> -	drm_atomic_helper_commit_post_planes(drm, state);
> +	drm_atomic_helper_commit_modeset_enables(drm, state);
>  
>  	drm_atomic_helper_wait_for_vblanks(drm, state);
>  
> -- 
> 2.1.4
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
