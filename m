From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: mfd tree build failure
Date: Mon, 11 Jan 2010 10:51:26 +0000
Message-ID: <20100111105126.GD3440@sirena.org.uk>
References: <20100111160232.e37e5393.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:60305 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755Ab0AKKvb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Jan 2010 05:51:31 -0500
Content-Disposition: inline
In-Reply-To: <20100111160232.e37e5393.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>

On Mon, Jan 11, 2010 at 04:02:32PM +1100, Stephen Rothwell wrote:
> Hi Sam,

> Today's linux-next build (x86_64_allmodconfig, gcc 4.4.0, binutils
> 2.19.1) failed like this:

> ERROR: "max8925_set_bits" [drivers/video/backlight/max8925_bl.ko] undefined!
> ERROR: "max8925_reg_write" [drivers/video/backlight/max8925_bl.ko] undefined!
> ERROR: "max8925_reg_read" [drivers/video/backlight/max8925_bl.ko] undefined!
> ERROR: "max8925_set_bits" [drivers/regulator/max8925.ko] undefined!
> ERROR: "max8925_reg_read" [drivers/regulator/max8925.ko] undefined!

> I am not sure what caused this, so I have used the version of the mfd
> tree from next-20100108 for today.

CCing in Haojian who did the driver.  I've not looked but I'd guess that
the issue is missing EXPORT_SYMBOL{,_GPL}s on the symbols above.
