From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: mfd tree build warning
Date: Tue, 24 Nov 2009 11:06:01 +0000
Message-ID: <20091124110601.GA26097@sirena.org.uk>
References: <20091124164219.c5d54461.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:49866 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932202AbZKXLF7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2009 06:05:59 -0500
Content-Disposition: inline
In-Reply-To: <20091124164219.c5d54461.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 24, 2009 at 04:42:19PM +1100, Stephen Rothwell wrote:

> I have been getting these warnings from the x86_64 allmodconfig build for
> a long time:

> drivers/mfd/wm8350-regmap.c:3177:2: warning: #warning No WM8350 config modes supported - select at least one of the
> drivers/mfd/wm8350-regmap.c:3178:2: warning: #warning MFD_WM8350_CONFIG_MODE_n options from the board driver.

> This may not be a problem, I just thought I should let you know.

It's not a real problem.  Any actual system using the driver will need
to have explicit code which registers the I2C device for the WM8350,
that code will need to set up the particular build for the board.  The
build time warning is there to try to make it a bit more obvious what's
needed.

Allowing the driver to be built without one of these defined provides
build coverage which is helpful for subsystem maintainers.

I might send a patch taking away the compile time warning, I'm not sure
how likely it is that people will notice it.
