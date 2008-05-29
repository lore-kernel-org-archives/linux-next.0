From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: pci/driver-core merge conflicts
Date: Thu, 29 May 2008 09:02:21 -0700
Message-ID: <20080529160221.GA9876@kroah.com>
References: <20080529121847.fcc81e2f.sfr@canb.auug.org.au> <20080529025957.GA13909@kroah.com> <200805290857.16581.jbarnes@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:47599 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758568AbYE2SUp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2008 14:20:45 -0400
Content-Disposition: inline
In-Reply-To: <200805290857.16581.jbarnes@virtuousgeek.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

On Thu, May 29, 2008 at 08:57:16AM -0700, Jesse Barnes wrote:
> On Wednesday, May 28, 2008 7:59 pm Greg KH wrote:
> > On Thu, May 29, 2008 at 12:18:47PM +1000, Stephen Rothwell wrote:
> > > Hi Jesse, Greg,
> > >
> > > Today's linux-next merge of the pci tree got a trivial conflict in
> > > drivers/base/power/main.c between commit
> > > bd24b944eb93549b1ca5becbf27c7373504f7eed ("driver-core: prepare for
> > > removal of 20 char limit from struct device") from the driver-core tree
> > > and commit 4ba09608f82f2273b731560f702f8bbb167f4c23 ("Introduce new top
> > > level suspend and hibernation callbacks") from the pci tree.  I took the
> > > latter version except to use "dev_name(dev->parent)" instead of
> > > "dev->parent->bus_id".
> >
> > Yes, that is correct.
> >
> > > The second conflict was in include/linux/device.h between commit
> > > 9c77d9cc76e424a3c59822c405cbf75a45465170 ("class: move driver core
> > > specific parts to a private structure") from the driver-core tree and
> > > commit 4ba09608f82f2273b731560f702f8bbb167f4c23 ("Introduce new top level
> > > suspend and hibernation callbacks") from the pci tree.  I just added both
> > > new fields of struct class.
> >
> > That should be fine.
> 
> Hm, I knew this would cause problems eventually. :)  Should I put these fixups 
> in my tree?  Or can you track them somehow, Stephen?

Yes, I'll be breaking them up and sending them to you in a few days so
Stephen doesn't have to handle all of this.  Right now it's in a single
patch file that touches about 400+ files :)

thanks,

greg k-h
