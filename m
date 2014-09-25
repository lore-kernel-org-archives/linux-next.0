From: Peter Feiner <pfeiner@google.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the pci
 tree
Date: Thu, 25 Sep 2014 12:30:00 -0700
Message-ID: <20140925193000.GA26946@google.com>
References: <20140925174730.302842e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140925174730.302842e6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>
List-Id: linux-next.vger.kernel.org

On Thu, Sep 25, 2014 at 05:47:30PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in
> include/asm-generic/pgtable.h between commit b766eafe6828 ("PCI: Add
> pci_remap_iospace() to map bus I/O resources") from the pci tree and
> commit 4cc2f91f2636 ("mm: softdirty: enable write notifications on VMAs
> after VM_SOFTDIRTY cleared") from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc include/asm-generic/pgtable.h
> index 977e545a64c3,f6acf1195182..000000000000
> --- a/include/asm-generic/pgtable.h
> +++ b/include/asm-generic/pgtable.h
> @@@ -249,10 -249,18 +249,22 @@@ static inline int pmd_same(pmd_t pmd_a
>   #define pgprot_writecombine pgprot_noncached
>   #endif
>   
>  +#ifndef pgprot_device
>  +#define pgprot_device pgprot_noncached
>  +#endif
>  +
> + #ifndef pgprot_modify
> + #define pgprot_modify pgprot_modify
> + static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
> + {
> + 	if (pgprot_val(oldprot) == pgprot_val(pgprot_noncached(oldprot)))
> + 		newprot = pgprot_noncached(newprot);
> + 	if (pgprot_val(oldprot) == pgprot_val(pgprot_writecombine(oldprot)))
> + 		newprot = pgprot_writecombine(newprot);

For completeness of the arch-independent pgprot-modify,

	if (pgprot_val(oldprot) == pgprot_val(pgprot_device(oldprot)))
		newprot = pgprot_device(newprot);

should be added here.

> + 	return newprot;
> + }
> + #endif
> + 
>   /*
>    * When walking page tables, get the address of the next boundary,
>    * or the end address of the range if that comes earlier.  Although no
