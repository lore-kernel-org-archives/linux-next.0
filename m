From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the arm tree
Date: Thu, 10 Jul 2008 08:30:37 +0100
Message-ID: <20080710073036.GA3812@flint.arm.linux.org.uk>
References: <20080710143354.729601d6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:46780 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751353AbYGJHa6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Jul 2008 03:30:58 -0400
Content-Disposition: inline
In-Reply-To: <20080710143354.729601d6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Philipp Zabel <philipp.zabel@gmail.com>, Greg KH <greg@kroah.com>

On Thu, Jul 10, 2008 at 02:33:54PM +1000, Stephen Rothwell wrote:
> Hi Russell,
> 
> Today's linux-next merge of the arm tree got a conflict in
> drivers/usb/gadget/ether.c between commit
> 41df25fad30d0e88ddc042358556f19a72d70054 ("usb ethernet gadget: use
> composite gadget framework") from the usb tree and commit
> 7a8576204333d133d58cbcc59dacf49a5546e3e4 ("[ARM] 5120/1: pxa: correct
> platform driver names for PXA25x and PXA27x UDC drivers") from the arm
> tree.
> 
> I am not actually sure what to do with this.  To make it build, I have
> just take the usb tree's version, but there is probably more to it than
> that.

Neither am I, especially as last night I announced that everything below
a certain commit in my tree is now frozen for the merge window (which
includes this one.)

I guess whoever merges first will have the easier time.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
