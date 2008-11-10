From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree
Date: Sun, 9 Nov 2008 17:40:57 -0800
Message-ID: <20081110014057.GA5996@kroah.com>
References: <20081110120620.c41afd61.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:47933 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752620AbYKJDFp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 Nov 2008 22:05:45 -0500
Content-Disposition: inline
In-Reply-To: <20081110120620.c41afd61.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Jonathan McDowell <noodles@earth.li>, Jeff Garzik <jgarzik@redhat.com>, "David S. Miller" <davem@davemloft.net>, Denis Joseph Barrow <D.Barow@option.com>

On Mon, Nov 10, 2008 at 12:06:20PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/net/usb/hso.c between commit
> 939a9516416ad8ccec27aa05bd19236c550c0c03 ("[netdrvr] usb/hso: Cleanup
> rfkill error handling") from the net-current tree and commit
> d0797ae05df8297aa1db7216c8814419047d5a12 ("HSO: put linefeeds on printk's
> in hso.c") from the usb tree.
> 
> Some of the changes from the latter have been done on the former and the
> former added some code next to those changes.  I have fixed it up for now
> but the net-current change will (presumably) be in Linus' tree shortly,
> so I expect this to be fixed in the usb tree soon.

Thanks, I'll drop the HSO patches from the usb tree as Jeff has now
picked them up.

greg k-h
