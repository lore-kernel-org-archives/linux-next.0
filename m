From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] linux-next: build failure after merge of the
 drm-misc tree
Date: Tue, 5 Dec 2017 17:21:54 -0800
Message-ID: <20171206012154.rzeyq6yuhhvsylxp@intel.com>
References: <20171206120015.66d85f77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171206120015.66d85f77@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Hans de Goede <j.w.r.degoede@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 06, 2017 at 01:00:15AM +0000, Stephen Rothwell wrote:
> Hi all,

Hi Stephen,

I had just written the email for you about this.
Feel free to ignore that one since you already found the solution
and sorry for the delay on warning you.

> 
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/i915/intel_dsi.c: In function 'intel_dsi_get_panel_orientation':
> drivers/gpu/drm/i915/intel_dsi.c:1673:13: error: storage size of 'plane' isn't known
>   enum plane plane;
>              ^
> 
> Caused by commit
> 
>   82daca297506 ("drm/i915: Add "panel orientation" property to the panel connector, v6.")
> 
> interacting with commit
> 
>   ed15030d7ab0 ("drm/i915: s/enum plane/enum i9xx_plane_id/")
> 
> from the drm-intel tree.
> 
> I have applied the following merge fix patch for today.

Yes, that's the right one.

Thanks,
Rodrigo.

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 6 Dec 2017 11:56:32 +1100
> Subject: [PATCH] drm/i915: fix up for "drm/i915: s/enum plane/enum
>  i9xx_plane_id/"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/intel_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_dsi.c b/drivers/gpu/drm/i915/intel_dsi.c
> index 1b60df3c14a0..f67d321376e4 100644
> --- a/drivers/gpu/drm/i915/intel_dsi.c
> +++ b/drivers/gpu/drm/i915/intel_dsi.c
> @@ -1670,7 +1670,7 @@ static int intel_dsi_get_panel_orientation(struct intel_connector *connector)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	int orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
> -	enum plane plane;
> +	enum i9xx_plane_id plane;
>  	u32 val;
>  
>  	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
> -- 
> 2.15.0
> 
> -- 
> Cheers,
> Stephen Rothwell
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
