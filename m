From: Paul McKenney <paulmckrcu@gmail.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Thu, 19 Jan 2017 13:54:37 -0800
Message-ID: <CAJzB8QEdnVG8Gy-WOSu1pWTtkeVWgBzZvGCu0nobW3M-hBhpkw@mail.gmail.com>
References: <20170119143445.6b65dc8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yb0-f195.google.com ([209.85.213.195]:35572 "EHLO
        mail-yb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751349AbdASV6F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Jan 2017 16:58:05 -0500
In-Reply-To: <20170119143445.6b65dc8b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ursula Braun <ubraun@linux.vnet.ibm.com>

On Wed, Jan 18, 2017 at 7:34 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> net/smc/af_smc.c:102:16: error: 'SLAB_DESTROY_BY_RCU' undeclared here (not in a function)
>   .slab_flags = SLAB_DESTROY_BY_RCU,
>                 ^
>
> Caused by commit
>
>   c7a545924ca1 ("mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU")
>
> interacting with commit
>
>   ac7138746e14 ("smc: establish new socket family")
>
> from the net-next tree.
>
> I have applied the following merge fix patch (someone will need to
> remember to mention this to Linus):

Thank you, Stephen!  I expect that there might be a bit more
bikeshedding on the name, but here is hoping...  :-/

                                                      Thanx, Paul

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 19 Jan 2017 14:29:12 +1100
> Subject: [PATCH] smc: merge fix for "mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  net/smc/af_smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/smc/af_smc.c b/net/smc/af_smc.c
> index 4875e65f0c4a..a48260f9ebb7 100644
> --- a/net/smc/af_smc.c
> +++ b/net/smc/af_smc.c
> @@ -99,7 +99,7 @@ struct proto smc_proto = {
>         .unhash         = smc_unhash_sk,
>         .obj_size       = sizeof(struct smc_sock),
>         .h.smc_hash     = &smc_v4_hashinfo,
> -       .slab_flags     = SLAB_DESTROY_BY_RCU,
> +       .slab_flags     = SLAB_TYPESAFE_BY_RCU,
>  };
>  EXPORT_SYMBOL_GPL(smc_proto);
>
> --
> 2.10.2
>
> --
> Cheers,
> Stephen Rothwell
