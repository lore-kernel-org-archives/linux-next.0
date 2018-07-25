From: Omar Sandoval <osandov@osandov.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 25 Jul 2018 16:18:26 -0700
Message-ID: <20180725231826.GE16847@vader>
References: <20180723194231.3d8f0439@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180723194231.3d8f0439@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 23, 2018 at 07:42:31PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (sparc (32 bit)
> defconfig) failed like this:
> 
> In file included from kernel/crash_core.c:9:0:
> kernel/crash_core.c: In function 'crash_save_vmcoreinfo_init':
> include/linux/crash_core.h:44:66: error: lvalue required as unary '&' operand
>   vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #name, (unsigned long)&name)
>                                                                   ^
> kernel/crash_core.c:404:2: note: in expansion of macro 'VMCOREINFO_SYMBOL'
>   VMCOREINFO_SYMBOL(swapper_pg_dir);
>   ^~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   e527c514996a ("proc/kcore: add vmcoreinfo note to /proc/kcore")
> 
> It seems that sparc does not declare swapper_pg_dir for 32 but builds,
> they just define it to be NULL.  As do some others:
> 
> $ git grep -w 'define.*swapper_pg_dir'
> arch/arm/include/asm/pgtable-nommu.h:#define swapper_pg_dir ((pgd_t *) 0)
> arch/c6x/include/asm/pgtable.h:#define swapper_pg_dir ((pgd_t *) 0)
> arch/h8300/include/asm/pgtable.h:#define swapper_pg_dir ((pgd_t *) 0)
> arch/m68k/include/asm/pgtable_no.h:#define swapper_pg_dir ((pgd_t *) 0)
> arch/microblaze/include/asm/pgtable.h:#define swapper_pg_dir ((pgd_t *) NULL)
> arch/sparc/include/asm/pgtable_32.h:#define swapper_pg_dir NULL
> arch/xtensa/include/asm/pgtable.h:# define swapper_pg_dir NULL

Mm, I wrongly assumed that this would only be the case for !MMU. Looks
like it's always either NULL or an array, so VMCOREINFO_SYMBOL_ARRAY
should work here. I'll send a new version.
