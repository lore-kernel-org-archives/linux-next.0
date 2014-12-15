From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 watchdog tree
Date: Sun, 14 Dec 2014 20:35:06 -0800
Message-ID: <20141215043506.GB3949@kroah.com>
References: <20141215141114.575b8767@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:40229 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751062AbaLOEfI (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Dec 2014 23:35:08 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id CC47F20748
	for <linux-next@vger.kernel.org>; Sun, 14 Dec 2014 23:35:07 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20141215141114.575b8767@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>, Wolfram Sang <wsa@the-dreams.de>

On Mon, Dec 15, 2014 at 02:11:14PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/watchdog/imx2_wdt.c between commit 6dc21678dbd9 ("watchdog:
> imx2_wdt: Add power management support") from the watchdog tree and
> commit fa21a580dea4 ("watchdog: drop owner assignment from
> platform_drivers") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

How is this happening, nothing has changed in my trees, did something
new get added to the watchdog tree?

thanks,

greg k-h
