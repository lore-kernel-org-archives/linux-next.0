From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: linux-next: build failure after merge of the spi tree
Date: Fri, 30 Jan 2015 06:43:16 +0100
Message-ID: <CAPybu_3cW41c5m8+pBUWBxcK3Z74Pb=+gC5oDi5Q10Zjct3M6w@mail.gmail.com>
References: <20150130140228.399ed64f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150130140228.399ed64f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hello Stephen

The root of the issue is that iowrite/ioread behaves differently in
different arches.

1) It does not necesary need to be a symbol in all the arches. It can
be declared as a function macro:

#define iowrite32(a,b) iowrite32(a,b)

2) Sometimes, even the function has a different prototype.

 include/asm-generic/iomap.h
 extern unsigned int ioread16be(void __iomem *);

 include/asm-generic/io.h
 extern unsigned int ioread16be(void __iomem *);

Since the patch that you have reverted was only to clean the code it
is perfectly  fine to revert it.

Sorry for the mess, I did only tried to build it on the platforms that
I had available and I could have never guess that iowrite32 was
implemented differently on other arches.

Thanks!

On Fri, Jan 30, 2015 at 4:02 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Mark,
>
> After merging the spi tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/spi/spi-xilinx.c: In function 'xilinx_spi_probe':
> drivers/spi/spi-xilinx.c:391:16: warning: assignment from incompatible pointer type
>   xspi->read_fn = ioread32;
>                 ^
> drivers/spi/spi-xilinx.c:392:17: warning: assignment from incompatible pointer type
>   xspi->write_fn = iowrite32;
>                  ^
> drivers/spi/spi-xilinx.c:398:19: error: 'ioread32be' undeclared (first use in this function)
>    xspi->read_fn = ioread32be;
>                    ^
> drivers/spi/spi-xilinx.c:398:19: note: each undeclared identifier is reported only once for each function it appears in
> drivers/spi/spi-xilinx.c:399:20: error: 'iowrite32be' undeclared (first use in this function)
>    xspi->write_fn = iowrite32be;
>                     ^
>
> Caused by commit 99082eab6344 ("spi/xilinx: Remove iowrite/ioread
> wrappers").  Its not obvious why this is so, but reverting that commit
> fixed the build problem.
>
> I have reverted that commit for today.
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



-- 
Ricardo Ribalda
