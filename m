From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 4/4] mm/hmm: exclude 64 bit arch that explicitly fail to
 work.
Date: Wed, 12 Apr 2017 23:56:05 -0400
Message-ID: <20170413035605.GP16239@windriver.com>
References: <20170413003014.4052-1-paul.gortmaker@windriver.com>
 <20170413003014.4052-5-paul.gortmaker@windriver.com>
 <20170413132701.633a22a9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:55343 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755705AbdDMD4O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Apr 2017 23:56:14 -0400
Content-Disposition: inline
In-Reply-To: <20170413132701.633a22a9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Evgeny Baskakov <ebaskakov@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Mark Hairgrove <mhairgrove@nvidia.com>, Sherry Cheung <SCheung@nvidia.com>, Subhash Gutti <sgutti@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>

[Re: [PATCH 4/4] mm/hmm: exclude 64 bit arch that explicitly fail to work.] On 13/04/2017 (Thu 13:27) Stephen Rothwell wrote:

> Hi Paul,
> 
> On Wed, 12 Apr 2017 20:30:14 -0400 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> >
> > Since ia64 and ppc64 don't set CONFIG_64BIT, they were already
> > excluded by the original dependency.
> 
> My powerpc ppc64_defconfig builds have CONFIG_64BIT set ...
> 
> $ grep CONFIG_64BIT ~/next/powerpc_ppc64_defconfig/.config
> CONFIG_64BIT=y

I must have fat fingered the grep; I was using the PA Semi defconfig
since I knew that was 64 bit.  I probably searched for 64_BIT or
something stupid.  The underscore ARM64 vs. X86_64 always gets me.

In the end, it doesn't change the commit itself, since the driver
still only builds on X86_64, S390 and ARM64(but only after my patch).
The ppc64 was also never compile tested it seems.

I can tweak the commit log of this patch in a v2 once there has been
a chance for others to put in their feedback as well.

Here is the spew I got when I tried to compile hmm on next/master ppc64.

Paul.
--

  CC      mm/hmm.o
mm/hmm.c: In function 'hmm_devmem_radix_release':
mm/hmm.c:784:30: error: 'PA_SECTION_SHIFT' undeclared (first use in this function)
 #define SECTION_SIZE (1UL << PA_SECTION_SHIFT)
                              ^
mm/hmm.c:790:36: note: in expansion of macro 'SECTION_SIZE'
  align_start = resource->start & ~(SECTION_SIZE - 1);
                                    ^
mm/hmm.c:784:30: note: each undeclared identifier is reported only once for each function it appears in
 #define SECTION_SIZE (1UL << PA_SECTION_SHIFT)
                              ^
mm/hmm.c:790:36: note: in expansion of macro 'SECTION_SIZE'
  align_start = resource->start & ~(SECTION_SIZE - 1);
                                    ^
mm/hmm.c: In function 'hmm_devmem_release':
mm/hmm.c:784:30: error: 'PA_SECTION_SHIFT' undeclared (first use in this function)
 #define SECTION_SIZE (1UL << PA_SECTION_SHIFT)
                              ^
mm/hmm.c:812:36: note: in expansion of macro 'SECTION_SIZE'
  align_start = resource->start & ~(SECTION_SIZE - 1);
                                    ^
mm/hmm.c:816:2: error: implicit declaration of function 'arch_remove_memory' [-Werror=implicit-function-declaration]
  arch_remove_memory(align_start, align_size, devmem->pagemap.type);
  ^
mm/hmm.c: In function 'hmm_devmem_find':
mm/hmm.c:827:54: error: 'PA_SECTION_SHIFT' undeclared (first use in this function)
  return radix_tree_lookup(&hmm_devmem_radix, phys >> PA_SECTION_SHIFT);
                                                      ^
mm/hmm.c: In function 'hmm_devmem_pages_create':
mm/hmm.c:784:30: error: 'PA_SECTION_SHIFT' undeclared (first use in this function)
 #define SECTION_SIZE (1UL << PA_SECTION_SHIFT)
                              ^
mm/hmm.c:838:44: note: in expansion of macro 'SECTION_SIZE'
  align_start = devmem->resource->start & ~(SECTION_SIZE - 1);
                                            ^
In file included from include/linux/cache.h:4:0,
                 from include/linux/printk.h:8,
                 from include/linux/kernel.h:13,
                 from include/asm-generic/bug.h:15,
                 from arch/powerpc/include/asm/bug.h:127,
                 from include/linux/bug.h:4,
                 from include/linux/mmdebug.h:4,
                 from include/linux/mm.h:8,
                 from mm/hmm.c:20:
mm/hmm.c: In function 'hmm_devmem_add':
mm/hmm.c:784:30: error: 'PA_SECTION_SHIFT' undeclared (first use in this function)
 #define SECTION_SIZE (1UL << PA_SECTION_SHIFT)
                              ^
include/uapi/linux/kernel.h:10:47: note: in definition of macro '__ALIGN_KERNEL_MASK'
 #define __ALIGN_KERNEL_MASK(x, mask) (((x) + (mask)) & ~(mask))
                                               ^
include/linux/kernel.h:49:22: note: in expansion of macro '__ALIGN_KERNEL'
 #define ALIGN(x, a)  __ALIGN_KERNEL((x), (a))
                      ^
mm/hmm.c:982:9: note: in expansion of macro 'ALIGN'
  size = ALIGN(size, SECTION_SIZE);
         ^
mm/hmm.c:982:21: note: in expansion of macro 'SECTION_SIZE'
  size = ALIGN(size, SECTION_SIZE);
                     ^
mm/hmm.c: In function 'hmm_devmem_find':
mm/hmm.c:828:1: warning: control reaches end of non-void function [-Wreturn-type]
 }
 ^
cc1: some warnings being treated as errors
scripts/Makefile.build:294: recipe for target 'mm/hmm.o' failed
make[2]: *** [mm/hmm.o] Error 1
make[2]: *** Waiting for unfinished jobs....
Makefile:1663: recipe for target 'mm/' failed
make[1]: *** [mm/] Error 2
make[1]: Leaving directory '/home/paul/git/ppc-build'
Makefile:152: recipe for target 'sub-make' failed
make: *** [sub-make] Error 2
