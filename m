From: "greg@kroah.com" <greg@kroah.com>
Subject: Re: linux-next: manual merge of the scsi tree with the staging tree
Date: Mon, 28 Aug 2017 18:44:20 +0200
Message-ID: <20170828164420.GB16802@kroah.com>
References: <20170828164127.15902025@canb.auug.org.au>
 <20170828064921.GA24696@kroah.com>
 <1503934884.2841.22.camel@wdc.com>
 <20170828160545.GA11231@kroah.com>
 <1503938165.2841.30.camel@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:34211 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751203AbdH1QoQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Aug 2017 12:44:16 -0400
Content-Disposition: inline
In-Reply-To: <1503938165.2841.30.camel@wdc.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <Bart.VanAssche@wdc.com>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>, "hare@suse.de" <hare@suse.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "sameer.wadgaonkar@unisys.com" <sameer.wadgaonkar@unisys.com>

On Mon, Aug 28, 2017 at 04:36:06PM +0000, Bart Van Assche wrote:
> On Mon, 2017-08-28 at 18:05 +0200, greg@kroah.com wrote:
> > On Mon, Aug 28, 2017 at 03:41:28PM +0000, Bart Van Assche wrote:
> > > * Most SCSI drivers exist under drivers/scsi, including the virtio-scsi and
> > >   xen-scsifront drivers. So why has the visorhba driver been added under
> > >   unisys/visorhba?
> > 
> > That's because right now it's still a staging driver.  Also, there are
> > other scsi drivers in other portions of the kernel tree (like the USB
> > driver), so there's no hard rule that all scsi drivers have to be under
> > drivers/scsi/
> > 
> > <snip>
> > 
> > Please provide this review to them, on the properly mailing list, I'm
> > sure they would be glad to get it.
> 
> OK, I will do that. BTW, is there a written down version of the rules for
> adding a driver under drivers/staging available somewhere? 

The only 2 rules for adding a new drivers/staging driver is:
	- has to compile
	- correct license
and sometimes we let code in if the first one isn't true :)

> As far as I can
> see the visorhba driver went in without the linux-scsi mailing list having
> been CC-ed. See also Benjamin Romer, [PATCH] staging: unisys: Add s-Par
> visorhba, linux-driver-devel mailing list, July 2015
> (https://marc.info/?l=linux-driver-devel&m=143681271902628).

That's totally normal, why would the scsi developers care about a
staging driver in such a rough state.  Only when it looks "good enough"
would we ask for a scsi developer review to move it out of staging.

hope this helps,

greg k-h
