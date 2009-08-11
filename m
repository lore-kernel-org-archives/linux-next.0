From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH -next] soc: fix I2C build errors
Date: Tue, 11 Aug 2009 10:56:36 +0100
Message-ID: <20090811095636.GE24947@sirena.org.uk>
References: <20090810203508.f3258129.sfr@canb.auug.org.au> <20090810160439.72e417de.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:42059 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751480AbZHKMDR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Aug 2009 08:03:17 -0400
Content-Disposition: inline
In-Reply-To: <20090810160439.72e417de.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Timur Tabi <timur@freescale.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

On Mon, Aug 10, 2009 at 04:04:39PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>

> Fix soc build errors when I2C is built as a loadable module:

> (.text+0x5d26b): undefined reference to `i2c_master_send'
> soc-cache.c:(.text+0x5d32d): undefined reference to `i2c_transfer'

> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: Timur Tabi <timur@freescale.com>

I've applied this.

It'd be helpful if in future you could try to CC the relevant
maintainers on patches.  Here you've CCed Timur (who had nothing to do
with any of this code) but none of the ASoC or ALSA maintainers. 
