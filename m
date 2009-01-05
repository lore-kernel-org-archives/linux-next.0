From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the rr tree
Date: Sun, 4 Jan 2009 20:36:23 -0800
Message-ID: <20090105043623.GA16341@kroah.com>
References: <20081222173213.b7340f63.sfr@canb.auug.org.au> <20090105103036.dacccbed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:40648 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752227AbZAEEh4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 4 Jan 2009 23:37:56 -0500
Content-Disposition: inline
In-Reply-To: <20090105103036.dacccbed.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Rusty Russell <rusty@rustcorp.com.au>, Mark McLoughlin <markmc@redhat.com>

On Mon, Jan 05, 2009 at 10:30:36AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 22 Dec 2008 17:32:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the rr tree got a conflict in
> > drivers/virtio/virtio_pci.c between commit
> > b5146336e3bc3786712919e94106063036dae86b ("virtio: do not statically
> > allocate root device") from the driver-core tree and commits
> > f53dba3a1ea82dfb37f094a942ae74032413809f ("virtio: struct device -
> > replace bus_id with dev_name(), dev_set_name()") and
> > ab4e479d47ceac2fa5bebd5b99d27f01fe0e0c8b ("virtio: add PCI device release
> > () function") from the rr tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary.  Mark, does
> > this driver-core patch obsolete the second rr tree patch above?
> > -- 
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> > http://www.canb.auug.org.au/~sfr/
> > 
> > diff --cc drivers/virtio/virtio_pci.c
> > index f772cc4,265fdf2..0000000
> > --- a/drivers/virtio/virtio_pci.c
> > +++ b/drivers/virtio/virtio_pci.c
> > @@@ -324,7 -343,8 +340,8 @@@ static int __devinit virtio_pci_probe(s
> >   	if (vp_dev == NULL)
> >   		return -ENOMEM;
> >   
> >  -	vp_dev->vdev.dev.parent = &virtio_pci_root;
> >  +	vp_dev->vdev.dev.parent = virtio_pci_root;
> > + 	vp_dev->vdev.dev.release = virtio_pci_release_dev;
> >   	vp_dev->vdev.config = &virtio_pci_config_ops;
> >   	vp_dev->pci_dev = pci_dev;
> >   	INIT_LIST_HEAD(&vp_dev->virtqueues);
> 
> This conflict is now between Linus' tree and the driver-core tree.

Thanks for letting me know, I'll fix it up tomorrow when I get back to
the patch queues :)

greg k-h
