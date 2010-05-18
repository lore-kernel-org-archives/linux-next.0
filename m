From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Tue, 18 May 2010 07:00:52 -0700
Message-ID: <20100518140052.GA24113@kroah.com>
References: <20100518174253.37e38d66.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:38477 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757353Ab0EROBA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 May 2010 10:01:00 -0400
Content-Disposition: inline
In-Reply-To: <20100518174253.37e38d66.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 18, 2010 at 05:42:53PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (powerpc
> ppc6xx_defconfig) failed like this:
> 
> drivers/usb/host/ehci-fsl.c:316: error: 'ehci' undeclared (first use in this function)
> 
> Caused by commit d19f8cd047971b43844d61d995be736dacb4826a ("USB: EHCI:
> fix controller wakeup flag settings during suspend").

Ick.  Alan, care to send either a fix-up patch I can merge with the
original, or a separate patch to resolve this?

thanks,

greg k-h
