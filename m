From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
Date: Wed, 2 May 2018 13:22:37 +0300
Message-ID: <20180502102237.GG20375@mtr-leonro.local>
References: <20180501101017.517b38af@canb.auug.org.au>
 <1525136135.11756.94.camel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1525136135.11756.94.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Gunthorpe <jgg@mellanox.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhu Yanjun <yanjun.zhu@oracle.com>
List-Id: linux-next.vger.kernel.org


--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 30, 2018 at 08:55:35PM -0400, Doug Ledford wrote:
> On Tue, 2018-05-01 at 10:10 +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the rdma tree got a conflict in:
> >
> >   drivers/infiniband/sw/rxe/rxe_resp.c
> >
> > between commit:
> >
> >   9fd4350ba895 ("B/rxe: avoid double kfree_skb")
> >
> > from the rdma-fixes tree and commit:
> >
> >   2e47350789eb ("IB/rxe: optimize the function duplicate_request")
> >
> > from the rdma tree.
> >
> > I fixed it up (I think - see below) and can carry the fix as necessary.
> > This is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
>
> We will probably merge the for-rc branch into the for-next branch in the
> next few days, at which point we will do the conflict resolution
> ourselves and your need to carry anything should drop out.

Isn't "rdma/wip/for-testing" branch intended for this?

Thanks

>
> --
> Doug Ledford <dledford@redhat.com>
>     GPG KeyID: B826A3330E572FDD
>     Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD



--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlrpkWwACgkQ5GN7iDZy
WKf+0g/+MAcdJvrAyNJbZxCMzdVV/pyjSL1TKi0BaLXaT2PsM7YtSKeSVjkHacvN
ifGhNhPE9F/i/diOMuBE1TIVFIx7Qg+bRtRmy+Lwq2nJPRf6Rjldg6SYZh0voJPn
yv8uTUNQ0LjoY7CsN/NcHuyqMrnlkC5GhEQ7pLO5IFtpaGZ3Vw24u4GJKxv/cHFj
i0qdN1puGhCcp/IGCzrPwM7i6Z7DnnmdKaAhYANUg9t3VWGP3/lGOmKnTTvr1aEg
10uD8rgaHNTQ0a+8lmB4X/+uT0bH4TPjtIANQZ6055I2B+vDMS/EOrpId/F4MHCt
S0bLXbvaZRPLj4G8/u81okWphJLAWaLVms6tWmVyZAJ2snn1FI84ftjuASWtzsJ3
0POAaWZFp9YCah006PuknvEKomRnJM5X1tfc9hxpL2M9Ek3QQ25smd8NibnLPoA0
4kfSixPSh+9LXGEknUMBGJA4lS3z+v6NvwJqoRn54dPSeS2BVJe4RTzJxaIJnt6d
DEoNOW8MWwTQrq0Paf9lre9yMI8QtAdtEv5APNTP6y0lhzdZ8x5FQqzqcYbMAOGV
zESNcP8mBc8Js6Z7qDcEoRy/Pl6AHmuZr0W302zZSrZBYcwGC4NCZ5SS/jwtpaq+
eAc/xAUZ5QZLmNtPGYzKn0pBCUqv0M904t+uC9uBjVS+IvIPHe8=
=L170
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--
