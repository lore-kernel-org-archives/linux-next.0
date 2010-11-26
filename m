From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for November 25 (snd/soc/codecs)
Date: Fri, 26 Nov 2010 08:27:11 -0800
Message-ID: <20101126082711.9c362c87.rdunlap@xenotime.net>
References: <20101125164929.3a719716.sfr@canb.auug.org.au>
	<20101125184513.fdb20279.rdunlap@xenotime.net>
	<20101126112145.GA30360@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:58747 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751946Ab0KZQ1Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Nov 2010 11:27:16 -0500
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-next@vger.kernel.org>; Fri, 26 Nov 2010 08:27:11 -0800
In-Reply-To: <20101126112145.GA30360@rakim.wolfsonmicro.main>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 26 Nov 2010 11:21:46 +0000 Mark Brown wrote:

> On Thu, Nov 25, 2010 at 06:45:13PM -0800, Randy Dunlap wrote:
> 
> > config SND_SOC_I2C_AND_SPI
> > 	tristate
> > 	default m if I2C=m
> > 	default y if I2C=y
> > 	default y if SPI_MASTER=y
> 
> > This doesn't handle the I2C disabled case, hence the build error.
> 
> It does, anything with this configuration should have appropriate ifdefs
> to cover it, it's just that one is missed here.  The purpose of the
> symbol is to ensure we don't try to build one of these drivers into the
> kernel when I2C is modular.

so we can look forward to a patch for this build error?

sound/soc/codecs/wm8737.c:563:error: 'i2c_master_send' undeclared (first use in this function)

thanks,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
