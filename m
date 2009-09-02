From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with Linus' tree
Date: Wed, 02 Sep 2009 00:33:39 -0700 (PDT)
Message-ID: <20090902.003339.204452262.davem@davemloft.net>
References: <20090902133758.f96cac22.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:41730
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755907AbZIBHdZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2009 03:33:25 -0400
In-Reply-To: <20090902133758.f96cac22.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, shemminger@vyatta.com, roel.kluin@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 2 Sep 2009 13:37:58 +1000

> Today's linux-next merge of the net tree got a conflict in
> drivers/net/yellowfin.c between commit
> e7a5965a81a29a13cd4994fa23a6a7a1488bcdb6 ("yellowfin: Fix buffer underrun
> after dev_alloc_skb() failure") from Linus' tree and commit
> 61357325f377889a1daffa14962d705dc814dd0e ("netdev: convert bulk of
> drivers to netdev_tx_t") from the net tree.
> 
> Just context changes.  I fixed it up (see below) and will carry the fix
> for a while.

I just merged net-2.6 into net-next-2.6 to clear this up for you.
