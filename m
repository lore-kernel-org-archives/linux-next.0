From: David Miller <davem@davemloft.net>
Subject: Re: net: fix typo in freescale/ucc_geth.c
Date: Tue, 09 Oct 2012 00:21:51 -0400 (EDT)
Message-ID: <20121009.002151.1744939534508464049.davem@davemloft.net>
References: <20121008173653.1d17895964980c98af59c8ea@canb.auug.org.au>
	<23452.1349740345@neuling.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:33251 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799Ab2JIEVx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Oct 2012 00:21:53 -0400
In-Reply-To: <23452.1349740345@neuling.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mikey@neuling.org
Cc: edumazet@google.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, mbizon@freebox.fr, linuxppc-dev@ozlabs.org

From: Michael Neuling <mikey@neuling.org>
Date: Tue, 09 Oct 2012 10:52:25 +1100

> The following patch: 
>   acb600d net: remove skb recycling
> added dev_free_skb() to drivers/net/ethernet/freescale/ucc_geth.c
> 
> This is a typo and should be dev_kfree_skb().  This fixes this.
> 
> Signed-off-by: Michael Neuling <mikey@neuling.org>

Applied, thanks a lot.
