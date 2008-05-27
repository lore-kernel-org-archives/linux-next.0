From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb/sparc build failure
Date: Tue, 27 May 2008 09:50:19 -0700
Message-ID: <20080527165019.GB3699@kroah.com>
References: <20080527202630.6352736d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:38498 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757505AbYE0QwL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 May 2008 12:52:11 -0400
Content-Disposition: inline
In-Reply-To: <20080527202630.6352736d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Vrabel <david.vrabel@csr.com>, "David S. Miller" <davem@davemloft.net>

On Tue, May 27, 2008 at 08:26:30PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's (though it is not new) linux-next build (spac allmodconfig) fails
> like this:
> 
> drivers/uwb/whci.c:166: error: `DMA_64BIT_MASK' undeclared (first use in this function)
> drivers/uwb/whci.c:166: error: (Each undeclared identifier is reported only once
> drivers/uwb/whci.c:166: error: for each function it appears in.)
> drivers/uwb/whci.c:168: error: `DMA_32BIT_MASK' undeclared (first use in this function)

Is this sparc64 or sparc32?  I don't seem to get these errors using the
sparc64 cross compiler tool chain.

thanks,

greg k-h
