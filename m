From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20160217 build: 3 failures 14 warnings (next-20160217)
Date: Thu, 18 Feb 2016 11:31:42 +1100
Message-ID: <20160218113142.452fd8a0@canb.auug.org.au>
References: <E1aVxTQ-0000zq-U4@optimist>
	<20160217112225.GM7544@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47538 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161084AbcBRAbo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Feb 2016 19:31:44 -0500
In-Reply-To: <20160217112225.GM7544@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: "J. German Rivera" <German.Rivera@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Hi Mark,

On Wed, 17 Feb 2016 11:22:25 +0000 Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Feb 17, 2016 at 08:28:37AM +0000, Build bot for Mark Brown wrote:
> 
> > 	arm64-allmodconfig
> > ERROR: "msi_create_irq_domain" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> > ERROR: "irq_chip_mask_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> > ERROR: "free_msi_entry" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!  
> 
> The fsl-mc code is still breaking the build in -next, can we please drop
> the code or mark the driver as built in only until the MSI symbol
> exports are available?  This is making it difficult to spot other
> errors.

I will add a merge fixup patch for the staging tree that makes
CONFIG_FSL_MC_BUS depend on CONFIG_BROKEN.  Sorry, I should have done
this when it first came to light.

-- 
Cheers,
Stephen Rothwell
