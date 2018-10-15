From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Oct 15
Date: Mon, 15 Oct 2018 15:13:19 -0700
Message-ID: <20181015151319.3a443f0421c20bd7ed055cb9@linux-foundation.org>
References: <20181015192546.15faf3a1@canb.auug.org.au>
        <20181015182637.GA16445@roeck-us.net>
        <20181016071240.3f62816d@canb.auug.org.au>
        <20181016072439.42613abd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016072439.42613abd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Guenter Roeck <linux@roeck-us.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Rob Herring <robherring2@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Tue, 16 Oct 2018 07:24:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Tue, 16 Oct 2018 07:12:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 15 Oct 2018 11:26:37 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > ALl ppc qemu tests (including big endian pseries) also generate a warning.
> > > 
> > > WARNING: CPU: 0 PID: 0 at mm/memblock.c:1301 .memblock_alloc_range_nid+0x20/0x68
> 
> That is:
> 
> static phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
>                                         phys_addr_t align, phys_addr_t start,
>                                         phys_addr_t end, int nid,
>                                         enum memblock_flags flags)
> {
>        if (WARN_ON_ONCE(!align))
>                 align = SMP_CACHE_BYTES;
> 
> Looks like patch
> 
>   "memblock: stop using implicit alignment to SMP_CACHE_BYTES"
> 
> missed some places ...

To be expected, I guess.  I'm pretty relaxed about this ;) Let's do
another sweep in a week or so, after which we'll have a couple of
months to mop up any leftovers.
