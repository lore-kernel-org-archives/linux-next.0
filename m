From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Mon, 29 May 2017 19:14:04 -0700
Message-ID: <20170530021404.GT3956@linux.vnet.ibm.com>
References: <20170529160209.5230c05b@canb.auug.org.au>
 <20170529211505.GP3956@linux.vnet.ibm.com>
 <20170530114050.2b702cc1@canb.auug.org.au>
 <1496109266.2618.5.camel@perches.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33166 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750797AbdE3COG (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 May 2017 22:14:06 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4U2DdCr114390
        for <linux-next@vger.kernel.org>; Mon, 29 May 2017 22:14:06 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2arujbyckv-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 29 May 2017 22:14:05 -0400
Received: from localhost
        by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 29 May 2017 22:14:05 -0400
Content-Disposition: inline
In-Reply-To: <1496109266.2618.5.camel@perches.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Frysinger <vapier@gentoo.org>, Steven Miao <realmz6@gmail.com>

On Mon, May 29, 2017 at 06:54:26PM -0700, Joe Perches wrote:
> On Tue, 2017-05-30 at 11:40 +1000, Stephen Rothwell wrote:
> > Hi Paul,
> > 
> > > On Mon, 29 May 2017 14:15:05 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> > > 
> > > Anyone see any other options?
> 
> My preferred option would be removing pr_fmt
> and adding a couple new macros.

Not sure how to evaluate yours and Stephen's changes, but I reverted my
conversion to a macro based on the hope that something good will come
of this effort.  ;-)

							Thanx, Paul

> ---
>  arch/blackfin/kernel/module.c | 39 +++++++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/blackfin/kernel/module.c b/arch/blackfin/kernel/module.c
> index 0188c933b155..e43aec7eb8d3 100644
> --- a/arch/blackfin/kernel/module.c
> +++ b/arch/blackfin/kernel/module.c
> @@ -4,8 +4,6 @@
>   * Licensed under the GPL-2 or later
>   */
>  
> -#define pr_fmt(fmt) "module %s: " fmt, mod->name
> -
>  #include <linux/moduleloader.h>
>  #include <linux/elf.h>
>  #include <linux/vmalloc.h>
> @@ -16,6 +14,11 @@
>  #include <asm/cacheflush.h>
>  #include <linux/uaccess.h>
>  
> +#define mod_err(mod, fmt, ...)						\
> +	pr_err("module %s: " fmt, (mod)->name, ##__VA_ARGS__)
> +#define mod_debug(mod, ...)						\
> +	pr_debug("module %s: " fmt, (mod)->name, ##__VA_ARGS__)
> +
>  /* Transfer the section to the L1 memory */
>  int
>  module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
> @@ -44,7 +47,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  			dest = l1_inst_sram_alloc(s->sh_size);
>  			mod->arch.text_l1 = dest;
>  			if (dest == NULL) {
> -				pr_err("L1 inst memory allocation failed\n");
> +				mod_err(mod, "L1 inst memory allocation failed\n");
>  				return -1;
>  			}
>  			dma_memcpy(dest, (void *)s->sh_addr, s->sh_size);
> @@ -56,7 +59,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  			dest = l1_data_sram_alloc(s->sh_size);
>  			mod->arch.data_a_l1 = dest;
>  			if (dest == NULL) {
> -				pr_err("L1 data memory allocation failed\n");
> +				mod_err(mod, "L1 data memory allocation failed\n");
>  				return -1;
>  			}
>  			memcpy(dest, (void *)s->sh_addr, s->sh_size);
> @@ -68,7 +71,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  			dest = l1_data_sram_zalloc(s->sh_size);
>  			mod->arch.bss_a_l1 = dest;
>  			if (dest == NULL) {
> -				pr_err("L1 data memory allocation failed\n");
> +				mod_err(mod, "L1 data memory allocation failed\n");
>  				return -1;
>  			}
>  
> @@ -77,7 +80,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  			dest = l1_data_B_sram_alloc(s->sh_size);
>  			mod->arch.data_b_l1 = dest;
>  			if (dest == NULL) {
> -				pr_err("L1 data memory allocation failed\n");
> +				mod_err(mod, "L1 data memory allocation failed\n");
>  				return -1;
>  			}
>  			memcpy(dest, (void *)s->sh_addr, s->sh_size);
> @@ -87,7 +90,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  			dest = l1_data_B_sram_alloc(s->sh_size);
>  			mod->arch.bss_b_l1 = dest;
>  			if (dest == NULL) {
> -				pr_err("L1 data memory allocation failed\n");
> +				mod_err(mod, "L1 data memory allocation failed\n");
>  				return -1;
>  			}
>  			memset(dest, 0, s->sh_size);
> @@ -99,7 +102,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  			dest = l2_sram_alloc(s->sh_size);
>  			mod->arch.text_l2 = dest;
>  			if (dest == NULL) {
> -				pr_err("L2 SRAM allocation failed\n");
> +				mod_err(mod, "L2 SRAM allocation failed\n");
>  				return -1;
>  			}
>  			memcpy(dest, (void *)s->sh_addr, s->sh_size);
> @@ -111,7 +114,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  			dest = l2_sram_alloc(s->sh_size);
>  			mod->arch.data_l2 = dest;
>  			if (dest == NULL) {
> -				pr_err("L2 SRAM allocation failed\n");
> +				mod_err(mod, "L2 SRAM allocation failed\n");
>  				return -1;
>  			}
>  			memcpy(dest, (void *)s->sh_addr, s->sh_size);
> @@ -123,7 +126,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  			dest = l2_sram_zalloc(s->sh_size);
>  			mod->arch.bss_l2 = dest;
>  			if (dest == NULL) {
> -				pr_err("L2 SRAM allocation failed\n");
> +				mod_err(mod, "L2 SRAM allocation failed\n");
>  				return -1;
>  			}
>  
> @@ -157,8 +160,8 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  	Elf32_Sym *sym;
>  	unsigned long location, value, size;
>  
> -	pr_debug("applying relocate section %u to %u\n",
> -		relsec, sechdrs[relsec].sh_info);
> +	mod_debug(mod, "applying relocate section %u to %u\n",
> +		  relsec, sechdrs[relsec].sh_info);
>  
>  	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
>  		/* This is where to make the change */
> @@ -174,14 +177,14 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  
>  #ifdef CONFIG_SMP
>  		if (location >= COREB_L1_DATA_A_START) {
> -			pr_err("cannot relocate in L1: %u (SMP kernel)\n",
> +			mod_err(mod, "cannot relocate in L1: %u (SMP kernel)\n",
>  				ELF32_R_TYPE(rel[i].r_info));
>  			return -ENOEXEC;
>  		}
>  #endif
>  
> -		pr_debug("location is %lx, value is %lx type is %d\n",
> -			location, value, ELF32_R_TYPE(rel[i].r_info));
> +		mod_debug(mod, "location is %lx, value is %lx type is %d\n",
> +			  location, value, ELF32_R_TYPE(rel[i].r_info));
>  
>  		switch (ELF32_R_TYPE(rel[i].r_info)) {
>  
> @@ -200,12 +203,12 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  		case R_BFIN_PCREL12_JUMP:
>  		case R_BFIN_PCREL12_JUMP_S:
>  		case R_BFIN_PCREL10:
> -			pr_err("unsupported relocation: %u (no -mlong-calls?)\n",
> +			mod_err(mod, "unsupported relocation: %u (no -mlong-calls?)\n",
>  				ELF32_R_TYPE(rel[i].r_info));
>  			return -ENOEXEC;
>  
>  		default:
> -			pr_err("unknown relocation: %u\n",
> +			mod_err(mod, "unknown relocation: %u\n",
>  				ELF32_R_TYPE(rel[i].r_info));
>  			return -ENOEXEC;
>  		}
> @@ -222,7 +225,7 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  			isram_memcpy((void *)location, &value, size);
>  			break;
>  		default:
> -			pr_err("invalid relocation for %#lx\n", location);
> +			mod_err(mod, "invalid relocation for %#lx\n", location);
>  			return -ENOEXEC;
>  		}
>  	}
> 
