From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for July 1 (staging/comedi)
Date: Fri, 1 Jul 2011 15:46:04 -0700
Message-ID: <20110701224604.GA7469@kroah.com>
References: <20110701160523.5626201d.sfr@canb.auug.org.au>
 <20110701154327.69c5b852.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:35714 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757559Ab1GAWqn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Jul 2011 18:46:43 -0400
Content-Disposition: inline
In-Reply-To: <20110701154327.69c5b852.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ian Abbott <abbotti@mev.co.uk>, Frank Mori Hess <fmhess@users.sourceforge.net>

On Fri, Jul 01, 2011 at 03:43:27PM -0700, Randy Dunlap wrote:
> On Fri, 1 Jul 2011 16:05:23 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20110630:
> 
> 
> drivers/staging/comedi/drivers/ni_labpc.c: In function 'labpc_common_attach':
> drivers/staging/comedi/drivers/ni_labpc.c:602: error: implicit declaration of function 'request_dma'
> drivers/staging/comedi/drivers/ni_labpc.c:608: error: implicit declaration of function 'claim_dma_lock'
> drivers/staging/comedi/drivers/ni_labpc.c:611: error: implicit declaration of function 'release_dma_lock'
> drivers/staging/comedi/drivers/ni_labpc.c: In function 'labpc_common_detach':
> drivers/staging/comedi/drivers/ni_labpc.c:803: error: implicit declaration of function 'free_dma'
> 
> 
> on x86_64 when CONFIG_ISA_DMA_API is not enabled.
> 
> Since that driver handles both ISA and PCI devices,
> and the PCI parts are conditional, I guess that the ISA parts also
> need to be made conditional.

Ick.

Care to make a patch?

thanks,

greg k-h
