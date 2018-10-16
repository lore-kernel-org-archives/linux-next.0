From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Wed, 17 Oct 2018 10:46:42 +1100
Message-ID: <20181017104642.40d37d05@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ig8Rxox_Ru14hlzWqD3VREN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Davide Caratti <dcaratti@redhat.com>, David Ahern <dsahern@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ig8Rxox_Ru14hlzWqD3VREN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/sched/cls_api.c

between commit:

  e331473fee3d ("net/sched: cls_api: add missing validation of netlink attr=
ibutes")

from the net tree and commit:

  dac9c9790e54 ("net: Add extack to nlmsg_parse")

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

diff --cc net/sched/cls_api.c
index 70f144ac5e1d,43c8559aca56..000000000000
--- a/net/sched/cls_api.c
+++ b/net/sched/cls_api.c
@@@ -1951,8 -2055,8 +2057,8 @@@ static int tc_dump_chain(struct sk_buf
  	if (nlmsg_len(cb->nlh) < sizeof(*tcm))
  		return skb->len;
 =20
 -	err =3D nlmsg_parse(cb->nlh, sizeof(*tcm), tca, TCA_MAX, NULL,
 +	err =3D nlmsg_parse(cb->nlh, sizeof(*tcm), tca, TCA_MAX, rtm_tca_policy,
- 			  NULL);
+ 			  cb->extack);
  	if (err)
  		return err;
 =20

--Sig_/ig8Rxox_Ru14hlzWqD3VREN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvGeGIACgkQAVBC80lX
0Gwipwf9FqVC/wokTOmwv2KJ3oSYm/q3NrEFLt43Ib5oyotPln8zMbGkbQ1DBzEI
VIqUTK6Sj2V98uCuUY9ABZ/CFCGPPn7aGb6nJ2+vOG4NTHHizK18z4TvY3QH7lSA
X9zrTeuI1NCsAm+xvq34EDL8BZ7jzwMwV5x7RE4aT8ZVeK/+z0gxWu1RR2GQ+L6A
hgonqUY/yfI8+ORBq72JGvdfQUbCR4L409uxKN731BYJZW/tgyXOrz3MTMwE3sa7
/iLnziESd4X//d5RugDA8Lha993FNLLU9mCczsqAOA6qaJSMs3C6KtT1kLNOWEpT
9w9hIy7XKLVqEE6Cv5IVLbm2HwOQCQ==
=R+Vg
-----END PGP SIGNATURE-----

--Sig_/ig8Rxox_Ru14hlzWqD3VREN--
