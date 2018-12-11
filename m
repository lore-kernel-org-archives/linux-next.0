From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the FIXME
 tree
Date: Tue, 11 Dec 2018 17:11:02 +1100
Message-ID: <20181211171102.14c0be9f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_6DsOEMbDGiGD8wJ4fTT/S3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Konovalov <andreyknvl@google.com>, Steve Capper <steve.capper@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/_6DsOEMbDGiGD8wJ4fTT/S3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm64/mm/proc.S

between commits:

  67e7fdfcc682 ("arm64: mm: introduce 52-bit userspace support")
  68d23da4373a ("rm64: Kconfig: Re-jig CONFIG options for 52-bit VA")

from the FIXME tree and commit:

  089dc516f651 ("kasan, arm64: enable top byte ignore for the kernel")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/mm/proc.S
index e05b3ce1db6b,d861f208eeb1..73886a5f1f30
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@@ -449,16 -451,8 +455,16 @@@ ENTRY(__cpu_setup
  	 */
  	ldr	x10, =3DTCR_TxSZ(VA_BITS) | TCR_CACHE_FLAGS | TCR_SMP_FLAGS | \
  			TCR_TG_FLAGS | TCR_KASLR_FLAGS | TCR_ASID16 | \
- 			TCR_TBI0 | TCR_A1
+ 			TCR_TBI0 | TCR_A1 | TCR_KASAN_FLAGS
 -	tcr_set_idmap_t0sz	x10, x9
 +
 +#ifdef CONFIG_ARM64_USER_VA_BITS_52
 +	ldr_l		x9, vabits_user
 +	sub		x9, xzr, x9
 +	add		x9, x9, #64
 +#else
 +	ldr_l		x9, idmap_t0sz
 +#endif
 +	tcr_set_t0sz	x10, x9
 =20
  	/*
  	 * Set the IPS bits in TCR_EL1.

--Sig_/_6DsOEMbDGiGD8wJ4fTT/S3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwPVPYACgkQAVBC80lX
0GzVtAf9Eaut33wucTUGl69ArkhPad21vdoNubcCXRS17OZazCsJ+IoWpU0ZJS+V
PrOeG/TelQa9OqJT8cGlEw85AYO8XfsaRKjQjDiISiOr9SizB6Wg26eOQKAGUC03
4BM/ZuOBYPTATUsDk5FcJmfC12QEBAnMTdiYyL1miRmSziKRbLx5FqF7EK3ALQoC
jJsNfPxU8ddhOLef5jD+E5LkYfzqZFrQMVoza3axyNAEPdNV9UrH8cVnyyDjRHlD
WSRyMAbwrcU3tS/H6PvMDRVBHNl1m2YMoNwD3qZWl3Utz9J5sJqwt0C8LFS34ZVl
pzPSxFt4otqJz/n3vywT300aT2RgNg==
=0/st
-----END PGP SIGNATURE-----

--Sig_/_6DsOEMbDGiGD8wJ4fTT/S3--
