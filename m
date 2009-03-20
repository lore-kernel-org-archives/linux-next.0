From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: s390 build failure
Date: Fri, 20 Mar 2009 11:00:22 +0100
Message-ID: <20090320100021.GB6256@elte.hu>
References: <20090320104208.0cb4b2b5.sfr@canb.auug.org.au> <20090320092410.30d2bac3@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:53748 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750977AbZCTKAm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Mar 2009 06:00:42 -0400
Content-Disposition: inline
In-Reply-To: <20090320092410.30d2bac3@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Heiko Carstens <heiko.carstens@de.ibm.com> wrote:

> On Fri, 20 Mar 2009 10:42:08 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > The linux-next build for s390 allnoconfig failed like this:
> > 
> > In file included from arch/s390/include/asm/tlb.h:29,
> >                  from arch/s390/mm/pgtable.c:25:
> > arch/s390/include/asm/smp.h:95: error: redefinition of 'smp_send_stop'
> > include/linux/smp.h:125: error: previous definition of 'smp_send_stop' was here
> > 
> > Caused by commit d1dedb52acd98bd5e13e1ff4c4d045d58bbd16fe ("panic, smp:
> > provide smp_send_stop() wrapper on UP too") from the tip-core tree.
> 
> Ingo, could you pick up the patch below?

Applied, thanks guys!

Btw., my cross-build scripts fail on s390 on latest -git, with:

 Assembler messages:
 FATAL: can't create scripts/mod/.tmp_empty.o: Invalid bfd target
 make[3]: *** [scripts/mod/empty.o] Error 2
 make[3]: *** Waiting for unfinished jobs....

have i made some mistake in setting them up? I have this cross build 
environment:

aldebaran:~/linux/linux> /opt/crossgcc/cross/bin/s390-linux-gcc -v
Using built-in specs.
Target: s390-linux
Configured with: /home/mingo/work/projects/crossgcc/gcc/configure 
--target=s390-linux --enable-targets=all 
--prefix=/opt/crossgcc/cross --enable-languages=c --without-headers 
--enable-sjlj-exceptions --with-system-libunwind --disable-nls 
--disable-threads --disable-shared --disable-libmudflap 
--disable-libssp --disable-libgomp --disable-decimal-float 
--enable-checking=release
Thread model: single
gcc version 4.3.3 20081123 (prerelease) (GCC) 
aldebaran:~/linux/linux> /opt/crossgcc/cross/bin/s390-linux-ld -v
GNU ld (GNU Binutils) 2.19

and i use:

CROSS="CROSS_COMPILE=$ARCH-linux-"

make O=$BUILDDIR $CROSS ARCH=$ARCH mrproper defconfig

where ARCH=s390 in this case.

	Ingo
