From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the net tree
Date: Fri, 4 Sep 2009 07:52:06 -0700
Message-ID: <20090904145206.GA15964@kroah.com>
References: <20090904173225.0817003b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:56621 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752452AbZIDOya (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Sep 2009 10:54:30 -0400
Content-Disposition: inline
In-Reply-To: <20090904173225.0817003b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Hemminger <shemminger@vyatta.com>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>

On Fri, Sep 04, 2009 at 05:32:25PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/at76_usb/at76_usb.c between commits
> 6ed106549d17474ca17a16057f4c0ed4eba5a7ca ("net: use NETDEV_TX_OK instead
> of 0 in ndo_start_xmit() functions") and
> 0fc0b732eaa38beb93a6fb62f77c7bd9622c76ec ("netdev: drivers should make
> ethtool_ops const") from the net tree and commit
> c0e03fabb4f2a6e48f6e0b55729b26a599a2bd02 ("Staging: remove at76_usb
> wireless driver") from the staging tree.
> 
> The latter just removes the driver, so I did that.

Thanks, that's an easy fix :)

greg k-h
