From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drivers-x86 tree with the tip tree
Date: Mon, 8 Oct 2018 14:44:38 +1100
Message-ID: <20181008144438.53e6fdbc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xWjeFjFzezcq6RJ_i3hsvmy"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/xWjeFjFzezcq6RJ_i3hsvmy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/platform/x86/intel_int0002_vgpio.c

between commit:

  f2c4db1bd807 ("x86/cpu: Sanitize FAM6_ATOM naming")

from the tip tree and commit:

  96402de65afc ("platform/x86: intel_int0002_vgpio: Enable the driver on Ba=
y Trail platforms")

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

diff --cc drivers/platform/x86/intel_int0002_vgpio.c
index e89ad4964dc1,c958a628c375..000000000000
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@@ -57,11 -54,7 +54,7 @@@
  #define ICPU(model)	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
 =20
  static const struct x86_cpu_id int0002_cpu_ids[] =3D {
- /*
-  * Limit ourselves to Cherry Trail for now, until testing shows we
-  * need to handle the INT0002 device on Baytrail too.
-  *	ICPU(INTEL_FAM6_ATOM_SILVERMONT),	 * Valleyview, Bay Trail *
-  */
 -	ICPU(INTEL_FAM6_ATOM_SILVERMONT1),	/* Valleyview, Bay Trail  */
++	ICPU(INTEL_FAM6_ATOM_SILVERMONT),	/* Valleyview, Bay Trail  */
  	ICPU(INTEL_FAM6_ATOM_AIRMONT),		/* Braswell, Cherry Trail */
  	{}
  };

--Sig_/xWjeFjFzezcq6RJ_i3hsvmy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu60qYACgkQAVBC80lX
0GwXTQf+KsBeoNmofEXdKDBsLT5FmLAcbGD1DDEHcCNpMhRLL9QeaTnqGgXr4Om/
s1/pZTcbuV7u6+YcDqWJAfw2WGdyhl7Dkm4/7cSkEN9vQUv6CCv5QDfnuMIRrA04
6x/q+1uhHES5cr5y9rWGfjFs/ettMJY301f3w2HP+2IzvF1lF0uTblpXB4iprcWF
HiIkxZ5TAxmCqXoSNSuMqViUfyu8wQ4S2AHOcCF8fbvMdbmdgMnuA9w6p9+kjWzC
do6jBqzYQ4UBn2qddMDuuAnh2mb8YsKbH/FbnlTcRz3GMxQHJdtD0ww1vydfHG8k
qmiPfpaXViQCqwVZqL3czT4XeVzbpA==
=TPBv
-----END PGP SIGNATURE-----

--Sig_/xWjeFjFzezcq6RJ_i3hsvmy--
