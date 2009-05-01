From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for May 1 (devtmpfs)
Date: Fri, 1 May 2009 15:56:16 -0700
Message-ID: <20090501225616.GA18064@kroah.com>
References: <20090501163405.973f9088.sfr@canb.auug.org.au> <49FB1521.5050500@oracle.com> <20090501165551.GA1889@puku.stupidest.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:59271 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751907AbZEAXDb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 1 May 2009 19:03:31 -0400
Content-Disposition: inline
In-Reply-To: <20090501165551.GA1889@puku.stupidest.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Wedgwood <cw@f00f.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kay Sievers <kay.sievers@vrfy.org>

On Fri, May 01, 2009 at 09:55:52AM -0700, Chris Wedgwood wrote:
> On Fri, May 01, 2009 at 08:28:33AM -0700, Randy Dunlap wrote:
> 
> > drivers/base/devtmpfs.c:41: error: implicit declaration of function 'vfs_mkdir'
> > drivers/base/devtmpfs.c:46: error: dereferencing pointer to incomplete type
> 
> [...]
> 
> Why is devtmpfs in linux-next?  My read of the thread so far seems to
> indicate there is considerable uncertainty that this is necessary or
> desirable.

As we discussed on irc, I think you no longer object to this, and see
how it solves a real problem, and can probably help out your initramfs
tools.

So it should stay in -next for now, and see if any build/use problems
happen with it.  I've been running it all this week on my machines just
fine.

thanks,

greg k-h
