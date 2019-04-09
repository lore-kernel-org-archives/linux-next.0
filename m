From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the printk tree with Linus' tree
Date: Wed, 10 Apr 2019 09:34:29 +1000
Message-ID: <20190410093429.095c8975@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gimwf1eMZvYjGfuTZl5Qt=f"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mike Rapoport <rppt@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/gimwf1eMZvYjGfuTZl5Qt=f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the printk tree got a conflict in:

  mm/memblock.c

between commit:

  26fb3dae0a1e ("memblock: drop memblock_alloc_*_nopanic() variants")

from Linus' tree and commit:

  d75f773c86a2 ("treewide: Switch printk users from %pf and %pF to %ps and =
%pS, respectively")

from the printk tree.

I fixed it up (the former removed the code changed by part of the latter)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/gimwf1eMZvYjGfuTZl5Qt=f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlytLAUACgkQAVBC80lX
0GyOrQgAgdKkTUNGAVzqQ6hevkkvY1uLF915JniPe35gp0n+OKEWPX1LY/R2fxPj
Hq/esVJnuwz3Sx/hP7aajNUed0TUPw5xtvCsHf695HizP+iqGd/vhfiAwAdkV3IZ
XkqUGJD90tddcZXpjAPHiViUm74rGrmZpah900eg9aoNqIQ0MoxQEYbWYQ3wrVoa
kKK5yZCLdX8vBKmnA8LN6udU1ijA11tdpMjGXaBWJX1Yt6C57MW028MjnHPHXSNd
gsHt+Ymx9DQbJiHc+kSCsh4ngV6H/Nqay2hacR9EyLb2vfljKNyxPz90yyJr1IK6
cbdjr4bsRiOXe2YqKSamx5znc53H/w==
=v2mZ
-----END PGP SIGNATURE-----

--Sig_/gimwf1eMZvYjGfuTZl5Qt=f--
