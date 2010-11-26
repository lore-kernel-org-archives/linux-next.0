From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for November 25 (snd/soc/codecs)
Date: Thu, 25 Nov 2010 18:45:13 -0800
Message-ID: <20101125184513.fdb20279.rdunlap@xenotime.net>
References: <20101125164929.3a719716.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:34628 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753006Ab0KZCpO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Nov 2010 21:45:14 -0500
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-next@vger.kernel.org>; Thu, 25 Nov 2010 18:45:13 -0800
In-Reply-To: <20101125164929.3a719716.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@slimlogic.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 25 Nov 2010 16:49:29 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20101124:


When CONFIG_I2C is not enabled:

sound/soc/codecs/wm8737.c:521:error: 'i2c_master_send' undeclared (first use in this function)

but CONFIG_SND_SOC_I2C_AND_SPI=m
and CONFIG_SND_SOC_WM8737=m

Should SND_SOC_I2C_AND_SPI depend on I2C && SPI ??

config SND_SOC_I2C_AND_SPI
	tristate
	default m if I2C=m
	default y if I2C=y
	default y if SPI_MASTER=y


This doesn't handle the I2C disabled case, hence the build error.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
