From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the dwmw2-iommu tree
Date: Thu, 15 Oct 2015 13:55:00 +1100
Message-ID: <20151015135500.5fe9af8f@canb.auug.org.au>
References: <20151012183257.258edc4c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51284 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753674AbbJOCzD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Oct 2015 22:55:03 -0400
In-Reply-To: <20151012183257.258edc4c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi David,

On Mon, 12 Oct 2015 18:32:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the dwmw2-iommu tree, today's linux-next build (i386
> defconfig) failed like this:
> 
> In file included from drivers/gpu/drm/i915/i915_drv.h:50:0,
>                  from drivers/gpu/drm/i915/i915_drv.c:34:
> include/linux/intel-iommu.h:477:22: error: field 'notifier' has incomplete type
>   struct mmu_notifier notifier;
>                       ^
> 
> Caused by commit
> 
>   a7002bccff99 ("iommu/vt-d: Add intel_svm_{un,}bind_mm() functions")
> 
> I have added the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 12 Oct 2015 17:51:50 +1100
> Subject: [PATCH] iommu/vt-d: fix for "Add intel_svm_{un,}bind_mm() functions"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/intel-iommu.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
> index aa7e02d623c9..39a382cbbbd4 100644
> --- a/include/linux/intel-iommu.h
> +++ b/include/linux/intel-iommu.h
> @@ -474,7 +474,9 @@ extern int intel_svm_finish_prq(struct intel_iommu *iommu);
>  
>  struct intel_svm {
>  	struct kref kref;
> +#ifdef CONFIG_MMU_NOTIFIER
>  	struct mmu_notifier notifier;
> +#endif
>  	struct mm_struct *mm;
>  	struct intel_iommu *iommu;
>  	struct device *dev;
> -- 
> 2.5.3

Ping?

Of course my patch did not apply today since the kref has now vanished
in a rebase ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
