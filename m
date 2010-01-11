From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with Linus' tree
Date: Sun, 10 Jan 2010 22:50:55 -0800 (PST)
Message-ID: <20100110.225055.167520274.davem@davemloft.net>
References: <20100111133109.a191ee64.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:52199
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751372Ab0AKGur (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jan 2010 01:50:47 -0500
In-Reply-To: <20100111133109.a191ee64.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, hawk@comx.dk, hadi@cyberus.ca

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 Jan 2010 13:31:09 +1100

> Hi all,
> 
> Today's linux-next merge of the net tree got a conflict in include/linux/sysctl.h between commit 28f6aeea3f12d37bd258b2c0d5ba891bff4ec479 ("net: restore ip source validation") from Linus' tree and commit 65324144b50bc7022cc9b6ca8f4a536a957019e3 ("net: RFC3069, private VLAN proxy arp support") from the net tree.

That latter commit is specially in the net-next-2.6 tree not the
net-2.6 tree.

> They both use the same number in an enum...  I fixed it up (see below) and
> can carry the fix (or some other) for a while.

I'll merge net-2.6 into net-next-2.6 to resolve this, thanks!
