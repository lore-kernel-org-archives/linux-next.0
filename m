From: Ido Schimmel <idosch@idosch.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Fri, 22 Dec 2017 09:51:00 +0200
Message-ID: <20171222075100.GA4478@splinter>
References: <20171222114519.612087d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171222114519.612087d4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ido Schimmel <idosch@mellanox.com>, Eric Dumazet <edumazet@google.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Fri, Dec 22, 2017 at 11:45:19AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:

[...]

> I have added the following merge fix patch for today (I am guessing
> a bit here):
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 22 Dec 2017 11:25:13 +1100
> Subject: [PATCH] ipv6: fix up for "ipv6: Move dst->from into struct rt6_info"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  net/ipv6/route.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 4efaac956f0c..2490280b3394 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -4321,9 +4321,8 @@ static int inet6_rtm_getroute(struct sk_buff *in_skb, struct nlmsghdr *nlh,
>  		goto errout;
>  	}
>  
> -	if (fibmatch && rt->dst.from) {
> -		struct rt6_info *ort = container_of(rt->dst.from,
> -						    struct rt6_info, dst);
> +	if (fibmatch && rt->from) {
> +		struct rt6_info *ort = rt->from;

Your merge fix is correct. Thanks!

>  
>  		dst_hold(&ort->dst);
>  		ip6_rt_put(rt);
