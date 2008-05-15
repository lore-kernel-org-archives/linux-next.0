From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb.current merge conflict
Date: Wed, 14 May 2008 19:39:11 -0700
Message-ID: <20080515023911.GA21941@kroah.com>
References: <20080515111244.25b945ea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:35407 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbYEOCmH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 May 2008 22:42:07 -0400
Content-Disposition: inline
In-Reply-To: <20080515111244.25b945ea.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Thu, May 15, 2008 at 11:12:44AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb.current tree got a trivial conflict
> in drivers/usb/gadget/serial.c.  It looks like someone fixed up the
> spacing around some ','s before the "USB: serial gadget: cleanup/reorg"
> patch went into Linus' tree.

Yes, I did some checkpatch.pl cleanups before sending them to Linus,
they will merge away with the next -git release that comes out tomorrow.

thanks,

greg k-h
