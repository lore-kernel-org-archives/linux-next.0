From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the nfsd tree
Date: Tue, 9 Apr 2019 07:43:29 +1000
Message-ID: <20190409074329.26801b64@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9e/4N1PA4V9e9d4qymNxMLY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Murphy Zhou <jencce.kernel@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/9e/4N1PA4V9e9d4qymNxMLY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3c86794ac0e6 ("nfsd/nfsd3_proc_readdir: fix buffer count and page pointer=
s")

Fixes tag

  Fixes: f875a79 "nfsd: allow nfsv3 readdir request to be larger"

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").
  - Missing parentheses around the subject

--=20
Cheers,
Stephen Rothwell

--Sig_/9e/4N1PA4V9e9d4qymNxMLY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyrwIEACgkQAVBC80lX
0GwU0Qf9H6glBzH4VbccEdwi1wq4IHb9hE69dtBYsU2F6JgbiBOCrYWekKoAkCNu
Kn7XcXfKZhwmmtC+1JmgqkURf+BGCn+Fl3Gw4MSmpDEvQn2HP8cTC8dMD2P2AbKe
HngGZGtWlW58uDePlSybDMi5y+2Frqb/jsgjkOD3yKebD7Jfnsdnv/iGW+Eqs33e
3QODl2RFg1nG7DyX9nRiHiVNxs+Ih/DyNQ60Hq3bQzlT8iTc+Cpoq2AHYzTYB+Ug
a8t0J7WG+p9mbQJ9KaFwSXZbY8CuZYCEqyFokFiwmku7iRyqEElBxAjhfmkWp12n
65cGXcyy2Vab4m/T4rYGzREuVmK22g==
=DMCd
-----END PGP SIGNATURE-----

--Sig_/9e/4N1PA4V9e9d4qymNxMLY--
