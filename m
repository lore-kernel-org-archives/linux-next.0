From: "greg@kroah.com" <greg@kroah.com>
Subject: Re: linux-next: manual merge of the scsi tree with the staging tree
Date: Mon, 28 Aug 2017 18:05:45 +0200
Message-ID: <20170828160545.GA11231@kroah.com>
References: <20170828164127.15902025@canb.auug.org.au>
 <20170828064921.GA24696@kroah.com>
 <1503934884.2841.22.camel@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:33467 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751197AbdH1QFk (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Aug 2017 12:05:40 -0400
Content-Disposition: inline
In-Reply-To: <1503934884.2841.22.camel@wdc.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <Bart.VanAssche@wdc.com>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "James.Bottomley@HansenPartnership.com" <James.Bottomley@HansenPartnership.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hare@suse.de" <hare@suse.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "sameer.wadgaonkar@unisys.com" <sameer.wadgaonkar@unisys.com>

On Mon, Aug 28, 2017 at 03:41:28PM +0000, Bart Van Assche wrote:
> On Mon, 2017-08-28 at 08:49 +0200, Greg KH wrote:
> > On Mon, Aug 28, 2017 at 04:41:27PM +1000, Stephen Rothwell wrote:
> > > Hi James,
> > > 
> > > Today's linux-next merge of the scsi tree got a conflict in:
> > > 
> > >   drivers/staging/unisys/visorhba/visorhba_main.c
> > > 
> > > between commits:
> > > 
> > >   781facd05eb9 ("staging: unisys: visorhba: visorhba_main.c: fixed comment formatting issues")
> > > 
> > > from the staging tree and commit:
> > > 
> > >   7bc4e528d9f6 ("scsi: visorhba: sanitze private device data allocation")
> > > 
> > > from the scsi tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > 
> > Ick, messy merge, thanks for doing this.
> 
> Hello Greg,
> 
> If you agree with the following, please communicate this to the visorhba
> authors:

<snip>

No reason you can't tell them this yourself, right?  :)

> * Most SCSI drivers exist under drivers/scsi, including the virtio-scsi and
>   xen-scsifront drivers. So why has the visorhba driver been added under
>   unisys/visorhba?

That's because right now it's still a staging driver.  Also, there are
other scsi drivers in other portions of the kernel tree (like the USB
driver), so there's no hard rule that all scsi drivers have to be under
drivers/scsi/

<snip>

Please provide this review to them, on the properly mailing list, I'm
sure they would be glad to get it.

thanks,

greg k-h
