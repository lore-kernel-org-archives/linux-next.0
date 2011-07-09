From: Greg KH <greg@kroah.com>
Subject: Re: regmap tree for -next
Date: Fri, 8 Jul 2011 22:26:13 -0700
Message-ID: <20110709052613.GB14216@kroah.com>
References: <20110709045315.GA13233@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5.smtp.messagingengine.com ([66.111.4.29]:60232 "EHLO
	out5.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751280Ab1GIF1H (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 9 Jul 2011 01:27:07 -0400
Content-Disposition: inline
In-Reply-To: <20110709045315.GA13233@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Sat, Jul 09, 2011 at 01:53:17PM +0900, Mark Brown wrote:
> Hi Stephen,
> 
> Please consider including the tree at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next
> 
> in -next, providing Greg is happy with me doing this (the code currently
> sits under drivers/base).  I'm using this tree for development of a
> generic register map API for I2C and SPI type devices, factoring out a
> bunch of widely duplicated code and hopefully also providing a basis for
> further code sharing.

No objection from me.

thanks,

greg k-h
