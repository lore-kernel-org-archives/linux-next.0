From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 05 Oct 2018 22:02:45 +1000
Message-ID: <87d0sok3dm.fsf@concordia.ellerman.id.au>
References: <20181005161406.73ef8727@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005161406.73ef8727@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christophe Leroy <christophe.leroy@c-s.fr>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Andrew,
>
> After merging the akpm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> arch/powerpc/kernel/setup-common.c:36:10: fatal error: linux/bootmem.h: No such file or directory
>  #include <linux/bootmem.h>
>           ^~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   49353a51a758 ("mm: remove include/linux/bootmem.h")
>
> interacting with commit
>
>   d90fe2acd9b2 ("powerpc: Wire up memtest")
>
> from the powerpc tree.

Ah fudge, what are the chances we add a new include of bootmem.h just as
Mike's removing bootmem.

> I applied the following patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 5 Oct 2018 16:09:34 +1000
> Subject: [PATCH] powerpc: fix up for removal of linux/bootmem.h
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/kernel/setup-common.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 2b56d1f30387..93ee3703b42f 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -33,7 +33,6 @@
>  #include <linux/serial_8250.h>
>  #include <linux/percpu.h>
>  #include <linux/memblock.h>
> -#include <linux/bootmem.h>
>  #include <linux/of_platform.h>
>  #include <linux/hugetlb.h>
>  #include <asm/debugfs.h>

I could just apply that to my tree. memblock.h is where early_memtest() is
actually defined anyway.

cheers
