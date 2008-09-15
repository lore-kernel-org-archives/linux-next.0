From: Simon Horman <horms@verge.net.au>
Subject: Re: linux-next: net tree build failure
Date: Mon, 15 Sep 2008 10:54:53 +1000
Message-ID: <20080915005453.GA6714@verge.net.au>
References: <20080913150326.245fbb6f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60931 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751044AbYIOAy4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 14 Sep 2008 20:54:56 -0400
Content-Disposition: inline
In-Reply-To: <20080913150326.245fbb6f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Julius Volz <juliusv@google.com>

On Sat, Sep 13, 2008 at 03:03:26PM +1000, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> net/ipv4/ipvs/ip_vs_proto_tcp.c: In function 'tcp_snat_handler':
> net/ipv4/ipvs/ip_vs_proto_tcp.c:208: error: implicit declaration of function 'csum_ipv6_magic'
> net/ipv4/ipvs/ip_vs_proto_udp.c: In function 'udp_snat_handler':
> net/ipv4/ipvs/ip_vs_proto_udp.c:219: error: implicit declaration of function 'csum_ipv6_magic'
> 
> Introduced by commit 0bbdd42b7efa66685b6d74701bcde3a596a3a59d ("IPVS:
> Extend protocol DNAT/SNAT and state handlers") which added a call to
> csum_ipv6_magic but didn't include net/ip6_checksum.h.  I applied the
> following patch.

Hi Stephen, Hi Dave, Hi all,

sorry for letting that one slip through.

I am wondering if it is appropriate to wrap these includes
in #ifdef CONFIG_IP_VS_IPV6, as csum_ipv6_magic() should only
be used in that case.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Sat, 13 Sep 2008 14:37:04 +1000
> Subject: [PATCH] net: ip_vs_proto_tcp build fix
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  net/ipv4/ipvs/ip_vs_proto_tcp.c |    1 +
>  net/ipv4/ipvs/ip_vs_proto_udp.c |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/net/ipv4/ipvs/ip_vs_proto_tcp.c b/net/ipv4/ipvs/ip_vs_proto_tcp.c
> index 537f616..dd4566e 100644
> --- a/net/ipv4/ipvs/ip_vs_proto_tcp.c
> +++ b/net/ipv4/ipvs/ip_vs_proto_tcp.c
> @@ -18,6 +18,7 @@
>  #include <linux/tcp.h>                  /* for tcphdr */
>  #include <net/ip.h>
>  #include <net/tcp.h>                    /* for csum_tcpudp_magic */
> +#include <net/ip6_checksum.h>
>  #include <linux/netfilter.h>
>  #include <linux/netfilter_ipv4.h>
>  
> diff --git a/net/ipv4/ipvs/ip_vs_proto_udp.c b/net/ipv4/ipvs/ip_vs_proto_udp.c
> index e3ee26b..6eb6039 100644
> --- a/net/ipv4/ipvs/ip_vs_proto_udp.c
> +++ b/net/ipv4/ipvs/ip_vs_proto_udp.c
> @@ -22,6 +22,7 @@
>  
>  #include <net/ip_vs.h>
>  #include <net/ip.h>
> +#include <net/ip6_checksum.h>
>  
>  static struct ip_vs_conn *
>  udp_conn_in_get(int af, const struct sk_buff *skb, struct ip_vs_protocol *pp,
> -- 
> 1.5.6.3

-- 
Simon Horman
  VA Linux Systems Japan K.K., Sydney, Australia Satellite Office
  H: www.vergenet.net/~horms/             W: www.valinux.co.jp/en
