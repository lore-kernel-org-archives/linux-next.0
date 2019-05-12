From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with Linus' tree
Date: Mon, 13 May 2019 09:47:46 +1000
Message-ID: <20190513094746.4c020232@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/b15HGX7Ma1.ciZb8hoh892_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Bogendoerfer <tbogendoerfer@suse.de>, Paul Burton <paul.burton@mips.com>
List-Id: linux-next.vger.kernel.org

--Sig_/b15HGX7Ma1.ciZb8hoh892_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  arch/mips/sgi-ip27/ip27-irq.c

between commit:

  e4952b0c2c03 ("MIPS: SGI-IP27: Fix use of unchecked pointer in shutdown_b=
ridge_irq")

from Linus' tree and commit:

  e6308b6d35ea ("MIPS: SGI-IP27: abstract chipset irq from bridge")

from the mips tree.

I fixed it up (the latter removed the code modified by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/b15HGX7Ma1.ciZb8hoh892_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzYsKIACgkQAVBC80lX
0GzEawgAoNys89jCYzgizAgVYHTvqXJawjvo4oTXRLQEUMuL0KW32eC3YZHVMk9t
McUaRASigaGjbD5+2RPq4RZhXxf6P8UkF7mBXdOF9GNwPKfAdM7HuwGuO37/yD6r
JoZnPvuFOC91GMFM3OO/qaqgARtgNoqLNRS/1IPNEd5sE0ytoFkP2lKui4WijVfG
Xe4AMs8OuDh+4FSXx82U35CcO7MIqF0DOjuP5JN4TcOtk1e4mRcweD/TN1QyjeDy
SewU80A7KM0y17aTTyye/GvKaPNaImi8sX07cpc1QeWgyfhxPe2l8yXwCls2VNsl
AebH3I9KZka61orel5USDteVD7yZqg==
=EXxE
-----END PGP SIGNATURE-----

--Sig_/b15HGX7Ma1.ciZb8hoh892_--
