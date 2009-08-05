From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: tty tree build warning
Date: Wed, 5 Aug 2009 09:59:31 -0700
Message-ID: <20090805165931.GA4828@kroah.com>
References: <20090805171606.d3d3877c.sfr@canb.auug.org.au>
 <20090805132914.GA6054@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:45779 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934292AbZHERJL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Aug 2009 13:09:11 -0400
Content-Disposition: inline
In-Reply-To: <20090805132914.GA6054@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

On Wed, Aug 05, 2009 at 06:29:14AM -0700, Greg KH wrote:
> On Wed, Aug 05, 2009 at 05:16:06PM +1000, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next build (powerpc allyesconfig) produced this warning:
> > 
> > drivers/char/cyclades.c:3112: warning: initialization from incompatible pointer type
> > drivers/char/cyclades.c:3118: warning: initialization from incompatible pointer type
> > 
> > Introduced by commit 46075a6e64b5e4e96079ea273781a1ba366d8244
> > ("tty-cyclades-port-close").
> 
> Odd, I haven't changed anything there.  I'll check to see what happened.

I've now fixed this and pushed out the changes.

thanks,

greg k-h
