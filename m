From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] gma500: Fix build without ACPI
Date: Wed, 09 May 2012 10:42:00 -0700
Message-ID: <4FAAAC68.7080400@xenotime.net>
References: <20120509165845.24231.53861.stgit@bluebook>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:40624 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1758230Ab2EIRlq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 May 2012 13:41:46 -0400
In-Reply-To: <20120509165845.24231.53861.stgit@bluebook>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

On 05/09/2012 09:59 AM, Alan Cox wrote:

> From: Alan Cox <alan@linux.intel.com>
> 
> Give this a try Randy..

That works.  Thanks.

Acked-by: Randy Dunlap <rdunlap@xenotime.net>


> Reported-by: Randy Dunlap <rdunlap@xenotime.net>
> Signed-off-by: Alan Cox <alan@linux.intel.com>
> ---
> 
>  drivers/gpu/drm/gma500/Makefile   |    3 ++-
>  drivers/gpu/drm/gma500/opregion.c |    6 ------
>  drivers/gpu/drm/gma500/opregion.h |   22 +++++++++++++++++++++-
>  drivers/gpu/drm/gma500/psb_drv.h  |    6 ------
>  4 files changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/Makefile
> index dd7d6b5..abfa2a93 100644
> --- a/drivers/gpu/drm/gma500/Makefile
> +++ b/drivers/gpu/drm/gma500/Makefile
> @@ -13,7 +13,6 @@ gma500_gfx-y += gem_glue.o \
>  	  intel_i2c.o \
>  	  intel_gmbus.o \
>  	  mmu.o \
> -	  opregion.o \
>  	  power.o \
>  	  psb_drv.o \
>  	  psb_intel_display.o \
> @@ -25,6 +24,8 @@ gma500_gfx-y += gem_glue.o \
>  	  psb_device.o \
>  	  mid_bios.o
>  
> +gma500_gfx-$(CONFIG_ACPI) +=  opregion.o \
> +
>  gma500_gfx-$(CONFIG_DRM_GMA3600) +=  cdv_device.o \
>  	  cdv_intel_crt.o \
>  	  cdv_intel_display.o \
> diff --git a/drivers/gpu/drm/gma500/opregion.c b/drivers/gpu/drm/gma500/opregion.c
> index 05661bf..aa9e89f 100644
> --- a/drivers/gpu/drm/gma500/opregion.c
> +++ b/drivers/gpu/drm/gma500/opregion.c
> @@ -21,10 +21,8 @@
>   * DEALINGS IN THE SOFTWARE.
>   *
>   */
> -#ifdef CONFIG_ACPI
>  #include <linux/acpi.h>
>  #include <linux/acpi_io.h>
> -#endif
>  #include "psb_drv.h"
>  #include "psb_intel_reg.h"
>  
> @@ -311,11 +309,7 @@ int psb_intel_opregion_setup(struct drm_device *dev)
>  		return -ENOTSUPP;
>  	}
>  	DRM_DEBUG("OpRegion detected at 0x%8x\n", opregion_phy);
> -#ifdef CONFIG_ACPI
>  	base = acpi_os_ioremap(opregion_phy, 8*1024);
> -#else
> -	base = ioremap(opregion_phy, 8*1024);
> -#endif
>  	if (!base)
>  		return -ENOMEM;
>  
> diff --git a/drivers/gpu/drm/gma500/opregion.h b/drivers/gpu/drm/gma500/opregion.h
> index a392ea8..72dc6b9 100644
> --- a/drivers/gpu/drm/gma500/opregion.h
> +++ b/drivers/gpu/drm/gma500/opregion.h
> @@ -22,8 +22,28 @@
>   *
>   */
>  
> +#if defined(CONFIG_ACPI)
>  extern void psb_intel_opregion_asle_intr(struct drm_device *dev);
> -extern void psb_intel_opregion_enable_asle(struct drm_device *dev);
>  extern void psb_intel_opregion_init(struct drm_device *dev);
>  extern void psb_intel_opregion_fini(struct drm_device *dev);
>  extern int psb_intel_opregion_setup(struct drm_device *dev);
> +
> +#else
> +
> +extern inline void psb_intel_opregion_asle_intr(struct drm_device *dev)
> +{
> +}
> +
> +extern inline void psb_intel_opregion_init(struct drm_device *dev)
> +{
> +}
> +
> +extern inline void psb_intel_opregion_fini(struct drm_device *dev)
> +{
> +}
> +
> +extern inline int psb_intel_opregion_setup(struct drm_device *dev)
> +{
> +	return 0;
> +}
> +#endif
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index 270a27b..309a642 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -808,12 +808,6 @@ psb_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
>  extern u32 psb_get_vblank_counter(struct drm_device *dev, int crtc);
>  
>  /*
> - * intel_opregion.c
> - */
> -extern int gma_intel_opregion_init(struct drm_device *dev);
> -extern int gma_intel_opregion_exit(struct drm_device *dev);
> -
> -/*
>   * framebuffer.c
>   */
>  extern int psbfb_probed(struct drm_device *dev);
> 



-- 
~Randy
