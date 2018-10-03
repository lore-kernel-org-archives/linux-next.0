From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Wed, 3 Oct 2018 12:18:04 +1000
Message-ID: <20181003121804.689fdc08@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/V2B6/bIfgaVfl3eLXzZ7FVW"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Ahern <dsahern@gmail.com>, Christian Brauner <christian@brauner.io>
List-Id: linux-next.vger.kernel.org

--Sig_/V2B6/bIfgaVfl3eLXzZ7FVW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/core/rtnetlink.c

between commit:

  893626d6a353 ("rtnetlink: Fail dump if target netnsid is invalid")

from the net tree and commits:

  c383edc42403 ("rtnetlink: add rtnl_get_net_ns_capable()")
  7e4a8d5a93f6 ("rtnetlink: s/IFLA_IF_NETNSID/IFLA_TARGET_NETNSID/g")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/core/rtnetlink.c
index 7f37fe9c65a5,35162e1b06ad..000000000000
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@@ -1895,11 -1910,13 +1910,11 @@@ static int rtnl_dump_ifinfo(struct sk_b
 =20
  	if (nlmsg_parse(cb->nlh, hdrlen, tb, IFLA_MAX,
  			ifla_policy, NULL) >=3D 0) {
- 		if (tb[IFLA_IF_NETNSID]) {
- 			netnsid =3D nla_get_s32(tb[IFLA_IF_NETNSID]);
- 			tgt_net =3D get_target_net(skb->sk, netnsid);
+ 		if (tb[IFLA_TARGET_NETNSID]) {
+ 			netnsid =3D nla_get_s32(tb[IFLA_TARGET_NETNSID]);
+ 			tgt_net =3D rtnl_get_net_ns_capable(skb->sk, netnsid);
 -			if (IS_ERR(tgt_net)) {
 -				tgt_net =3D net;
 -				netnsid =3D -1;
 -			}
 +			if (IS_ERR(tgt_net))
 +				return PTR_ERR(tgt_net);
  		}
 =20
  		if (tb[IFLA_EXT_MASK])

--Sig_/V2B6/bIfgaVfl3eLXzZ7FVW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu0JtwACgkQAVBC80lX
0GzD6wf/e/ZFdNJeRV3wQHxLKUEu9DZcPQL2eSdv26+6HqGK9MZoI93Xx0mIVmLX
IG9NBCUR1BBbSMbGD2bxmv91T0k3ib+EnU6Lq8sbXDSKhoyGgRsPvA0882L7sJQu
o+PYJqA1gDap58VdarCpJd+pizLQ8/7GUEz18fbUSnDWy2tt+zqh3S/n6StCYijh
lt05lWYG0O3lyy5XXONItJH5UfRTLHGpuMfgrzBAyHKfQusEHi38zW3mJDG6SsS4
QCfQDOUicWdWsbWW3zajUmloeKr5zTYm79w4nqVHwIa+YXZclHvxhzSRrtteEIar
RL/WfJai7alBVpki9XM+PLZGrZCUGA==
=JSwx
-----END PGP SIGNATURE-----

--Sig_/V2B6/bIfgaVfl3eLXzZ7FVW--
