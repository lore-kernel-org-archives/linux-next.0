From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with Linus' tree
Date: Mon, 02 Feb 2009 23:51:50 -0800 (PST)
Message-ID: <20090202.235150.29713585.davem@davemloft.net>
References: <20090202141328.eaad3432.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:44093
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750884AbZBCHvz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Feb 2009 02:51:55 -0500
In-Reply-To: <20090202141328.eaad3432.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, s.hauer@pengutronix.de, Matt.Waddel@freescale.com, gerg@uclinux.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Feb 2009 14:13:28 +1100

> Today's linux-next merge of the net tree got a conflict in
> drivers/net/Kconfig between commit
> d4732d3c59b84bb093e11c8f755f32801b4bf86d ("m68knommu: add ColdFire M532x
> to the FEC configuration options") from Linus' tree and commit
> 196719ecec0c526de273dcb902f0be956a193232 ("fec: Add support for Freescale
> MX27") from the net tree.
> 
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix for a while.

I'll take care of this, thanks Stephen.
