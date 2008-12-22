From: Mark McLoughlin <markmc@redhat.com>
Subject: Re: linux-next: manual merge of the rr tree
Date: Mon, 22 Dec 2008 08:45:56 +0000
Message-ID: <1229935556.3858.8.camel@localhost.localdomain>
References: <20081222173213.b7340f63.sfr@canb.auug.org.au>
	 <200812221828.33016.rusty@rustcorp.com.au>
Reply-To: Mark McLoughlin <markmc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:50686 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754060AbYLVIqP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 03:46:15 -0500
In-Reply-To: <200812221828.33016.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>

Hi Stephen/Rusty,

On Mon, 2008-12-22 at 18:28 +1030, Rusty Russell wrote:
> On Monday 22 December 2008 17:02:13 Stephen Rothwell wrote:
> > Hi Rusty,
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

The conflict resolution is correct.

> This is not unexpected.  Mark sent me those two, the others went to
> Greg.  I'm happy to ack them and send them on to Greg.

You could do that, or let Stephen carry the fixup or pull these bits
from Greg's tree into your before NEXT_PATCHES_START:

  http://www.kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/patches/driver-core/driver-core-add-root_device_register.patch
  http://www.kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/patches/driver-core/virtio-do-not-statically-allocate-root-device.patch

Thanks,
Mark.
