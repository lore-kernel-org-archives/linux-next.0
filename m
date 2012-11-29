From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 slave-dma tree
Date: Wed, 28 Nov 2012 21:18:46 -0800
Message-ID: <20121129051846.GE4375@kroah.com>
References: <20121129144042.add4ee11c35fa8d5f5876282@canb.auug.org.au>
 <CAKohpokZJqEvpDcZ8nf2d6DB1JXb=LB-8LY9OqT8REf0KjAOuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:46150 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750721Ab2K2FRJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Nov 2012 00:17:09 -0500
Content-Disposition: inline
In-Reply-To: <CAKohpokZJqEvpDcZ8nf2d6DB1JXb=LB-8LY9OqT8REf0KjAOuQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, Vinod Koul <vinod.koul@intel.com>

On Thu, Nov 29, 2012 at 09:16:06AM +0530, Viresh Kumar wrote:
> On 29 November 2012 09:10, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > diff --cc drivers/dma/dw_dmac.c
> 
> >  +#ifdef CONFIG_OF
> >  +static struct dw_dma_platform_data *
> >  +__devinit dw_dma_parse_dt(struct platform_device *pdev)
> 
> Do we need a separate patch to fix this place? I believe yes.

Don't worry about that for now, I'll sweep the tree after 3.8-rc1 is out
to catch stuff like this.  Otherwise the merge issues are going to be
even worse.

Or, you can fix this in the slave-dma tree if you want.

> > - static int __devinit dw_probe(struct platform_device *pdev)
> > + static int dw_probe(struct platform_device *pdev)
> 
> Thanks for this.

Me too, thanks Stephen, and sorry for the problems this caused.

greg k-h
