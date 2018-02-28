From: Petr Machata <petrm@mellanox.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Wed, 28 Feb 2018 11:46:44 +0200
Message-ID: <wihsh9lmoor.fsf@dev-r-vrt-156.mtr.labs.mlnx>
References: <20180228095628.4a2f35c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228095628.4a2f35c2@canb.auug.org.au> (Stephen Rothwell's
        message of "Wed, 28 Feb 2018 09:56:28 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Winter <Thomas.Winter@alliedtelesis.co.nz>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Today's linux-next merge of the net-next tree got a conflict in:
>
>   net/ipv4/ip_tunnel.c
>
> between commit:
>
>   4e994776e7bd ("ip_tunnel: Do not use mark in skb by default")
>
> from the net tree and commit:
>
>   b0066da52ea5 ("ip_tunnel: Rename & publish init_tunnel_flow")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Looks good, thanks!

Petr
