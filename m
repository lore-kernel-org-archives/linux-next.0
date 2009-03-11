From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: manual merge of the sound tree with the arm tree
Date: Wed, 11 Mar 2009 09:49:19 +0000
Message-ID: <20090311094919.GA24375@opensource.wolfsonmicro.com>
References: <20090310144528.0fa208dd.sfr@canb.auug.org.au> <20090311085254.GA30970@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37805 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752676AbZCKJtW (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2009 05:49:22 -0400
Content-Disposition: inline
In-Reply-To: <20090311085254.GA30970@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>, Alexander Schulz <alex@shark-linux.de>

On Wed, Mar 11, 2009 at 08:52:54AM +0000, Russell King wrote:

> The greater concern is WTF are cleanup patches for the ARM architecture
> going via the sound tree.  Especially patches which I have concerns about.

The reason they're going via the ALSA tree is that Ben has also
submitted patches adding S3C64xx audio support which depends strongly on
the ARM tree changes moving the header files about.  The ARM-generic
changes are also available in a split out branch via:

	git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound-2.6.git
	s3c-iis-header

Sorry about this - I'd been expecting Ben to also include this branch in
the code he's pushing to you and obviously hadn't reviewed them as well
as possible.

> Takashi - please remove all such patches from the sound tree.  They
> should not be in there.

Could we instead revert the bits that cause issues?  It'd be really good
to be able to get the audio drivers into the next merge window.

Re-reviewing the commit it looks like the shark header update that
changes to using typesafe_io() is just completely unrelated to the rest
of the series (commit 8150bc886be5ce3cc301a2baca1fcf2cf7bd7f39 does that
change in an isolated hunk).  I'll push a revert of that hunk to Takashi
this morning.

I'll also remove the change below which looks like a good change in
itself but doesn't appear to be relevant to the header renames:

diff --git a/arch/arm/mach-s3c2410/include/mach/hardware.h b/arch/arm/mach-s3c24
index 74d5a1a..db72beb 100644
--- a/arch/arm/mach-s3c2410/include/mach/hardware.h
+++ b/arch/arm/mach-s3c2410/include/mach/hardware.h
@@ -131,7 +131,4 @@ extern int s3c2412_gpio_set_sleepcfg(unsigned int
pin, unsig
 
 /* machine specific hardware definitions should go after this */
 
-/* currently here until moved into config (todo) */
-#define CONFIG_NO_MULTIWORD_IO
-
 #endif /* __ASM_ARCH_HARDWARE_H */

There are a couple of other hunks which look like they may warrant the
same treatment but I want to re-check just to make sure:

diff --git a/arch/arm/mach-s3c2410/include/mach/io.h b/arch/arm/mach-s3c2410/inc
lude/mach/io.h
index 9813dbf..c477771 100644
--- a/arch/arm/mach-s3c2410/include/mach/io.h
+++ b/arch/arm/mach-s3c2410/include/mach/io.h
@@ -9,7 +9,7 @@
 #ifndef __ASM_ARM_ARCH_IO_H
 #define __ASM_ARM_ARCH_IO_H
 
-#include <mach/hardware.h>
+#include <mach/map.h>
 
 #define IO_SPACE_LIMIT 0xffffffff
 
diff --git a/arch/arm/plat-s3c24xx/clock-dclk.c b/arch/arm/plat-s3c24xx/clock-dclk.c
index 5b75a79..35219dc 100644
--- a/arch/arm/plat-s3c24xx/clock-dclk.c
+++ b/arch/arm/plat-s3c24xx/clock-dclk.c
@@ -18,6 +18,7 @@
 
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
+#include <mach/hardware.h>
 
 #include <plat/clock.h>
 #include <plat/cpu.h>
