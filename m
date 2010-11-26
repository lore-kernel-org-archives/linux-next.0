From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: Tree for November 25 (snd/soc/codecs)
Date: Fri, 26 Nov 2010 11:21:46 +0000
Message-ID: <20101126112145.GA30360@rakim.wolfsonmicro.main>
References: <20101125164929.3a719716.sfr@canb.auug.org.au>
 <20101125184513.fdb20279.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43208 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754900Ab0KZLVs (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Nov 2010 06:21:48 -0500
Content-Disposition: inline
In-Reply-To: <20101125184513.fdb20279.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Nov 25, 2010 at 06:45:13PM -0800, Randy Dunlap wrote:

> config SND_SOC_I2C_AND_SPI
> 	tristate
> 	default m if I2C=m
> 	default y if I2C=y
> 	default y if SPI_MASTER=y

> This doesn't handle the I2C disabled case, hence the build error.

It does, anything with this configuration should have appropriate ifdefs
to cover it, it's just that one is missed here.  The purpose of the
symbol is to ensure we don't try to build one of these drivers into the
kernel when I2C is modular.
