From: Joel Stanley <joel@jms.id.au>
Subject: Re: linux-next: build warnings from Linus' tree
Date: Tue, 4 Dec 2018 09:54:53 +1030
Message-ID: <CACPK8Xft3n5KkpTjN3=7_VUCXHFcK7mxvZm2Rrqu7tppcBoyOg@mail.gmail.com>
References: <20180612081413.323d85b8@canb.auug.org.au> <CACPK8XeDHt46rUJWQ1n=4fRWioogs9K0Z8dkxUa=E2ShfQ1Vdg@mail.gmail.com>
 <87k1lgufiw.fsf@concordia.ellerman.id.au> <20181118112244.GD21617@bubble.grove.modra.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118112244.GD21617@bubble.grove.modra.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Modra <amodra@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, 18 Nov 2018 at 21:52, Alan Modra <amodra@gmail.com> wrote:
>
> On Wed, Nov 14, 2018 at 09:20:23PM +1100, Michael Ellerman wrote:
> > Joel Stanley <joel@jms.id.au> writes:
> > > Hello Alan,
> > >
> > > On Tue, 12 Jun 2018 at 07:44, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > >> Building Linus' tree, today's linux-next build (powerpc ppc64_defconfig)
> > >> produced these warning:
> > >>
> > >> ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
> > >> ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
> > >> ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
> > >>
> > >> This may just be because I have started building using the native Debian
> > >> gcc for the powerpc builds ...
> > >
> > > Do you know why we started creating these?
> >
> > It's controlled by the ld option --hash-style, which AFAICS still
> > defaults to sysv (generating .hash).
> >
> > But it seems gcc can be configured to have a different default, and at
> > least my native ppc64le toolchains are passing gnu, eg:
> >
> >  /usr/lib/gcc/powerpc64le-linux-gnu/6/collect2 -plugin
> >  /usr/lib/gcc/powerpc64le-linux-gnu/6/liblto_plugin.so
> >  -plugin-opt=/usr/lib/gcc/powerpc64le-linux-gnu/6/lto-wrapper
> >  -plugin-opt=-fresolution=/tmp/ccw1U2fF.res
> >  -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s
> >  -plugin-opt=-pass-through=-lc -plugin-opt=-pass-through=-lgcc
> >  -plugin-opt=-pass-through=-lgcc_s --sysroot=/ --build-id --eh-frame-hdr
> >  -V -shared -m elf64lppc
> >  --hash-style=gnu
> >  ^^^^^^^^^^^^^^^^
> >
> > So that's presumably why we're seeing it, some GCCs are configured to
> > use it.
> >
> > > If it's intentional, should we be putting including them in the same
> > > way as .hash sections?
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/kernel/vmlinux.lds.S#n282
> > >
> > >   .hash : AT(ADDR(.hash) - LOAD_OFFSET) { *(.hash) }
> >
> > That would presumably work.
> >
> > My question though is do we even need it?
> >
> > >From what I can see for it to be useful you need the section as well as
> > an entry in the dynamic section pointing at it, and we don't have a
> > dynamic section at all:
> >
> >   $ readelf -S vmlinux | grep gnu.hash
> >     [ 4] .gnu.hash         GNU_HASH         c000000000dbbdb0  00dcbdb0
> >   $ readelf -d vmlinux
> >
> >   There is no dynamic section in this file.
> >
> > Compare to the vdso:
> >
> > $ readelf -d arch/powerpc/kernel/vdso64/vdso64.so
> >
> > Dynamic section at offset 0x868 contains 12 entries:
> >   Tag        Type                         Name/Value
> >  0x000000000000000e (SONAME)             Library soname: [linux-vdso64.so.1]
> >  0x0000000000000004 (HASH)               0x120
> >  0x000000006ffffef5 (GNU_HASH)           0x170
> >  0x0000000000000005 (STRTAB)             0x320
> >  0x0000000000000006 (SYMTAB)             0x1d0
> >  0x000000000000000a (STRSZ)              269 (bytes)
> >  0x000000000000000b (SYMENT)             24 (bytes)
> >  0x0000000070000003 (PPC64_OPT)          0x0
> >  0x000000006ffffffc (VERDEF)             0x450
> >  0x000000006ffffffd (VERDEFNUM)          2
> >  0x000000006ffffff0 (VERSYM)             0x42e
> >  0x0000000000000000 (NULL)               0x0
> >
> >
> > So can't we just discard .gnu.hash? And in fact do we need .hash either?
> >
> > Actually arm64 discards the latter, and parisc discards both.
> >
> > Would still be good to hear from Alan or someone else who knows anything
> > about toolchain stuff, ie. not me :)
>
> .gnu.hash, like .hash, is used by glibc ld.so for dynamic symbol
> lookup.  I imagine you don't need either section in a kernel, so
> discarding both sounds reasonable.  Likely you could discard .interp
> and .dynstr too, and .dynsym when !CONFIG_PPC32.

Thanks for the digging Michael, and thanks Alan for clarifying the
details. I'll cook up a patch or two.

Cheers,

Joel
