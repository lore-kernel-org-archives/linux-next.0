From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the s390
 tree
Date: Wed, 24 Apr 2019 18:23:28 +1000
Message-ID: <20190424182200.71f5975d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//Ng1Kao81O8Yg=kz9KX.ul2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_//Ng1Kao81O8Yg=kz9KX.ul2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/s390/mm/gup.c

between commit:

  1a42010cdc26 ("s390/mm: convert to the generic get_user_pages_fast code")

from the s390 tree and commit:

  0dbe0ed39fa1 ("mm/gup: change GUP fast to use flags rather than a write '=
bool'")

from the akpm-current tree.

I fixed it up (the former removed the file, so I just did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_//Ng1Kao81O8Yg=kz9KX.ul2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzAHQAACgkQAVBC80lX
0GzA2wf/Zh2NqX9iOuM+7KN5LbFP+xsUxgj96y70YPJoxEnavdVmho8sdBIzrxZE
Y1e9MypZ9lUwkRDmd8M1x4sKNuHfSdEOcjq4hLAYjikY+AGPjdZJJ8e+TNexj4S8
oZrkwE0fN0ZLgyOjVFJBe7yrRE5N1qUKBYeGNXXqLtKqhYpbhm27oDqU62jNG5AE
+uRYLlZk6Py5BbmyTGYYCpYSW4xrssbfCRwB/nQvXWR/Rf5kAnLChMJrqnKQoTL8
kgUL3IcL8QGIB7ppJXF7xKMpSuk4TT4TKX8YvW5DfJN4+NsM2OO86BuypIFtvvbM
6YAM4HdWk0UvasvsfUzXAh29YyLCgg==
=K+Tm
-----END PGP SIGNATURE-----

--Sig_//Ng1Kao81O8Yg=kz9KX.ul2--
