From: Joerg Roedel <joro@8bytes.org>
Subject: Re: linux-next: build failure after merge of the iommu tree
Date: Wed, 5 Nov 2014 12:16:56 +0100
Message-ID: <20141105111656.GJ10744@8bytes.org>
References: <20141105134731.799a1a3d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141105134731.799a1a3d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Olav Haugan <ohaugan@codeaurora.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

On Wed, Nov 05, 2014 at 01:47:31PM +1100, Stephen Rothwell wrote:
> Hi Joerg,
> 
> After merging the iommu tree, today's linux-next build (powerpc
> pc64_defconfig) failed like this:
> 
> In file included from arch/powerpc/platforms/powernv/pci.c:33:0:
> arch/powerpc/include/asm/iommu.h:140:12: error: conflicting types for 'iommu_map_sg'
>  extern int iommu_map_sg(struct device *dev, struct iommu_table *tbl,
>             ^
> In file included from arch/powerpc/platforms/powernv/pci.c:23:0:
> include/linux/iommu.h:311:22: note: previous definition of 'iommu_map_sg' was here
>  static inline size_t iommu_map_sg(struct iommu_domain *domain,
>                       ^
> 
> Caused by commit 315786ebbf4a ("iommu: Add iommu_map_sg() function").
> Grep is your friend ...
> 
> I have used the iommu tree from next-20141104 for today.

Thanks Stephen, I exluded the my core branch from next for now until the
issue is fixed.


	Joerg
