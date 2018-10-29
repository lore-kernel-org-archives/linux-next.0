From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drivers-x86 tree with Linus' tree
Date: Mon, 29 Oct 2018 14:29:07 +1100
Message-ID: <20181029142907.54af8715@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Z70_.MwEBWKiMq+VPT.I5xX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Z70_.MwEBWKiMq+VPT.I5xX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/platform/x86/intel_telemetry_debugfs.c

between commit:

  f2c4db1bd807 ("x86/cpu: Sanitize FAM6_ATOM naming")

from Linus' tree and commit:

  1a7938a632ce ("platform/x86: intel_telemetry: Get rid of custom macro")

from the drivers-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/platform/x86/intel_telemetry_debugfs.c
index cee08f236292,30988e31c713..000000000000
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@@ -319,8 -308,8 +308,8 @@@ static struct telemetry_debugfs_conf te
  };
 =20
  static const struct x86_cpu_id telemetry_debugfs_cpu_ids[] =3D {
- 	TELEM_DEBUGFS_CPU(INTEL_FAM6_ATOM_GOLDMONT, telem_apl_debugfs_conf),
- 	TELEM_DEBUGFS_CPU(INTEL_FAM6_ATOM_GOLDMONT_PLUS, telem_apl_debugfs_conf),
+ 	INTEL_CPU_FAM6(ATOM_GOLDMONT, telem_apl_debugfs_conf),
 -	INTEL_CPU_FAM6(ATOM_GEMINI_LAKE, telem_apl_debugfs_conf),
++	INTEL_CPU_FAM6(ATOM_GOLDMONT_PLUS, telem_apl_debugfs_conf),
  	{}
  };
 =20

--Sig_/Z70_.MwEBWKiMq+VPT.I5xX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvWfoMACgkQAVBC80lX
0GyGFwgAm4/uf6yaHxuA5bCMWjTt9NQIImmssHqyY2cr2IQY3GY3+0/AVeQAGsxj
9fDAnQlOktEflmWLa4zdaiw4Wb4dtNvqPIRoSKgtjFTjuBbT1cWfx5PpWZ7QhnfF
7vNY43lMzxkhZu+1dXHgENtn2ZnmEYc+jcpVu2PUJxDIq9ODi5b4NUBdvC0kPsl7
pC9a3MCzegAzMrQFYBJEtRMgnkGQyEeCbt1zDqE4PKXqf5RMBxVd+OdOKCkswUAG
mkeGfHbn/HAKleFE0pZN6oXHVeQpuqQkp1Vu0R0ex2saXawYecGv0NmkaMumwIj+
KN4ia4Gqnm8PE+RtElKLQ8dHq4pZtg==
=0YUy
-----END PGP SIGNATURE-----

--Sig_/Z70_.MwEBWKiMq+VPT.I5xX--
