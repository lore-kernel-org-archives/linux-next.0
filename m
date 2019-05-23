From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Fri, 24 May 2019 07:35:14 +1000
Message-ID: <20190524073514.3268aca5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kRdE4Ta3LViRT=kTfWkTf8n"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Raju Rangoju <rajur@chelsio.com>
List-Id: linux-next.vger.kernel.org

--Sig_/kRdE4Ta3LViRT=kTfWkTf8n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b5730061d105 ("cxgb4: offload VLAN flows regardless of VLAN ethtype")

Fixes tag

  Fixes: ad9af3e09c (cxgb4: add tc flower match support for vlan)

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/kRdE4Ta3LViRT=kTfWkTf8n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlznEhIACgkQAVBC80lX
0GzI1wgAnQDk1wDw/CMHmhlyRTVeKRVfbq7l6LGUlVa5L1RgFYXtsb1QhUt+xJ+z
nxgKtp65pcbZ0SI7PBVTnVa08mCxxeomsW0ghb8aOTu4YCq/Ovvay+QDvX6HDk4g
sZUdqrsbm2/bHypyT1/h/RkLv3TCzWLrYtsUNV5OhQloSiuLm0TljDwU6YcWWbnO
mrcqE9V6khYYKCKvf2SzCJc6VLzxjH+LcKecLKGUSNG9ow+xOlRAYmDwVYjE6k3c
ufO9BSUPQtjuqRcezkxib9Ms8MQSlaJQjA8VchHgc5UNjxcJ6Mh96iKtf4IP5/k8
Hc/b9Mi7tNuUFyXYsB+xyn8Xprenqg==
=/gOf
-----END PGP SIGNATURE-----

--Sig_/kRdE4Ta3LViRT=kTfWkTf8n--
