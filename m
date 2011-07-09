From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: regmap tree for -next
Date: Sat, 9 Jul 2011 13:53:17 +0900
Message-ID: <20110709045315.GA13233@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:58923 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750790Ab1GIExX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 9 Jul 2011 00:53:23 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

Hi Stephen,

Please consider including the tree at:

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

in -next, providing Greg is happy with me doing this (the code currently
sits under drivers/base).  I'm using this tree for development of a
generic register map API for I2C and SPI type devices, factoring out a
bunch of widely duplicated code and hopefully also providing a basis for
further code sharing.

Thanks,
Mark
