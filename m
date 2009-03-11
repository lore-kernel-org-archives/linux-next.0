From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the sound tree with the arm tree
Date: Wed, 11 Mar 2009 08:52:54 +0000
Message-ID: <20090311085254.GA30970@flint.arm.linux.org.uk>
References: <20090310144528.0fa208dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:36652 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751567AbZCKIyG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2009 04:54:06 -0400
Content-Disposition: inline
In-Reply-To: <20090310144528.0fa208dd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Alexander Schulz <alex@shark-linux.de>

On Tue, Mar 10, 2009 at 02:45:28PM +1100, Stephen Rothwell wrote:
> Hi Takashi,
> 
> Today's linux-next merge of the sound tree got a conflict in
> arch/arm/mach-shark/include/mach/io.h between commit
> eab184c2362567f2b2e951b7bd0e0d353a7e5091 ("[ARM] 5363/1: Shark cleanup
> and new defconfig") from the arm tree and commit
> 8150bc886be5ce3cc301a2baca1fcf2cf7bd7f39 ("S3C24XX: Move and update IIS
> headers") from the sound tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

NAK to this patch.

The greater concern is WTF are cleanup patches for the ARM architecture
going via the sound tree.  Especially patches which I have concerns about.

> --- a/arch/arm/mach-shark/include/mach/io.h
> +++ b/arch/arm/mach-shark/include/mach/io.h
> @@@ -11,10 -11,10 +11,10 @@@
>   #ifndef __ASM_ARM_ARCH_IO_H
>   #define __ASM_ARM_ARCH_IO_H
>   
>  -#define PCIO_BASE	0xe0000000
>  -#define IO_SPACE_LIMIT	0xffffffff
>  +#define IO_SPACE_LIMIT 0xffffffff
>   
> - #define __io(a)                 ((void __iomem *)(0xe0000000 + (a)))
>  -#define __io(a)		__typesafe_io(PCIO_BASE + (a))
>  -#define __mem_pci(addr)	(addr)
> ++#define __io(a)		__typesafe_io(0xe0000000 + (a))

Do not use __typesafe_io() with the addition here without first ensuring
that you've investigated whether it causes the compiler to mis-optimise
the code.

Takashi - please remove all such patches from the sound tree.  They
should not be in there.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
