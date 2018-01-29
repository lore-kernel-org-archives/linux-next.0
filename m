From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Sun, 28 Jan 2018 21:09:55 -0500 (EST)
Message-ID: <20180128.210955.673000738679459704.davem@davemloft.net>
References: <20180129125028.75774df6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:57122 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750771AbeA2CKF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 28 Jan 2018 21:10:05 -0500
In-Reply-To: <20180129125028.75774df6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ktkhai@virtuozzo.com, ddstreet@ieee.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Jan 2018 12:50:28 +1100

> I have applied the following merge fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 29 Jan 2018 12:34:37 +1100
> Subject: [PATCH] net: fixup for "net: tcp: close sock if net namespace is exiting"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/net/net_namespace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
> index 235105afa5e1..f306b2aa15a4 100644
> --- a/include/net/net_namespace.h
> +++ b/include/net/net_namespace.h
> @@ -225,7 +225,7 @@ int net_eq(const struct net *net1, const struct net *net2)
>  
>  static inline int check_net(const struct net *net)
>  {
> -	return atomic_read(&net->count) != 0;
> +	return refcount_read(&net->count) != 0;
>  }
>  
>  void net_drop_ns(void *);

Yep, this is perfect.
