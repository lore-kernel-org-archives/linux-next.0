From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Mon, 9 Nov 2015 08:45:10 -0800
Message-ID: <20151109164510.GA26721@roeck-us.net>
References: <20151104202226.28468a03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42712 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751779AbbKIQpN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2015 11:45:13 -0500
Content-Disposition: inline
In-Reply-To: <20151104202226.28468a03@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>

On Wed, Nov 04, 2015 at 08:22:26PM +1100, Stephen Rothwell wrote:
> Hi Dave,
> 
> After merging the drm tree, today's linux-next build (s390 allmodconfig)
> failed like this:
> 
> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c:143:2: error: implicit declaration of function 'dma_to_phys' [-Werror=implicit-function-declaration]
> 
> Caused by commit
> 
>   69c4938249fb ("drm/nouveau/instmem/gk20a: use direct CPU access")
> 
> Discovered after the release.
> 
Still seen in next-20151109, affecting at least alpha, i386, parisc, s390,
and xtensa, but probably other architectures as well.

dma_to_phys() was until now not used from driver code, and is only declared
for an architecture if it is used/needed there.

Also:

ERROR: "drm_gem_cma_create" [drivers/gpu/drm/vc4/vc4.ko] undefined!
ERROR: "drm_gem_cma_prime_mmap" [drivers/gpu/drm/vc4/vc4.ko] undefined!
ERROR: "drm_gem_cma_prime_get_sg_table" [drivers/gpu/drm/vc4/vc4.ko] undefined!
ERROR: "drm_gem_cma_vm_ops" [drivers/gpu/drm/vc4/vc4.ko] undefined!
ERROR: "drm_gem_cma_mmap" [drivers/gpu/drm/vc4/vc4.ko] undefined!
ERROR: "drm_gem_cma_prime_vunmap" [drivers/gpu/drm/vc4/vc4.ko] undefined!
ERROR: "drm_gem_cma_prime_import_sg_table" [drivers/gpu/drm/vc4/vc4.ko] undefined!
ERROR: "drm_gem_cma_free_object" [drivers/gpu/drm/vc4/vc4.ko] undefined!
ERROR: "drm_gem_cma_prime_vmap" [drivers/gpu/drm/vc4/vc4.ko] undefined!
ERROR: "drm_gem_cma_dumb_map_offset" [drivers/gpu/drm/vc4/vc4.ko] undefined!
ERROR: "drm_gem_cma_create" [drivers/gpu/drm/drm_kms_helper.ko] undefined!
ERROR: "drm_gem_cma_describe" [drivers/gpu/drm/drm_kms_helper.ko] undefined!
ERROR: "drm_gem_cma_free_object" [drivers/gpu/drm/drm_kms_helper.ko] undefined!

seen with m68k:allmodconfig.

Guenter
