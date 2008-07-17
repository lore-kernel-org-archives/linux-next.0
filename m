From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree
Date: Thu, 17 Jul 2008 00:04:45 -0700
Message-ID: <20080717070445.GC22090@kroah.com>
References: <20080717105430.a81c9657.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:49289 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754231AbYGQHS4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 03:18:56 -0400
Content-Disposition: inline
In-Reply-To: <20080717105430.a81c9657.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Thu, Jul 17, 2008 at 10:54:30AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Now that the firmware tree has been merged into Linus' tree, the files
> drivers/usb/serial/ti_fw_3410.h and drivers/usb/serial/ti_fw_5052.h no
> longer exist, so the patch "ti_usb: kick firmware into user space" no
> longer needs to patch them.  I am not sure if that patch is needed at all
> any more (probably not).

I'll work this out on Friday when I figure out the merge issues, thanks
for pointing it out.

greg k-h
