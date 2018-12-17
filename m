From: Ido Schimmel <idosch@mellanox.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 17 Dec 2018 10:03:16 +0000
Message-ID: <20181217100314.GA12765@splinter>
References: <20181217113106.32d98f30@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217113106.32d98f30@canb.auug.org.au>
Content-Language: en-US
Content-ID: <A1058BBAFD2F2C408E138972080919AD@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 17, 2018 at 11:31:06AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   net/ipv6/ip6_output.c
>=20
> between commit:
>=20
>   8203e2d844d3 ("net: clear skb->tstamp in forwarding paths")
>=20
> from the net tree and commit:
>=20
>   f839a6c92504 ("net: Do not route unicast IP packets twice")
>=20
> from the net-next tree.
>=20
> I fixed it up (I was not quite sure of the correct ordering - see below)
> and can carry the fix as necessary. This is now fixed as far as linux-nex=
t
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Looks good to me. Eric?

Thank you!
