From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the mtd tree
Date: Tue, 9 Dec 2008 18:27:11 -0800
Message-ID: <20081210022711.GA28801@kroah.com>
References: <20081127151548.eb40da3c.sfr@canb.auug.org.au> <20081210130806.27fcb097.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:56396 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753832AbYLJCbH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 21:31:07 -0500
Content-Disposition: inline
In-Reply-To: <20081210130806.27fcb097.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Andrew Morton <akpm@linux-foundation.org>, Kay Sievers <kay.sievers@vrfy.org>

On Wed, Dec 10, 2008 at 01:08:06PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Thu, 27 Nov 2008 15:15:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the mtd tree got a conflict in
> > drivers/mtd/maps/physmap.c between commit
> > a64cbdb4da5c8482929e7bc9c542e9757ad3e0f1 ("mtd: struct device - replace
> > bus_id with dev_name(), dev_set_name()") from the driver-core tree and
> > commit 3136e903fa2d493ebc1b8a8fbdde2d3a17f85acd ("[MTD] physmap: fix
> > memory leak on physmap_flash_remove by using devres") from the mtd tree.
> > 
> > I fixed it up (see below) and can carry it for a short while.
> > 
> > Dave, you should apply the patch from the driver-core tree (which was
> > cc:d to you) (and cope with the rejects :-)) and let Greg KH know when
> > you have.
> > 
> > diff --cc drivers/mtd/maps/physmap.c
> > index 8e2ee92,dfbf3f2..0000000
> > --- a/drivers/mtd/maps/physmap.c
> > +++ b/drivers/mtd/maps/physmap.c
> > @@@ -114,10 -105,10 +105,10 @@@ static int physmap_flash_probe(struct p
> >   		       (unsigned long long)(dev->resource[i].end - dev->resource[i].start + 1),
> >   		       (unsigned long long)dev->resource[i].start);
> >   
> > - 		info->res = request_mem_region(dev->resource[i].start,
> > - 					       dev->resource[i].end - dev->resource[i].start + 1,
> > - 					       dev_name(&dev->dev));
> > - 		if (info->res == NULL) {
> > + 		if (!devm_request_mem_region(&dev->dev,
> > + 			dev->resource[i].start,
> > + 			dev->resource[i].end - dev->resource[i].start + 1,
> >  -			dev->dev.bus_id)) {
> > ++			dev_name(&dev->dev))) {
> >   			dev_err(&dev->dev, "Could not reserve memory region\n");
> >   			err = -ENOMEM;
> >   			goto err_out;
> 
> This conflict is now in the driver-core tree as the mtd tree has been
> merged into Linus' tree ...

Ah, thanks, will update my tree with this one, didn't realize mtd had
merged with Linus.

greg k-h
