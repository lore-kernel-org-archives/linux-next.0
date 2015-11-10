From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] instmem/gk20a: do not use non-portable dma_to_phys()
Date: Tue, 10 Nov 2015 14:41:44 -0800
Message-ID: <20151110144144.39c2a4109c26e91f4f3fb47b@linux-foundation.org>
References: <1447132247-9767-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447132247-9767-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Dave Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com
List-Id: linux-next.vger.kernel.org

On Tue, 10 Nov 2015 14:10:47 +0900 Alexandre Courbot <acourbot@nvidia.com> wrote:

> dma_to_phys() is not guaranteed to be available on all platforms and
> should not be used outside of arch/. Replace it with what it is expected
> to do in our case: simply cast the DMA handle to a physical address.

mainline i386 allmodconfig is now busted.

> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> @@ -134,13 +134,17 @@ static void __iomem *
>  gk20a_instobj_cpu_map_dma(struct nvkm_memory *memory)
>  {
>  	struct gk20a_instobj_dma *node = gk20a_instobj_dma(memory);
> -	struct device *dev = node->base.imem->base.subdev.device->dev;
>  	int npages = nvkm_memory_size(memory) >> 12;
>  	struct page *pages[npages];
>  	int i;
>  
> -	/* phys_to_page does not exist on all platforms... */
> -	pages[0] = pfn_to_page(dma_to_phys(dev, node->handle) >> PAGE_SHIFT);
> +	/*
> +	 * Ideally we would have a function to translate a handle to a physical
> +	 * address, but there is no portable way of doing this. However since we
> +	 * always use the DMA API without an IOMMU, we can assume that handles
> +	 * are actual physical addresses.
> +	 */
> +	pages[0] = pfn_to_page(((phys_addr_t)node->handle) >> PAGE_SHIFT);

This looks ugly.

What's actually going on here?  Why is this driver doing something which
no other driver appears to need to do?

Is it the driver which is broken, or are the core kernel APIs inadequate?

If the latter, what can we do to fix them up?

IOW, how do we fix this properly?
