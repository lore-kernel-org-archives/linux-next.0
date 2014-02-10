From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the rcu tree
Date: Mon, 10 Feb 2014 15:00:47 +1100
Message-ID: <20140210150047.65f06219ffa970ad34d27d7f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__10_Feb_2014_15_00_47_+1100_yhk/QmDt_I=ZxPFu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Rientjes <rientjes@google.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__10_Feb_2014_15_00_47_+1100_yhk/QmDt_I=ZxPFu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
mm/slub.c between commit f4e40a71719d ("slub: Fix add_full() lockdep
checks") from the rcu tree and commit aee03fe7a7c8 ("mm/slub.c: list_lock
may not be held in some circumstances") from the akpm-current tree.

These patches try to achieve the same thing, so I arbitrarily chose the
version from the akpm-current tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__10_Feb_2014_15_00_47_+1100_yhk/QmDt_I=ZxPFu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJS+E70AAoJEMDTa8Ir7ZwVmsQQAJDGCpgFb4ASh1Cm2mImXygK
SoZU4ylFnARZDYl54Wp3HZl0LVwOexSdzYbBIH9UtdBK+n27nFWOZDeixW478xnK
6X+bRM23qWXFh7r1tI7Yh0fEfuY5kOJOHQkEjDkFeTU5GkhdB4iraLO6SxN7/DYi
jqc4jIGL6BJ83igTg3t5OX+bvnfgKox7u5twUcZM7f2i04ERJL59oroVsKctrfg7
nYUsn9jehGTT/zPGpeLgKFz5TKInBH8X4MY3EYHOED7p73nYfnuCE5zciZDF8Ff3
Q+cQNYVWWxDS1gPxT76gz8axqO4GPE2f4UAThbJeeJykWxJ2IvPq45GMZjtT5cYW
nxGv1wA8ZyV1qcfhV3Xjy0Cibgmtc8DBU8aGiJ+maVA7VLOxhtwtjdvY5Sf5cdPt
xkq5REh7Gnjd2zHPfBdt9Cq/ync0HMxSlVyZ7n/PDZUwELO+wo/KxvM5VlA+fxC6
SVgAL1+DjefIGXYXaLCAH5sdIrcTFIxenOqIQXcm7kGDa1E7ULbYlZcK71AhIH8G
YUx+JprK2/ejwsuVKE14l927ixIbjC35FvGK4C8zWHceQCrPo7d3chNlcHnzKgWa
OEhw2uDCVbzn87hwslHooADuuOUkA3n/y0hkArLpZiITgx31x+/ycQJq7UQEo38O
I4TLOavstNsPUxbVfPiJ
=n02h
-----END PGP SIGNATURE-----

--Signature=_Mon__10_Feb_2014_15_00_47_+1100_yhk/QmDt_I=ZxPFu--
