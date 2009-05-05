From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Mon, 4 May 2009 21:29:11 -0700
Message-ID: <20090505042911.GA29918@kroah.com>
References: <20090504162542.41b1cb57.sfr@canb.auug.org.au> <ac3eb2510905040600k6fca3d88tb7f282e1f94df085@mail.gmail.com> <20090505141819.45ede65c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:49184 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750891AbZEEEvw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 May 2009 00:51:52 -0400
Content-Disposition: inline
In-Reply-To: <20090505141819.45ede65c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kay Sievers <kay.sievers@vrfy.org>, linux-next@vger.kernel.org

On Tue, May 05, 2009 at 02:18:19PM +1000, Stephen Rothwell wrote:
> Hi Kay, Greg,
> 
> On Mon, 4 May 2009 15:00:51 +0200 Kay Sievers <kay.sievers@vrfy.org> wrote:
> >
> > On Mon, May 4, 2009 at 08:25, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > >
> > > drivers/hid/usbhid/hiddev.c:965: error: unknown field 'nodename' specified in initializer
> > > drivers/hid/usbhid/hiddev.c:965: warning: initialization from incompatible pointer type
> > 
> > Sorry, that was my fault. I merged a fix wrongly with the original
> > patch. I sent an updated patch to Greg.
> 
> Since that update didn't make it into Greg's tree today, I just dropped
> the patch from the series for today.

That's fine, sorry about that, I didn't have the chance to get to it
today.

I should have it resolved tomorrow.

thanks,

greg k-h
