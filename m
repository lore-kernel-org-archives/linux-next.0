From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree
Date: Wed, 23 Jul 2008 07:04:18 -0700
Message-ID: <20080723140418.GB15537@kroah.com>
References: <20080723113135.5e22bf4d.sfr@canb.auug.org.au> <20080723180926.51c1bd08.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:34959 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752457AbYGWOHh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jul 2008 10:07:37 -0400
Content-Disposition: inline
In-Reply-To: <20080723180926.51c1bd08.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Howells <dhowells@redhat.com>

On Wed, Jul 23, 2008 at 06:09:26PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Wed, 23 Jul 2008 11:31:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the driver-core tree got conflicts in 58
> > files due to the partial merge into Linus' tree of the driver-core tree.
> > The conflicts were all caused by the renamed of device_create_drvdata()
> > to device_create() so I took the driver-core versions of almost all those
> > files.  The exceptions were drivers/char/tty_io.c,
> > drivers/char/istallion.c, drivers/char/stallion.c and
> > drivers/isdn/capi/capi.c which required a manual merge (I applied the
> > rename by hand on top of the upstream version of the file in each case).
> > Someone might like to check that I have it all right when I publish the
> > tree.
> > 
> > Hopefully this will be fixed up soon.
> 
> I think one way to avoid this in the future would be to move all the
> patches that you have asked Linus to merge into the driver-core.current
> series immediately you make the request (or even before).  That would
> separate my merge of the patches that are identical on both sides from
> the patches that further change the same files.

Ah, that might help, but only if you hit the same pull window like we
did this time.  That's usually rare.  I'll do this the next time.

thanks,

greg k-h
