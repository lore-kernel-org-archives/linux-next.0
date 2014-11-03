From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure in Linus' tree
Date: Sun, 02 Nov 2014 23:16:37 -0500 (EST)
Message-ID: <20141102.231637.506197393349958573.davem@davemloft.net>
References: <20141103150930.70a260c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:42495 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750935AbaKCEQl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 2 Nov 2014 23:16:41 -0500
In-Reply-To: <20141103150930.70a260c7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: torvalds@linux-foundation.org, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, pablo@netfilter.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 3 Nov 2014 15:09:30 +1100

> Hi Linus,
> 
> With Linus' tree, today's linux-next build (powerpc allyesconfig)
> failed like this:
> 
> net/bridge/netfilter/nft_reject_bridge.c: In function 'nft_reject_br_send_v6_unreach':
> net/bridge/netfilter/nft_reject_bridge.c:240:3: error: implicit declaration of function 'csum_ipv6_magic' [-Werror=implicit-function-declaration]
>    csum_ipv6_magic(&nip6h->saddr, &nip6h->daddr,
>    ^
> 
> Caused by commit 523b929d5446 ("netfilter: nft_reject_bridge: don't use
> IP stack to reject traffic") from Linus' tree.
> 
> I applied the following patch for today:

Yep, another person hit this today and submitted a patch too:

http://patchwork.ozlabs.org/patch/406003/

I'll get this into the net tree ASAP.
