From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with Linus' tree
Date: Wed, 15 Dec 2010 19:08:57 -0800
Message-ID: <20101216030857.GA12785@kroah.com>
References: <20101216140122.ca745f1f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:45185 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751325Ab0LPDIH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Dec 2010 22:08:07 -0500
Content-Disposition: inline
In-Reply-To: <20101216140122.ca745f1f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bob Liu <lliubbo@gmail.com>, Mike Frysinger <vapier.adi@gmail.com>, Felipe Balbi <balbi@ti.com>

On Thu, Dec 16, 2010 at 02:01:22PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/musb/blackfin.c drivers/usb/musb/musb_core.c
> drivers/usb/musb/musb_core.h between commit
> 1e393c6eece048052d4131ec4dad3b98e35a98e2 ("USB: musb: blackfin: pm: make
> it work") from Linus' tree (v2.6.37-rc2) and various commits from the usb
> tree.
> 
> It was not immediately obvious how to fix these up, so I just used the
> versions from the usb tree.  This may not be correct and it would be good
> if this was fixed properly in the usb tree.

Hm.  Felipe, I'll merge in the -rc4 tree into usb-next if it makes sense
to do so now, can you send me the patch that ends up being the correct
merge?

thanks,

greg k-h
