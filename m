From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: s390 build failure
Date: Fri, 20 Mar 2009 11:33:24 +0100
Message-ID: <20090320113324.638a5cb8@osiris.boeblingen.de.ibm.com>
References: <20090320104208.0cb4b2b5.sfr@canb.auug.org.au>
	<20090320092410.30d2bac3@osiris.boeblingen.de.ibm.com>
	<20090320100021.GB6256@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate1.de.ibm.com ([195.212.17.161]:41293 "EHLO
	mtagate1.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756224AbZCTKd3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2009 06:33:29 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate1.de.ibm.com (8.13.1/8.13.1) with ESMTP id n2KAXROh017677
	for <linux-next@vger.kernel.org>; Fri, 20 Mar 2009 10:33:27 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id n2KAXRF83686632
	for <linux-next@vger.kernel.org>; Fri, 20 Mar 2009 11:33:27 +0100
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n2KAXQRk003265
	for <linux-next@vger.kernel.org>; Fri, 20 Mar 2009 11:33:27 +0100
In-Reply-To: <20090320100021.GB6256@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

On Fri, 20 Mar 2009 11:00:22 +0100
Ingo Molnar <mingo@elte.hu> wrote:
> Btw., my cross-build scripts fail on s390 on latest -git, with:
> 
>  Assembler messages:
>  FATAL: can't create scripts/mod/.tmp_empty.o: Invalid bfd target
>  make[3]: *** [scripts/mod/empty.o] Error 2
>  make[3]: *** Waiting for unfinished jobs....

Haven't seen this yet.

> have i made some mistake in setting them up? I have this cross build 
> environment:
> 
> aldebaran:~/linux/linux> /opt/crossgcc/cross/bin/s390-linux-gcc -v
> Using built-in specs.
> Target: s390-linux
> Configured with: /home/mingo/work/projects/crossgcc/gcc/configure 
> --target=s390-linux --enable-targets=all 
> --prefix=/opt/crossgcc/cross --enable-languages=c --without-headers 
> --enable-sjlj-exceptions --with-system-libunwind --disable-nls 
> --disable-threads --disable-shared --disable-libmudflap 
> --disable-libssp --disable-libgomp --disable-decimal-float 
> --enable-checking=release
> Thread model: single
> gcc version 4.3.3 20081123 (prerelease) (GCC) 
> aldebaran:~/linux/linux> /opt/crossgcc/cross/bin/s390-linux-ld -v
> GNU ld (GNU Binutils) 2.19

ah, it's probably that you specified --target=s390-linux , that will
build a 32 bit compiler, not a 64 bit one. You probably want
s390x-ibm-linux. That gcc version can build both 32 and 64 bit binaries.

Latest cross compiler I have on my notebook that works:

heiko@osiris:~> s390x-ibm-linux-gcc-4.3.1 -v
Using built-in specs.
Target: s390x-ibm-linux
Configured with: ../gcc-4.3.1/configure --prefix=/home/heiko/cross/
--disable-nls --disable-checking --enable-languages=c
--target=s390x-ibm-linux --disable-threads --disable-shared
--without-headers --disable-libmudflap --disable-libssp
--disable-multilib --disable-libunwind-exceptions --disable-libgomp
--disable-werror --program-prefix=s390x-4.3.1-
Thread model: single gcc
version 4.3.1 (GCC) 


heiko@osiris:~> s390x-4.3.1-ld -v    
GNU ld (Linux/GNU Binutils) 2.19.51.0.1.20090106

> and i use:
> 
> CROSS="CROSS_COMPILE=$ARCH-linux-"
> 
> make O=$BUILDDIR $CROSS ARCH=$ARCH mrproper defconfig
> 
> where ARCH=s390 in this case.

should work.
