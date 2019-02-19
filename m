From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the asm-generic tree
Date: Tue, 19 Feb 2019 15:42:02 +0100
Message-ID: <CAK8P3a3vVr+nJWuc3tWOcWn55DW6a=YF_OntqwPYnemW_jos6Q@mail.gmail.com>
References: <20190219173654.47e9bc36@canb.auug.org.au> <20190219074519.GA2294@behemoth.owl.eu.com.local>
 <CAK8P3a0omA-__7MLAw_SKuug_GZ0FfFPVr1Tsnx5Hb0sesv8gw@mail.gmail.com> <20190219111918.GC2294@behemoth.owl.eu.com.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219111918.GC2294@behemoth.owl.eu.com.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Hugo Lefeuvre <hle@owl.eu.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 19, 2019 at 12:19 PM Hugo Lefeuvre <hle@owl.eu.com> wrote:
>
> > I'm not sending a pull request for this if it breaks any architectures,
> > so I think we need to fix them all, and I suppose we also have to
> > change all architectures in the same patch that changes the architecture
> > independent declaration, so it doesn't break intermittently.
> >
> > At this point, I'd probably drop your patches from my asm-generic
> > tree  entirely to avoid the regression, and wait for you to resend
> > them all after 5.1-rc1, for inclusion in 5.2.
> >
> > Can you elaborate on the original problem that you saw? Maybe
> > we can have a different workaround for it in the meantime.
>
> Agree, these two patches should be dropped:
>
> 1. iomap: add missing const to ioread*/iowrite addr arg
>
> since there are incompatible definitions or declarations in
>
> arch/alpha/include/asm/core_apecs.h
> arch/alpha/include/asm/core_cia.h
> arch/alpha/include/asm/core_lca.h
> arch/alpha/include/asm/core_marvel.h
> arch/alpha/include/asm/core_mcpcia.h
> arch/alpha/include/asm/core_t2.h
> arch/alpha/include/asm/io.h
> arch/alpha/include/asm/io_trivial.h
> arch/alpha/include/asm/jensen.h
> arch/alpha/include/asm/machvec.h
> arch/alpha/kernel/core_marvel.c
> arch/alpha/kernel/io.c
> arch/parisc/lib/iomap.c
> arch/powerpc/kernel/iomap.c
> arch/sh/kernel/iomap.c
>
> 2. lib/iomap: add missing const to mmio_ins* addr arg
>
> since there are incompatible definitions or declarations in
>
> arch/sh/kernel/iomap.c
>
> I will resubmit them with all changes required for arch/. The ones for
> alpha, powerpc and sh are already ready and built with cross compiler.
> I still have to setup a cross compiler to build my parisc changes.

I've dropped all your patches for the moment, since one of the remaining
ones had a conflict against changes in the char-misc tree, and the
last one didn't do much by itself.

Please submit the full set again after -rc1.

        Arnd
