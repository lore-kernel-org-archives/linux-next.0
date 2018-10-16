From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: linux-next: Tree for Oct 15
Date: Tue, 16 Oct 2018 16:36:56 +0300
Message-ID: <20181016133656.GA10925@rapoport-lnx>
References: <20181015192546.15faf3a1@canb.auug.org.au>
 <20181015182637.GA16445@roeck-us.net>
 <20181016071240.3f62816d@canb.auug.org.au>
 <20181016072439.42613abd@canb.auug.org.au>
 <20181015151319.3a443f0421c20bd7ed055cb9@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181015151319.3a443f0421c20bd7ed055cb9@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Guenter Roeck <linux@roeck-us.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Rob Herring <robherring2@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 15, 2018 at 03:13:19PM -0700, Andrew Morton wrote:
> On Tue, 16 Oct 2018 07:24:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > On Tue, 16 Oct 2018 07:12:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Mon, 15 Oct 2018 11:26:37 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > ALl ppc qemu tests (including big endian pseries) also generate a warning.
> > > > 
> > > > WARNING: CPU: 0 PID: 0 at mm/memblock.c:1301 .memblock_alloc_range_nid+0x20/0x68
> > 
> > That is:
> > 
> > static phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
> >                                         phys_addr_t align, phys_addr_t start,
> >                                         phys_addr_t end, int nid,
> >                                         enum memblock_flags flags)
> > {
> >        if (WARN_ON_ONCE(!align))
> >                 align = SMP_CACHE_BYTES;
> > 
> > Looks like patch
> > 
> >   "memblock: stop using implicit alignment to SMP_CACHE_BYTES"
> > 
> > missed some places ...
> 
> To be expected, I guess.  I'm pretty relaxed about this ;) Let's do
> another sweep in a week or so, after which we'll have a couple of
> months to mop up any leftovers.

After some more grepping and spatching I've found these:

>From 8b014bae53a78ab747dbb76b9aff7df4cefcb604 Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.ibm.com>
Date: Tue, 16 Oct 2018 16:03:00 +0300
Subject: [PATCH] memblock: fix missed uses of implicit aligment

A couple of memblock*alloc uses were missed during conversion from implicit
alignment setting with 'align = 0' to explictly using SMP_CACHE_BYTES.
Fix them now.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/powerpc/kernel/paca.c    | 2 +-
 drivers/firmware/efi/memmap.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index f331a00..913bfca 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -198,7 +198,7 @@ void __init allocate_paca_ptrs(void)
 	paca_nr_cpu_ids = nr_cpu_ids;
 
 	paca_ptrs_size = sizeof(struct paca_struct *) * nr_cpu_ids;
-	paca_ptrs = __va(memblock_phys_alloc(paca_ptrs_size, 0));
+	paca_ptrs = __va(memblock_phys_alloc(paca_ptrs_size, SMP_CACHE_BYTES));
 	memset(paca_ptrs, 0x88, paca_ptrs_size);
 }
 
diff --git a/drivers/firmware/efi/memmap.c b/drivers/firmware/efi/memmap.c
index ef618bc..fa2904f 100644
--- a/drivers/firmware/efi/memmap.c
+++ b/drivers/firmware/efi/memmap.c
@@ -15,7 +15,7 @@
 
 static phys_addr_t __init __efi_memmap_alloc_early(unsigned long size)
 {
-	return memblock_phys_alloc(size, 0);
+	return memblock_phys_alloc(size, SMP_CACHE_BYTES);
 }
 
 static phys_addr_t __init __efi_memmap_alloc_late(unsigned long size)
-- 
2.7.4

 

-- 
Sincerely yours,
Mike.
