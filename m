From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the iommu tree
Date: Thu, 8 Nov 2018 12:39:38 +1100
Message-ID: <20181108123938.2026559e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XJ6_I/BrYhA1mqYw6ycAalV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Joerg Roedel <joro@8bytes.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jacob Pan <jacob.jun.pan@linux.intel.com>, Ashok Raj <ashok.raj@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/XJ6_I/BrYhA1mqYw6ycAalV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joerg,

After merging the iommu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/bitmap.h:10,
                 from drivers/iommu/intel-iommu.c:24:
drivers/iommu/intel-iommu.c: In function 'iommu_calculate_agaw':
include/linux/kernel.h:845:29: warning: comparison of distinct pointer type=
s lacks a cast
   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
                             ^~
include/linux/kernel.h:859:4: note: in expansion of macro '__typecheck'
   (__typecheck(x, y) && __no_side_effects(x, y))
    ^~~~~~~~~~~
include/linux/kernel.h:869:24: note: in expansion of macro '__safe_cmp'
  __builtin_choose_expr(__safe_cmp(x, y), \
                        ^~~~~~~~~~
include/linux/kernel.h:878:19: note: in expansion of macro '__careful_cmp'
 #define min(x, y) __careful_cmp(x, y, <)
                   ^~~~~~~~~~~~~
drivers/iommu/intel-iommu.c:668:9: note: in expansion of macro 'min'
  mgaw =3D min(cap_mgaw(iommu->cap), DEFAULT_DOMAIN_ADDRESS_WIDTH);
         ^~~

Introduced by commit

  248808a0fad0 ("iommu/vt-d: Respect max guest address width in agaw")

--=20
Cheers,
Stephen Rothwell

--Sig_/XJ6_I/BrYhA1mqYw6ycAalV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvjk9oACgkQAVBC80lX
0GwzKwf/ZC9aPWq4mHaEAeRTQCRYNVGK/B3AEpmdVb3gFt7vAXBr0SZNc04+Tupt
B8/LCRjjVA1YBp5haLUZ8bRls40jXimemFLGwRWKKTg6c6efkNDtCsiqzlwTRzd8
i6+1pZPvZoyOlPP4C20Qbu/LrQX6l7/4BvbB0fZGmDUSfQ/ooaqtIqlhE1cXJECf
jnqzCi2zJ/DL++3CKVa6bAbAgt7ca1bcOCWglKaAFShmLKkX9FNlnbn6x75U/xfa
3S2YG0Cglu9gbT0pM7oFOnaaE7eTd9N3IfQL1YdWWuzN9fZ6QwB1+5fznDwuXHSP
rFKB3eL2nCMOzjQz96Ci8ayrIhWrIw==
=2Zdh
-----END PGP SIGNATURE-----

--Sig_/XJ6_I/BrYhA1mqYw6ycAalV--
