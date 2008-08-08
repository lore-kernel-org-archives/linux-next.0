From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb.current tree
Date: Thu, 7 Aug 2008 21:33:44 -0700
Message-ID: <20080808043344.GB11743@kroah.com>
References: <20080808112646.b5502bf1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:58421 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750849AbYHHEfF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Aug 2008 00:35:05 -0400
Content-Disposition: inline
In-Reply-To: <20080808112646.b5502bf1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>, Russell King <rmk@arm.linux.org.uk>

On Fri, Aug 08, 2008 at 11:26:46AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb.current tree got a conflict in
> drivers/usb/gadget/omap_udc.c between commit
> a09e64fbc0094e3073dbb09c3b4bfe4ab669244b ("[ARM] Move
> include/asm-arm/arch-* to arch/arm/*/include/mach") from the arm-current
> tree and commit b7eff3b991784964df1e7eeffd944032ccc3e11f ("USB: omap_udc:
> fix compilation with debug enabled") from the usb.current tree.
> 
> Some of the arm header files have moved.  I think I fixed it up right (I
> changed asm/arch/control.h to mach/control.h) and will carry the fix
> while necessary.

Thanks for the warning.

greg k-h
