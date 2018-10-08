From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pm tree
Date: Mon, 8 Oct 2018 13:44:49 +1100
Message-ID: <20181008134449.64aad97e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bNRy8ryxcqLmcoGqvlETGhp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bNRy8ryxcqLmcoGqvlETGhp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/powercap/intel_rapl.c

between commit:

  17ed15183c24 ("powercap: RAPL: Get rid of custom RAPL_CPU() macro")

from the pm tree and commit:

  f2c4db1bd807 ("x86/cpu: Sanitize FAM6_ATOM naming")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/powercap/intel_rapl.c
index bb92874b1175,8cbfcce57a06..000000000000
--- a/drivers/powercap/intel_rapl.c
+++ b/drivers/powercap/intel_rapl.c
@@@ -1133,40 -1133,47 +1133,40 @@@ static const struct rapl_defaults rapl_
  	.compute_time_window =3D rapl_compute_time_window_atom,
  };
 =20
 -#define RAPL_CPU(_model, _ops) {			\
 -		.vendor =3D X86_VENDOR_INTEL,		\
 -		.family =3D 6,				\
 -		.model =3D _model,			\
 -		.driver_data =3D (kernel_ulong_t)&_ops,	\
 -		}
 -
  static const struct x86_cpu_id rapl_ids[] __initconst =3D {
 -	RAPL_CPU(INTEL_FAM6_SANDYBRIDGE,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_SANDYBRIDGE_X,	rapl_defaults_core),
 -
 -	RAPL_CPU(INTEL_FAM6_IVYBRIDGE,		rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_IVYBRIDGE_X,	rapl_defaults_core),
 -
 -	RAPL_CPU(INTEL_FAM6_HASWELL_CORE,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_HASWELL_ULT,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_HASWELL_GT3E,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_HASWELL_X,		rapl_defaults_hsw_server),
 -
 -	RAPL_CPU(INTEL_FAM6_BROADWELL_CORE,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_BROADWELL_GT3E,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_BROADWELL_XEON_D,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_BROADWELL_X,	rapl_defaults_hsw_server),
 -
 -	RAPL_CPU(INTEL_FAM6_SKYLAKE_DESKTOP,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_SKYLAKE_MOBILE,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_SKYLAKE_X,		rapl_defaults_hsw_server),
 -	RAPL_CPU(INTEL_FAM6_KABYLAKE_MOBILE,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_KABYLAKE_DESKTOP,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_CANNONLAKE_MOBILE,	rapl_defaults_core),
 -
 -	RAPL_CPU(INTEL_FAM6_ATOM_SILVERMONT,	rapl_defaults_byt),
 -	RAPL_CPU(INTEL_FAM6_ATOM_AIRMONT,	rapl_defaults_cht),
 -	RAPL_CPU(INTEL_FAM6_ATOM_SILVERMONT_MID,	rapl_defaults_tng),
 -	RAPL_CPU(INTEL_FAM6_ATOM_AIRMONT_MID,	rapl_defaults_ann),
 -	RAPL_CPU(INTEL_FAM6_ATOM_GOLDMONT,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_ATOM_GOLDMONT_PLUS,	rapl_defaults_core),
 -	RAPL_CPU(INTEL_FAM6_ATOM_GOLDMONT_X,	rapl_defaults_core),
 -
 -	RAPL_CPU(INTEL_FAM6_XEON_PHI_KNL,	rapl_defaults_hsw_server),
 -	RAPL_CPU(INTEL_FAM6_XEON_PHI_KNM,	rapl_defaults_hsw_server),
 +	INTEL_CPU_FAM6(SANDYBRIDGE,		rapl_defaults_core),
 +	INTEL_CPU_FAM6(SANDYBRIDGE_X,		rapl_defaults_core),
 +
 +	INTEL_CPU_FAM6(IVYBRIDGE,		rapl_defaults_core),
 +	INTEL_CPU_FAM6(IVYBRIDGE_X,		rapl_defaults_core),
 +
 +	INTEL_CPU_FAM6(HASWELL_CORE,		rapl_defaults_core),
 +	INTEL_CPU_FAM6(HASWELL_ULT,		rapl_defaults_core),
 +	INTEL_CPU_FAM6(HASWELL_GT3E,		rapl_defaults_core),
 +	INTEL_CPU_FAM6(HASWELL_X,		rapl_defaults_hsw_server),
 +
 +	INTEL_CPU_FAM6(BROADWELL_CORE,		rapl_defaults_core),
 +	INTEL_CPU_FAM6(BROADWELL_GT3E,		rapl_defaults_core),
 +	INTEL_CPU_FAM6(BROADWELL_XEON_D,	rapl_defaults_core),
 +	INTEL_CPU_FAM6(BROADWELL_X,		rapl_defaults_hsw_server),
 +
 +	INTEL_CPU_FAM6(SKYLAKE_DESKTOP,		rapl_defaults_core),
 +	INTEL_CPU_FAM6(SKYLAKE_MOBILE,		rapl_defaults_core),
 +	INTEL_CPU_FAM6(SKYLAKE_X,		rapl_defaults_hsw_server),
 +	INTEL_CPU_FAM6(KABYLAKE_MOBILE,		rapl_defaults_core),
 +	INTEL_CPU_FAM6(KABYLAKE_DESKTOP,	rapl_defaults_core),
 +	INTEL_CPU_FAM6(CANNONLAKE_MOBILE,	rapl_defaults_core),
 +
- 	INTEL_CPU_FAM6(ATOM_SILVERMONT1,	rapl_defaults_byt),
++	INTEL_CPU_FAM6(ATOM_SILVERMONT,		rapl_defaults_byt),
 +	INTEL_CPU_FAM6(ATOM_AIRMONT,		rapl_defaults_cht),
- 	INTEL_CPU_FAM6(ATOM_MERRIFIELD,		rapl_defaults_tng),
- 	INTEL_CPU_FAM6(ATOM_MOOREFIELD,		rapl_defaults_ann),
++	INTEL_CPU_FAM6(ATOM_SILVERMONT_MID,	rapl_defaults_tng),
++	INTEL_CPU_FAM6(ATOM_AIRMONT_MID,	rapl_defaults_ann),
 +	INTEL_CPU_FAM6(ATOM_GOLDMONT,		rapl_defaults_core),
- 	INTEL_CPU_FAM6(ATOM_GEMINI_LAKE,	rapl_defaults_core),
- 	INTEL_CPU_FAM6(ATOM_DENVERTON,		rapl_defaults_core),
++	INTEL_CPU_FAM6(ATOM_GOLDMONT_PLUS,	rapl_defaults_core),
++	INTEL_CPU_FAM6(ATOM_GOLDMONT_X,		rapl_defaults_core),
 +
 +	INTEL_CPU_FAM6(XEON_PHI_KNL,		rapl_defaults_hsw_server),
 +	INTEL_CPU_FAM6(XEON_PHI_KNM,		rapl_defaults_hsw_server),
  	{}
  };
  MODULE_DEVICE_TABLE(x86cpu, rapl_ids);

--Sig_/bNRy8ryxcqLmcoGqvlETGhp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu6xKEACgkQAVBC80lX
0GxYpQf/Q7QV4isldtRx1cthL1O1o2TGgk4NTxnOMEK0Js2/tyS1Tu9FifvKR3AE
GUG5kVAK/Rs2u8OrkpqXY9Zd/K81sOphDwGbQla9Lt6ODkOC6b460Z3jTUhj4Iu5
CFrEH/jRsxjW/b5UHODyXWvXtbt8C7MwUzjV/8zxkGaVcuKi+ZWtjs+HBSGfrqlu
5VlKRuhpdsITdQzEMqHdPYa6i0ajVuMRiVwqO/bf9dtO2JlnyGVTTGq0jmGXsEgG
2Ij0Q56HE4rc3nxPo5NBcasTv/PiraM31LLu1QYWcl8SPyuO9PNcU3v2kCfGuooH
YJgFPEq/LnCN3DE1PJcmOdzJbi0IqQ==
=+tvj
-----END PGP SIGNATURE-----

--Sig_/bNRy8ryxcqLmcoGqvlETGhp--
