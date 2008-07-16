From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree
Date: Tue, 15 Jul 2008 19:30:13 -0700
Message-ID: <20080716023013.GA7052@kroah.com>
References: <20080716120219.a3de00bd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:58381 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758692AbYGPDNs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Jul 2008 23:13:48 -0400
Content-Disposition: inline
In-Reply-To: <20080716120219.a3de00bd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jaswinder Singh <jaswinder@infradead.org>

On Wed, Jul 16, 2008 at 12:02:19PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/serial/io_ti.c between commit
> d12b219a228efe92f0778ed3af21305e65fbb052 ("edgeport-ti: use
> request_firmware()") from Linus' tree and commit
> 1f023570c8d00d3511799ccad21dc3525a6160e1 ("USB: io_ti: FIrst cut at a big
> clean up") from the usb tree.
> 
> This conflict used to be in the firmware tree and my solution then was to
> remove the commit now in Linus' tree because the fixup was going to take
> to long.  Now my solution is to remove the commit from the usb tree.

I'll fix this up by hand, I'm lagging right now due to work issues (am
traveling right now), but hope to get this cleaned up by Friday so that
I can push the USB and driver core trees to Linus by then.

thanks for the heads up and sorry to cause you problems here.  Keep up
the great work.

greg k-h
