From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Sun, 10 Jan 2016 22:02:19 -0500 (EST)
Message-ID: <20160110.220219.34110291949766158.davem@davemloft.net>
References: <20160111134615.60c08c54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:60409 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757904AbcAKDCY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 10 Jan 2016 22:02:24 -0500
In-Reply-To: <20160111134615.60c08c54@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, Henri.Roosen@ginzinger.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 Jan 2016 13:46:15 +1100

> I applied the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 11 Jan 2016 13:25:09 +1100
> Subject: [PATCH] phy: micrel: fix up for "phy: Add an mdio_device structure"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks Stephen, it's correct and I'll make sure I do this when
I merge net into net-next.
