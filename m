From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the mfd tree
Date: Tue, 6 Jan 2009 09:54:44 -0800
Message-ID: <20090106175444.GA17805@kroah.com>
References: <20090106161107.a8448d3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:38993 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750907AbZAFTLm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 14:11:42 -0500
Content-Disposition: inline
In-Reply-To: <20090106161107.a8448d3e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@openedhand.com>, linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>

On Tue, Jan 06, 2009 at 04:11:07PM +1100, Stephen Rothwell wrote:
> Hi Samuel,
> 
> Today's linux-next merge of the mfd tree got a conflict in
> drivers/i2c/chips/Kconfig between commit
> a234ae259954121886f7f589a9cf1915d6dfab88 ("USB: move isp1301_omap to
> drivers/usb/otg") from the usb tree and commit
> 87c13493e6a59c0da55c2824f0205f9ef941b760 ("mfd: move
> drivers/i2c/chips/tps65010.c to drivers/mfd") from the mfd tree.
> 
> Just context changes (due to adjacent deletions).  I fixed it up (see
> below) and can carry the fix as necessary.

Thanks, as the mfd tree looks like it is merged with Linus now, I've
taken this fix into my tree when I resynced up with Linus's tree an hour
ago.

thanks,

greg k-h
