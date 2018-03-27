From: Petr Machata <petrm@mellanox.com>
Subject: Re: linux-next: manual merge of the ipsec tree with the net tree
Date: Tue, 27 Mar 2018 17:33:43 +0300
Message-ID: <wih7epx8u60.fsf@dev-r-vrt-156.mtr.labs.mlnx>
References: <20180326091610.148fc62d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180326091610.148fc62d@canb.auug.org.au> (Stephen Rothwell's
        message of "Mon, 26 Mar 2018 09:16:10 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefano Brivio <sbrivio@redhat.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Steffen,
>
> Today's linux-next merge of the ipsec tree got a conflict in:
>
>   net/ipv4/ip_tunnel.c
>
> between commit:
>
>   f6cc9c054e77 ("ip_tunnel: Emit events for post-register MTU changes")
>
> from the net tree and commit:
>
>   24fc79798b8d ("ip_tunnel: Clamp MTU to bounds on new link")
>
> from the ipsec tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hi, this conflict needs to be resolved differently. Below I'm adding a
patch on top of linux-next. Squash or apply as you see fit.

What's the right way to proceed from here? It looks to me like Stefano
or Steffen should take this into the ipsec tree (possibly just squash to
the clamping fix), as they'll hit this conflict the next time they
rebase on top of net...? Let me know what to do, please.

Thanks,
Petr

>From 2c2210e59cd94571ac67d491026d6ea0f4d69ae4 Mon Sep 17 00:00:00 2001
Message-Id: <2c2210e59cd94571ac67d491026d6ea0f4d69ae4.1522155963.git.petrm@mellanox.com>
From: Petr Machata <petrm@mellanox.com>
Date: Tue, 27 Mar 2018 16:00:38 +0300
Subject: [PATCH linux-next] net: ip_tunnel: Call dev_set_mtu to set
 clamped MTU

When adding a new IP tunnel link, MTU is clamped to sane bounds.
However, since the new MTU value is directly assigned to the netdevice,
instead of going through dev_set_mtu, the change is done without sending
the usual NETDEV_PRECHANGEMTU and NETDEV_CHANGEMTU events. Thus drivers
don't get to learn about the clamped MTU value.

Signed-off-by: Petr Machata <petrm@mellanox.com>
---
 net/ipv4/ip_tunnel.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index a57cf0d..de6d944 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -1108,14 +1108,14 @@ int ip_tunnel_newlink(struct net_device *dev, struct nlattr *tb[],
 	if (tb[IFLA_MTU]) {
 		unsigned int max = 0xfff8 - dev->hard_header_len - nt->hlen;
 
-		dev->mtu = clamp(dev->mtu, (unsigned int)ETH_MIN_MTU,
-				 (unsigned int)(max - sizeof(struct iphdr)));
-	} else {
-		err = dev_set_mtu(dev, mtu);
-		if (err)
-			goto err_dev_set_mtu;
+		mtu = clamp(dev->mtu, (unsigned int)ETH_MIN_MTU,
+			    (unsigned int)(max - sizeof(struct iphdr)));
 	}
 
+	err = dev_set_mtu(dev, mtu);
+	if (err)
+		goto err_dev_set_mtu;
+
 	ip_tunnel_add(itn, nt);
 	return 0;
 
-- 
2.4.11
