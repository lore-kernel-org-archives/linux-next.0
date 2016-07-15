From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Fri, 15 Jul 2016 06:32:45 +0200
Message-ID: <CA+icZUUM8ZwmffjthXGGMXQ-wSFizGs9Yc10ihKyKqgTyvg9vg@mail.gmail.com>
References: <20160715134052.030a8c15@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:34473 "EHLO
	mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750764AbcGOEcr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Jul 2016 00:32:47 -0400
In-Reply-To: <20160715134052.030a8c15@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>

On 7/15/16, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dave,
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> In file included from drivers/gpu/drm/i915/intel_opregion.c:34:0:
> drivers/gpu/drm/i915/intel_opregion.c: In function
> 'intel_opregion_get_panel_type':
> drivers/gpu/drm/i915/intel_opregion.c:1042:17: error: 'dev' undeclared
> (first use in this function)
>   if (IS_SKYLAKE(dev)) {
>                  ^
> drivers/gpu/drm/i915/i915_drv.h:2603:43: note: in definition of macro
> '__I915__'
>   if (__builtin_types_compatible_p(typeof(*p), struct drm_i915_private)) \
>                                            ^
> drivers/gpu/drm/i915/i915_drv.h:2670:26: note: in expansion of macro
> 'INTEL_INFO'
>  #define IS_SKYLAKE(dev) (INTEL_INFO(dev)->is_skylake)
>                           ^
> drivers/gpu/drm/i915/intel_opregion.c:1042:6: note: in expansion of macro
> 'IS_SKYLAKE'
>   if (IS_SKYLAKE(dev)) {
>       ^
> drivers/gpu/drm/i915/intel_opregion.c:1042:17: note: each undeclared
> identifier is reported only once for each function it appears in
>   if (IS_SKYLAKE(dev)) {
>                  ^
> drivers/gpu/drm/i915/i915_drv.h:2603:43: note: in definition of macro
> '__I915__'
>   if (__builtin_types_compatible_p(typeof(*p), struct drm_i915_private)) \
>                                            ^
> drivers/gpu/drm/i915/i915_drv.h:2670:26: note: in expansion of macro
> 'INTEL_INFO'
>  #define IS_SKYLAKE(dev) (INTEL_INFO(dev)->is_skylake)
>                           ^
> drivers/gpu/drm/i915/intel_opregion.c:1042:6: note: in expansion of macro
> 'IS_SKYLAKE'
>   if (IS_SKYLAKE(dev)) {
>       ^
>
> Caused by commit
>
>   6f9f4b7a2cf7 ("drm/i915/opregion: Convert to using native
> drm_i915_private")
>
> interacting with commit
>
>   aeddda06c1a7 ("drm/i915: Ignore panel type from OpRegion on SKL")
>
> from the drm-intel-fixes tree.
>
> I applied this merge fix patch:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 15 Jul 2016 13:34:05 +1000
> Subject: [PATCH] drm/i915/opregion: fix up for argument change
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/intel_opregion.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_opregion.c
> b/drivers/gpu/drm/i915/intel_opregion.c
> index 21f19641e33e..dcdb346b596c 100644
> --- a/drivers/gpu/drm/i915/intel_opregion.c
> +++ b/drivers/gpu/drm/i915/intel_opregion.c
> @@ -1039,7 +1039,7 @@ intel_opregion_get_panel_type(struct drm_i915_private
> *dev_priv)
>  	 * vswing instead. Low vswing results in some display flickers, so
>  	 * let's simply ignore the OpRegion panel type on SKL for now.
>  	 */
> -	if (IS_SKYLAKE(dev)) {
> +	if (IS_SKYLAKE(dev_priv)) {
>  		DRM_DEBUG_KMS("Ignoring OpRegion panel type (%d)\n", ret - 1);
>  		return -ENODEV;
>  	}
> --
> 2.8.1
>

I fell over the same issue when testing drm-intel-nightly and sent a patch.

- Sedat -

https://lists.freedesktop.org/archives/intel-gfx/2016-July/100691.html
