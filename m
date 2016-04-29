From: Matt Fleming <matt@codeblueprint.co.uk>
Subject: Re: linux-next: manual merge of the tip tree with the arm64 tree
Date: Fri, 29 Apr 2016 10:04:14 +0100
Message-ID: <20160429090414.GC2839@codeblueprint.co.uk>
References: <20160429135645.20e288dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160429135645.20e288dd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>
List-Id: linux-next.vger.kernel.org

On Fri, 29 Apr, at 01:56:45PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   drivers/firmware/efi/arm-init.c
> 
> between commits:
> 
>   500899c2cc3e ("efi: ARM/arm64: ignore DT memory nodes instead of removing them")
>   7464b6e3a5fb ("efi: ARM: avoid warning about phys_addr_t cast")
> 
> from the arm64 tree and commits:
> 
>   78ce248faa3c ("efi: Iterate over efi.memmap in for_each_efi_memory_desc()")
>   884f4f66ffd6 ("efi: Remove global 'memmap' EFI memory map")
> 
> from the tip tree.
 
[...]

> diff --cc drivers/firmware/efi/arm-init.c
> index fac567c3b66a,ef90f0c4b70a..000000000000
> --- a/drivers/firmware/efi/arm-init.c
> +++ b/drivers/firmware/efi/arm-init.c
> @@@ -143,15 -178,7 +178,15 @@@ static __init void reserve_regions(void
>   	if (efi_enabled(EFI_DBG))
>   		pr_info("Processing EFI memory map:\n");
>   
>  +	/*
>  +	 * Discard memblocks discovered so far: if there are any at this
>  +	 * point, they originate from memory nodes in the DT, and UEFI
>  +	 * uses its own memory map instead.
>  +	 */
>  +	memblock_dump_all();
>  +	memblock_remove(0, (phys_addr_t)ULLONG_MAX);
>  +
> - 	for_each_efi_memory_desc(&memmap, md) {
> + 	for_each_efi_memory_desc(md) {
>   		paddr = md->phys_addr;
>   		npages = md->num_pages;
>   

This looks fine, thanks Stephen.
