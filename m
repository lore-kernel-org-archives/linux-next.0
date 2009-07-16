From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Thu, 16 Jul 2009 15:50:24 -0700
Message-ID: <20090716225024.GA22375@kroah.com>
References: <20090714163309.f2ee320d.sfr@canb.auug.org.au>
 <200907140031.27979.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:33381 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933471AbZGPW4C (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2009 18:56:02 -0400
Content-Disposition: inline
In-Reply-To: <200907140031.27979.david-b@pacbell.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Brownell <david-b@pacbell.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 14, 2009 at 12:31:27AM -0700, David Brownell wrote:
> On Monday 13 July 2009, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > drivers/mtd/mtdcore.c:220: error: expected '{' before 'const'
> > drivers/mtd/mtdcore.c:227: error: 'mtd_groups' undeclared here (not in a function)
> > 
> > Caused by the update to commit ba87b739a1f5dd545679d886b8d193cdede991cf
> > ("driver model: constify attribute groups").
> > 
> > I have applied the patch below for today.
> 
> That's a good patch, go with it.  Sorry; I guess this wasn't
> the version I had test-built.  My eyes were reporting "static"
> as the (expected) initial keyword there; they lied!

I've merged this with your original one, thanks.

greg k-h
