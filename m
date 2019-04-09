From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the rdma tree
Date: Wed, 10 Apr 2019 07:22:43 +1000
Message-ID: <20190410072243.085d9811@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/a1yXBXPTbE0Rmg0fjFH97Q="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shiraz Saleem <shiraz.saleem@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/a1yXBXPTbE0Rmg0fjFH97Q=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b5efc447c650 ("RDMA/umem: Use correct value for SG entries in sg_copy_to_=
buffer()")

Fixes tag

  Fixes: a4ca56b2b416 ("RDMA/umem: Combine contiguous PAGE_SIZE regions in =
SGEs")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: d10bcf947a3e ("RDMA/umem: Combine contiguous PAGE_SIZE regions in SG=
Es")

--=20
Cheers,
Stephen Rothwell

--Sig_/a1yXBXPTbE0Rmg0fjFH97Q=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlytDSMACgkQAVBC80lX
0Gx/Zwf/eiuiRjzriGtVJaBBa/RTA9uWMMnD5wQ8F4e1H024QY4bwl3yP432Wb4y
63UAAHSHK6CFgj2j/RVwrNDXu7XfGR/yDiCHofnCaTBdNNZYvB6CzfRBJ1dU77BI
U+ib66Io9RVKVLgAk0EAPJeCI9UhQ0IqLaHdtgAO6b2u+3CQLxl6cG3Jhoi8B8db
LkymLjzhGBVcKJIFHn1mrWS9VgjZiERJawJkiud56udU7U+QfEaeWGGFdJhh8oYP
zh8pf1Ct0hZMdSjQHhvrIyxEeJ7KgL9vcpfZHXSi9ougKpPqZp+tIjnSqOxqDlwV
vjp8jzlFb38xdPLDhx9K98wOvKoXnw==
=tnql
-----END PGP SIGNATURE-----

--Sig_/a1yXBXPTbE0Rmg0fjFH97Q=--
