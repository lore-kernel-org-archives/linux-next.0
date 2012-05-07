From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Date: Mon, 7 May 2012 09:05:05 -0700
Message-ID: <20120507160505.GA23505@kroah.com>
References: <20120503144410.3aab6165a98e4f36bf50fcf5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:34971 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756701Ab2EGQFH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 May 2012 12:05:07 -0400
Content-Disposition: inline
In-Reply-To: <20120503144410.3aab6165a98e4f36bf50fcf5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Stephen Warren <swarren@wwwdotorg.org>, Venu Byravarasu <vbyravarasu@nvidia.com>

On Thu, May 03, 2012 at 02:44:10PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/host/ehci-tegra.c between commit ebf20de45304 ("EHCI: update
> PM methods in ehci-tegra.c") from the usb.current tree and commit
> fe375774bd88 ("usb: host: tegra: code clean up") from the usb tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

This should now be resolved in my tree.

thanks,

greg k-h
