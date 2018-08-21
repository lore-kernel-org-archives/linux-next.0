From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xarray tree with the nvdimm tree
Date: Tue, 21 Aug 2018 11:49:24 +1000
Message-ID: <20180821114924.0133d568@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YYriHAKQDnmippWqdOewGUj"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>, Dan Williams <dan.j.williams@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/YYriHAKQDnmippWqdOewGUj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

Today's linux-next merge of the xarray tree got a conflict in:

  mm/memory-failure.c

between commit:

  6100e34b2526 ("mm, memory_failure: Teach memory_failure() about dev_pagem=
ap pages")

from the nvdimm tree and commit:

  0c2b437d7e2b ("mm, memory_failure: Teach memory_failure() about dev_pagem=
ap pages")

from the xarray tree.

I fixed it up (the former looks like an updated version (after Linus'
"review", so I used that version) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I guess the xarray tree needs to be rebased on the changes in the
nvdimm tree.  :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/YYriHAKQDnmippWqdOewGUj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt7b6QACgkQAVBC80lX
0GwrPQf9GHnKNn9uuagOUzpUZWyAEOty6hY7/m2HCmZEYLDL5hMf87KkR5UYORLp
xesgfVLG35bsksbNtr2WP085sFvWJvwQIW4lVo+TB6D4thUK6M2ywGYTEprFUk15
Xp7S7VtyCw+qE1OVuOE7wHoYBM4i0PzHEkaE9Vm9TPh4uEiX+jzuPcAumJ+k+1e/
XZ4P1v4ZXTbgZYkTLDhI1rcTkG2IDxmHEPT7y2SE6EQXd1Gk/g4uXlzt/4gMeajT
62yyfqqeDWWvKXVCzox6etpKi6cVXt8Bt87yu3hjzKF6yF45mPcCVsXW8LeX35OO
N9dXuD+DuSTLKqnllclQdkyxHHH2JQ==
=oUTT
-----END PGP SIGNATURE-----

--Sig_/YYriHAKQDnmippWqdOewGUj--
