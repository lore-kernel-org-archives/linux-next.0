From: Baoquan He <bhe@redhat.com>
Subject: Re: linux-next: manual merge of the tip tree with the iommu tree
Date: Tue, 22 Aug 2017 13:57:58 +0800
Message-ID: <20170822055758.GB12401@x1>
References: <20170822135057.776f3509@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170822135057.776f3509@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 08/22/17 at 01:50pm, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got conflicts in:
> 
>   drivers/iommu/amd_iommu.c
>   drivers/iommu/amd_iommu_init.c
>   drivers/iommu/amd_iommu_proto.h
>   drivers/iommu/amd_iommu_types.h
> 
> between commits:
> 
>   4c232a708be1 ("iommu/amd: Detect pre enabled translation")
>   9494ea90a56d ("Revert "iommu/amd: Suppress IO_PAGE_FAULTs in kdump kernel"")
>   07a80a6b5920 ("iommu/amd: Define bit fields for DTE particularly")
>   daae2d25a477 ("iommu/amd: Don't copy GCR3 table root pointer")
> 
> from the iommu tree and commit:
> 
>   2543a786aa25 ("iommu/amd: Allow the AMD IOMMU to work with memory encryption")

Could you tell where the above commit is put? I can have a look.

Thanks
Baoquan

> 
> from the tip tree.
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
> diff --cc drivers/iommu/amd_iommu.c
> index 31bce367866c,4ad7e5e31943..000000000000
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@@ -1476,10 -1538,10 +1478,10 @@@ static int iommu_map_page(struct protec
>   			return -EBUSY;
>   
>   	if (count > 1) {
> - 		__pte = PAGE_SIZE_PTE(phys_addr, page_size);
> + 		__pte = PAGE_SIZE_PTE(__sme_set(phys_addr), page_size);
>  -		__pte |= PM_LEVEL_ENC(7) | IOMMU_PTE_P | IOMMU_PTE_FC;
>  +		__pte |= PM_LEVEL_ENC(7) | IOMMU_PTE_PR | IOMMU_PTE_FC;
>   	} else
> - 		__pte = phys_addr | IOMMU_PTE_PR | IOMMU_PTE_FC;
>  -		__pte = __sme_set(phys_addr) | IOMMU_PTE_P | IOMMU_PTE_FC;
> ++		__pte = __sme_set(phys_addr) | IOMMU_PTE_PR | IOMMU_PTE_FC;
>   
>   	if (prot & IOMMU_PROT_IR)
>   		__pte |= IOMMU_PTE_IR;
> diff --cc drivers/iommu/amd_iommu_init.c
> index ff8887ac5555,2292a6cece76..000000000000
> --- a/drivers/iommu/amd_iommu_init.c
> +++ b/drivers/iommu/amd_iommu_init.c
> @@@ -29,6 -29,8 +29,7 @@@
>   #include <linux/export.h>
>   #include <linux/iommu.h>
>   #include <linux/kmemleak.h>
>  -#include <linux/crash_dump.h>
> + #include <linux/mem_encrypt.h>
>   #include <asm/pci-direct.h>
>   #include <asm/iommu.h>
>   #include <asm/gart.h>
> diff --cc drivers/iommu/amd_iommu_proto.h
> index 90e62e9b01c5,3f12fb2338ea..000000000000
> --- a/drivers/iommu/amd_iommu_proto.h
> +++ b/drivers/iommu/amd_iommu_proto.h
> @@@ -87,6 -87,14 +87,16 @@@ static inline bool iommu_feature(struc
>   	return !!(iommu->features & f);
>   }
>   
> + static inline u64 iommu_virt_to_phys(void *vaddr)
> + {
> + 	return (u64)__sme_set(virt_to_phys(vaddr));
> + }
> + 
> + static inline void *iommu_phys_to_virt(unsigned long paddr)
> + {
> + 	return phys_to_virt(__sme_clr(paddr));
> + }
> + 
>  +extern bool translation_pre_enabled(struct amd_iommu *iommu);
>  +extern struct iommu_dev_data *get_dev_data(struct device *dev);
>   #endif /* _ASM_X86_AMD_IOMMU_PROTO_H  */
> diff --cc drivers/iommu/amd_iommu_types.h
> index 5f775fef341c,8591f43c467c..000000000000
> --- a/drivers/iommu/amd_iommu_types.h
> +++ b/drivers/iommu/amd_iommu_types.h
> @@@ -361,8 -343,8 +361,8 @@@
>   #define GCR3_VALID		0x01ULL
>   
>   #define IOMMU_PAGE_MASK (((1ULL << 52) - 1) & ~0xfffULL)
>  -#define IOMMU_PTE_PRESENT(pte) ((pte) & IOMMU_PTE_P)
>  +#define IOMMU_PTE_PRESENT(pte) ((pte) & IOMMU_PTE_PR)
> - #define IOMMU_PTE_PAGE(pte) (phys_to_virt((pte) & IOMMU_PAGE_MASK))
> + #define IOMMU_PTE_PAGE(pte) (iommu_phys_to_virt((pte) & IOMMU_PAGE_MASK))
>   #define IOMMU_PTE_MODE(pte) (((pte) >> 9) & 0x07)
>   
>   #define IOMMU_PROT_MASK 0x03
