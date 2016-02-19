From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: next-20160217 build: 3 failures 14 warnings (next-20160217)
Date: Fri, 19 Feb 2016 14:48:11 -0800
Message-ID: <20160219224811.GA29307@kroah.com>
References: <E1aVxTQ-0000zq-U4@optimist>
 <20160217112225.GM7544@sirena.org.uk>
 <20160218113142.452fd8a0@canb.auug.org.au>
 <20160218134326.GD7129@sirena.org.uk>
 <20160218135945.GB3941@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:54394 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S2993099AbcBSWsL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Feb 2016 17:48:11 -0500
Content-Disposition: inline
In-Reply-To: <20160218135945.GB3941@ulmo.nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "J. German Rivera" <German.Rivera@freescale.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

On Thu, Feb 18, 2016 at 02:59:45PM +0100, Thierry Reding wrote:
> On Thu, Feb 18, 2016 at 01:43:26PM +0000, Mark Brown wrote:
> > On Thu, Feb 18, 2016 at 11:31:42AM +1100, Stephen Rothwell wrote:
> > > On Wed, 17 Feb 2016 11:22:25 +0000 Mark Brown <broonie@kernel.org> wrote:
> > 
> > > > The fsl-mc code is still breaking the build in -next, can we please drop
> > > > the code or mark the driver as built in only until the MSI symbol
> > > > exports are available?  This is making it difficult to spot other
> > > > errors.
> > 
> > > I will add a merge fixup patch for the staging tree that makes
> > > CONFIG_FSL_MC_BUS depend on CONFIG_BROKEN.  Sorry, I should have done
> > > this when it first came to light.
> > 
> > Thanks!  It'd still be good to get an actual fix in there though...
> 
> I'll ping Greg on the two patches that I sent on Monday.

Should now be resolved.

thanks,

greg k-h
