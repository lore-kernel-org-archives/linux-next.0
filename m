From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the akpm tree
Date: Thu, 31 Jan 2019 10:59:37 +1100
Message-ID: <20190131105937.62023ef1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4/qwh/OMSLP_RdrmrC7MTMf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/4/qwh/OMSLP_RdrmrC7MTMf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In patch

  "include/linux/relay.h: fix percpu annotation in struct rchan"

Fixes tag

  Fixes: 017c59c04 ("relay: Use per CPU constructs for the relay channel bu=
ffer pointers")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/4/qwh/OMSLP_RdrmrC7MTMf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxSOmkACgkQAVBC80lX
0GyuBgf/YOlmDAPUXTrmbX0wj4VBDgQemZtMhCN3pDtxmnnBHnsIDRo8xLGCBuMY
dT4fxTr8JTBxfkDaL/kj95SsQNOI8EZ4s8kHChS0WZwTb8+MXgmCnirMwwXbNHTv
eRRsmNRpZ+FDznBambn6k39EAI9Qq1iF+NuXygGbvc/SZBxGwcakrb1a5wMCYZ/N
fYp83aMvG7m8QdtwUSpwP1jY52nzpALsGjPPXtaZxYYlwmqKhqPyB2uI2xTctMBd
YFAsqZ10EhMzh3jDsMy3fqe5gdVNIf6ksM1wY7IvWctGAJ2Vhzr1y6Do7leD3xJQ
WbdBBb2Y17+23lv/uaG9a4m/K5j4CQ==
=bZSZ
-----END PGP SIGNATURE-----

--Sig_/4/qwh/OMSLP_RdrmrC7MTMf--
