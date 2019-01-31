From: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: linux-next: powerpc le qemu boot failure after merge of the akpm tree
Date: Thu, 31 Jan 2019 14:50:42 +0100
Message-ID: <CAAeHK+y5p85jdvtX4OhwR9zNPGy+fxZtzdDZwAPS3u-dHNKbQQ@mail.gmail.com>
References: <20190131163854.307e17ab@canb.auug.org.au> <20190131170629.2cc20600@canb.auug.org.au>
 <962e7dd7-779b-2c32-59db-9ced6751dede@c-s.fr> <20190131074018.GD28876@rapoport-lnx>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131074018.GD28876@rapoport-lnx>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jan 31, 2019 at 8:40 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> (added Andrey Konovalov)
>
> On Thu, Jan 31, 2019 at 07:15:26AM +0100, Christophe Leroy wrote:
> >
> > Le 31/01/2019 =C3=A0 07:06, Stephen Rothwell a =C3=A9crit :
> > >Hi all,
> > >
> > >On Thu, 31 Jan 2019 16:38:54 +1100 Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> > >>
> > >>[I am guessing that is is something in Andrew's tree that has caused
> > >>this.]
> > >>
> > >>My qemu boot of the powerpc pseries_le_defconfig config failed like t=
his:
> > >>
> > >>htab_hash_mask    =3D 0x1ffff
> > >>-----------------------------------------------------
> > >>numa:   NODE_DATA [mem 0x7ffe7000-0x7ffebfff]
> > >>Kernel panic - not syncing: sparse_buffer_init: Failed to allocate 21=
47483648 bytes align=3D0x10000 nid=3D0 from=3Dfffffffffffffff
> > >>CPU: 0 PID: 0 Comm: swapper Not tainted 5.0.0-rc4 #2
> > >>Call Trace:
> > >>[c00000000105bbd0] [c000000000b1345c] dump_stack+0xb0/0xf4 (unreliabl=
e)
> > >>[c00000000105bc10] [c000000000111120] panic+0x168/0x3b8
> > >>[c00000000105bcb0] [c000000000e701c8] sparse_init_nid+0x178/0x550
> > >>[c00000000105bd70] [c000000000e709b4] sparse_init+0x210/0x238
> > >>[c00000000105bdb0] [c000000000e468f4] initmem_init+0x1e0/0x260
> > >>[c00000000105be80] [c000000000e3b9b0] setup_arch+0x354/0x3d4
> > >>[c00000000105bef0] [c000000000e33afc] start_kernel+0x98/0x648
> > >>[c00000000105bf90] [c00000000000b270] start_here_common+0x1c/0x52c
> > >
> > >A quick bisect leads to this:
> > >
> > >1c3c9328cde027eb875ba4692f0a5d66b0afe862 is the first bad commit
> > >commit 1c3c9328cde027eb875ba4692f0a5d66b0afe862
> > >Author: Mike Rapoport <rppt@linux.ibm.com>
> > >Date:   Thu Jan 31 10:51:32 2019 +1100
> > >
> > >     treewide: add checks for the return value of memblock_alloc*()
> > >     Add check for the return value of memblock_alloc*() functions and=
 call
> > >     panic() in case of error.  The panic message repeats the one used=
 by
> > >     panicing memblock allocators with adjustment of parameters to inc=
lude only
> > >     relevant ones.
> > >
> > >Which is just adding the panic we hit.  So, presumably, the bug is in =
a
> > >preceding patch :-(
> > >
> > >I have left the kernel not booting for today.
> > >
> >
> > No I think the error is really in that patch, see my other mail.
> >
> > See https://elixir.bootlin.com/linux/v5.0-rc4/source/mm/memblock.c#L145=
5,
> > memblock_alloc_try_nid_raw() is not supposed to panic, so the last hunk=
 of
> > this patch should be reverted.
> >
> > Found in total three problematic hunks in that patch:
> >
> > @@ -48,6 +53,11 @@ static phys_addr_t __init kasan_alloc_raw_page(int n=
ode)
> >       void *p =3D memblock_alloc_try_nid_raw(PAGE_SIZE, PAGE_SIZE,
> >                                               __pa(MAX_DMA_ADDRESS),
> >                                               MEMBLOCK_ALLOC_KASAN, nod=
e);
> > +     if (!p)
> > +             panic("%s: Failed to allocate %lu bytes align=3D0x%lx nid=
=3D%d from=3D%llx\n",
> > +                   __func__, PAGE_SIZE, PAGE_SIZE, node,
> > +                   __pa(MAX_DMA_ADDRESS));
> > +
> >       return __pa(p);
> >  }
>
> I've looked more closely to the code that uses this function and it does
> not seem to handle allocation error.
> I can replace the panic with WARN(), but I think that panic() here is
> appropriate.
>
> Andrey, can you comment?

+ Andrey Ryabinin

I think panic() there looks appropriate. Added Andrey Ryabinin to take a lo=
ok.

>
>
> > @@ -211,6 +211,9 @@ static int __init iob_init(struct device_node *dn)
> >       iob_l2_base =3D memblock_alloc_try_nid_raw(1UL << 21, 1UL << 21,
> >                                       MEMBLOCK_LOW_LIMIT, 0x80000000,
> >                                       NUMA_NO_NODE);
> > +     if (!iob_l2_base)
> > +             panic("%s: Failed to allocate %lu bytes align=3D0x%lx max=
_addr=3D%x\n",
> > +                   __func__, 1UL << 21, 1UL << 21, 0x80000000);
> >
> >       pr_info("IOBMAP L2 allocated at: %p\n", iob_l2_base);
>
> This one is actually fixes my own mistake from one of the previous patche=
s
> that converted memblock_alloc_base() to memblock_alloc_try_nid_raw() with=
out
> adding the panic() (commit 47e382eb08cfa0199c4ea9f9cc73f1b48a3a4b1d
> "powerpc: prefer memblock APIs returning virtual address")
>
> > @@ -425,6 +436,10 @@ static void __init sparse_buffer_init(unsigned lon=
g
> > size, int nid)
> >               memblock_alloc_try_nid_raw(size, PAGE_SIZE,
> >                                               __pa(MAX_DMA_ADDRESS),
> >                                               MEMBLOCK_ALLOC_ACCESSIBLE=
, nid);
> > +     if (!sparsemap_buf)
> > +             panic("%s: Failed to allocate %lu bytes align=3D0x%lx nid=
=3D%d from=3D%lx\n",
> > +                   __func__, size, PAGE_SIZE, nid, __pa(MAX_DMA_ADDRES=
S));
> > +
> >       sparsemap_buf_end =3D sparsemap_buf + size;
> >  }
>
> This hunk was not needed as sparse can deal with this allocation failure.
>
> Andrew, can you please add the below patch to as a fixup to "treewide: ad=
d
> checks for the return value of memblock_alloc*()"?
>
> From 854f54b9d4fe52f477765b905a4b2c421d30f46e Mon Sep 17 00:00:00 2001
> From: Mike Rapoport <rppt@linux.ibm.com>
> Date: Thu, 31 Jan 2019 09:18:50 +0200
> Subject: [PATCH] mm/sparse: don't panic if the allocation in
>  sparse_buffer_init fails
>
> Addition of panic if memblock_alloc_try_nid_raw() call in
> sparse_buffer_init() fails was over enthusiastic as the system is perfect=
ly
> capable to deal with that allocation failure.
> Remove the panic().
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  mm/sparse.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 1471f06..c11aba0 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -434,10 +434,6 @@ static void __init sparse_buffer_init(unsigned long =
size, int nid)
>                 memblock_alloc_try_nid_raw(size, PAGE_SIZE,
>                                                 __pa(MAX_DMA_ADDRESS),
>                                                 MEMBLOCK_ALLOC_ACCESSIBLE=
, nid);
> -       if (!sparsemap_buf)
> -               panic("%s: Failed to allocate %lu bytes align=3D0x%lx nid=
=3D%d from=3D%lx\n",
> -                     __func__, size, PAGE_SIZE, nid, __pa(MAX_DMA_ADDRES=
S));
> -
>         sparsemap_buf_end =3D sparsemap_buf + size;
>  }
>
> --
> 2.7.4
>
