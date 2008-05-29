From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: rr/driver-core merge conflicts
Date: Thu, 29 May 2008 09:09:44 -0700
Message-ID: <20080529160944.GA10595@kroah.com>
References: <20080529155818.6e298a47.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:40192 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750978AbYE2Tn1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2008 15:43:27 -0400
Content-Disposition: inline
In-Reply-To: <20080529155818.6e298a47.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Kay Sievers <kay.sievers@vrfy.org>, linux-next@vger.kernel.org

On Thu, May 29, 2008 at 03:58:18PM +1000, Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next merge of the rr tree got a conflict in
> drivers/virtio/virtio_pci.c between commit
> 6ddd7ce42a7bb3382a8bfb10caa6a5cce321b533 ("driver core: convert to new
> device API to allow names longer than 20 chars") from the driver-core
> tree and commit c77b394544154fdd2fb2211a2106fcc793aaa547
> ("virtio:pci-should-not-set-bus_id") from the rr tree.  The latter
> removes code that the former changed to use dev_set_name().

If it's removed, that's the correct merge.

> The second conflict was in drivers/virtio/virtio.c between the same
> driver-core commit and commit a48130de9ad5da45f6d3035030e1fc975559e0e7
> ("virtio:bus_id-should-contain-virtio-name") from the rr tree.  The
> former did the dev_set_name() change while the latter added "virtio" to
> the name.  I did the obvious.

thanks, that sounds sane.

> Greg, is there some way we could add a version of dev_set_name() to
> current mainline now so that the conversions can be farmed out (or at
> least be done in other trees destined for linux-next)?

Yes, I'll do that today, thanks for the idea.

greg k-h
