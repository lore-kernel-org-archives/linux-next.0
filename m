From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drivers-x86 tree with the tip tree
Date: Mon, 8 Oct 2018 14:48:38 +1100
Message-ID: <20181008144838.60d8ad83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/M7VLhcGUxPcnz2GqlmFUqhf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/M7VLhcGUxPcnz2GqlmFUqhf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/platform/x86/intel_mid_powerbtn.c

between commit:

  f2c4db1bd807 ("x86/cpu: Sanitize FAM6_ATOM naming")

from the tip tree and commit:

  a8b60e484f3d ("platform/x86: intel_mid_powerbtn: Get rid of custom ICPU()=
 macro")

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

diff --cc drivers/platform/x86/intel_mid_powerbtn.c
index 5ad44204a9c3,a8c0fbb7f799..000000000000
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@@ -121,12 -112,9 +112,9 @@@ static const struct mid_pb_ddata mrfld_
  	.setup	=3D mrfld_setup,
  };
 =20
- #define ICPU(model, ddata)	\
- 	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (kernel_ulong_t)&ddata }
-=20
  static const struct x86_cpu_id mid_pb_cpu_ids[] =3D {
- 	ICPU(INTEL_FAM6_ATOM_SALTWELL_MID,		mfld_ddata),
- 	ICPU(INTEL_FAM6_ATOM_SILVERMONT_MID,	mrfld_ddata),
 -	INTEL_CPU_FAM6(ATOM_PENWELL,		mfld_ddata),
 -	INTEL_CPU_FAM6(ATOM_MERRIFIELD,		mrfld_ddata),
++	INTEL_CPU_FAM6(ATOM_SALTWELL_MID,	mfld_ddata),
++	INTEL_CPU_FAM6(ATOM_SILVERMONT_MID,	mrfld_ddata),
  	{}
  };
 =20

--Sig_/M7VLhcGUxPcnz2GqlmFUqhf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu605YACgkQAVBC80lX
0Gy/ywf+JPsYvBPso7IaaUdSTrQmYtjcFcCJVpPZJKuqG9JLGQzOUhbGzDb9eoNi
RaXTmLFVfKZk/P6WoXMEpHTl3hegI7Yd2JXTrbjLR49nOly/fDuF5lsb9hQS0FYX
ZLTYd6Gjo4r6NvTsvui+dBib1cYrXzIyEIBSeqrbig0IMsBN/0BU6igPQtmJGwFc
9r17zCiU6qfUPhmckRQMp9NWretboihD4qIKVgU4sIaTOi3M10K4ueJbrcv2UZw6
Jc+yNGWHu5PhomlTeSox7n01DczYM5N6jZTAP4Ual8bTlv6SSp8zsZ5yuV1Pdmik
EnqUpWPvAGm8lJCqM9GaGB5du1c1nw==
=lCkY
-----END PGP SIGNATURE-----

--Sig_/M7VLhcGUxPcnz2GqlmFUqhf--
