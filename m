From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build failure
Date: Thu, 14 Aug 2008 05:25:38 -0700
Message-ID: <20080814122538.GF31927@kroah.com>
References: <20080813163728.08551adf.sfr@canb.auug.org.au> <20080813173339.874bd598.sfr@canb.auug.org.au> <20080814002336.f13ac789.sfr@canb.auug.org.au> <20080814162834.de56c895.sfr@canb.auug.org.au> <20080814165455.c2f3f8a2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:54275 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755145AbYHNMft (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Aug 2008 08:35:49 -0400
Content-Disposition: inline
In-Reply-To: <20080814165455.c2f3f8a2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Thu, Aug 14, 2008 at 04:54:55PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Thu, 14 Aug 2008 16:28:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > I have added
> > 
> > #include "../core/usb.h"
> > 
> > near the top of all four files for today's linux-next.
> 
> Only to find that that is complete wrong :-)
> 
> I have added that include to just drivers/usb/host/ohci-hcd.c instead.

Heh, thanks for this, I'll go include this change in the tree.

greg k-h
