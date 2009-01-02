From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build failure
Date: Thu, 1 Jan 2009 23:27:10 -0800
Message-ID: <20090102072710.GB3569@kroah.com>
References: <20081222113335.667c2d01.sfr@canb.auug.org.au> <20081229145506.115307fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:50096 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752288AbZABH17 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Jan 2009 02:27:59 -0500
Content-Disposition: inline
In-Reply-To: <20081229145506.115307fe.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Inaky Perez-Gonzalez <inaky@linux.intel.com>

On Mon, Dec 29, 2008 at 02:55:06PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 22 Dec 2008 11:33:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > x86_64-linux-ld: drivers/net/wimax/built-in.o: No such file: No such file or directory
> > 
> > I reverted commit 66aa675719ab82a03a66b75210fd40be6541f8fb ("wimax:
> > Makefile, Kconfig and docbook linkage for the stack") just to make the
> > build work.
> 
> Still there today.  Inaky sent you a patch, I think.

Yes he did, sorry, am on vacation with limited network access.  I'll try
to get to this tomorrow.

thanks,

greg k-h
