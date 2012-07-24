From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH -next] mfd: fix arizona-irq.c build by selecting
 REGMAP_IRQ
Date: Wed, 25 Jul 2012 00:56:19 +0200
Message-ID: <20120724225619.GE11304@sortiz-mobl>
References: <20120723164036.52bc93caafcd165fc16f0284@canb.auug.org.au>
 <500D8ACA.4020501@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:43170 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751748Ab2GXW4U (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jul 2012 18:56:20 -0400
Content-Disposition: inline
In-Reply-To: <500D8ACA.4020501@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>

Hi Randy,

On Mon, Jul 23, 2012 at 10:32:58AM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> arizona-irq.c uses functions that are only available when
> CONFIG_REGMAP_IRQ is enabled, so select that symbol for
> arizona builds.
> 
> Fixes these build errors:
> 
> arizona-irq.c:(.text+0xb2d47): undefined reference to `regmap_irq_get_virq'
> (.text+0xb2fe3): undefined reference to `regmap_add_irq_chip'
> (.text+0xb3173): undefined reference to `regmap_del_irq_chip'
> 
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> Cc: Samuel Ortiz <sameo@linux.intel.com>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  drivers/mfd/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
Applied, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
