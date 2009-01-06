From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the mfd tree
Date: Tue, 6 Jan 2009 09:55:10 -0800
Message-ID: <20090106175510.GB17805@kroah.com>
References: <20090106161409.da9932a2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:39001 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750917AbZAFTLn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 14:11:43 -0500
Content-Disposition: inline
In-Reply-To: <20090106161409.da9932a2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@openedhand.com>, linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>

On Tue, Jan 06, 2009 at 04:14:09PM +1100, Stephen Rothwell wrote:
> Hi Samuel,
> 
> Today's linux-next merge of the mfd tree got a conflict in
> drivers/i2c/chips/Makefile between commit
> a234ae259954121886f7f589a9cf1915d6dfab88 ("USB: move isp1301_omap to
> drivers/usb/otg") from the usb tree and commits
> 87c13493e6a59c0da55c2824f0205f9ef941b760 ("mfd: move
> drivers/i2c/chips/tps65010.c to drivers/mfd") and
> 88e75cc347f66bc20e3c2b920431fc07253d69be ("mfd: move
> drivers/i2c/chips/menelaus.c to drivers/mfd") from the mfd tree.
> 
> Again, just adjacent removals.  I fixed it up (see below) and can carry
> the fix as necessary.

Like the other mfd issue, I've now fixed this up in my tree.

thanks,

greg k-h
