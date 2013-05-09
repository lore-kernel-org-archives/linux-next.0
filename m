From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the final tree (Linus'
 tree related)
Date: Thu, 9 May 2013 13:55:04 +1000
Message-ID: <20130509135504.2b6598d3a52fdd367da1cbb4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__9_May_2013_13_55_04_+1000_sKqPcT2=8ox_d5uN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__9_May_2013_13_55_04_+1000_sKqPcT2=8ox_d5uN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (arm defconfig)
produced this warning:

ipc/shm.c: In function 'newseg':
ipc/shm.c:494:18: warning: unused variable 'hs' [-Wunused-variable]

Introduced by commit af73e4d9506d ("hugetlbfs: fix mmap failure in
unaligned size request") in Linus' tree.

Did the "[akpm@linux-foundation.org: fix warning when
CONFIG_HUGETLB_PAGE=3Dn]" part get dropped?  Or was that something else?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__9_May_2013_13_55_04_+1000_sKqPcT2=8ox_d5uN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRix4YAAoJEECxmPOUX5FEbogP/0z+zR5ouBjrCkz+2kIx9I7b
AKT/0d4oXNB6DRPKonbVahdkKczn0WhuPutuywI7Fkh5dHkf0iPCxmaAfmQY+RlD
Mv4a4KBNm0NVJ8rRfEioOPiMuW3oz3/ImgQ91KwUqxM3mG/cw5BGmSFe+l7ZFQGs
UfT5HP5xqD36nXNJ86SM1FAVjGXf7cF7TZV3d3T4gHaS1461BAwpAyCJTqy9UknP
4tD8+FWmIt6dOY87LwhK0elNn4HdFQD92O7w8YBTa4bnneCbfG/EIoRbhHkcDsqV
qUWkV/3cQmTaeXlxHNuqHboKF6tr5zC6suBCd03oQWYe9Cfal9YHXNkn4wfSd2N7
W9fpS+USlp1NOQ7v7HJWiNafOmsAsvpzNX63oEQpz0d8wTQ32g5NtcgYZTMvBFSj
064ja6qBVyUvKvLGi2r8cXJGGNpuF8gu0eFXTn5eFsBTtWz6c7mXvPDuN3szCWUi
FJdPIDoUiDLH+dhhimH1X6jJRBMBSZTQcdbi1Z7/apJrynLc4X3f7a1cmZsAF3HS
KFbfy+WMmZqlGF/X4euR64jH7wZpfwog9KuzlyzZNfGEL53DsURU3mhPWn68W03Y
22+3HlWBfR4VdvFoVDPaCkYCdJ18vqrGV1lY2t+/5TB7SbrNgZLyYn2kdoITnkD7
+z3Sc9+ZGhptfsYBTE6v
=iu06
-----END PGP SIGNATURE-----

--Signature=_Thu__9_May_2013_13_55_04_+1000_sKqPcT2=8ox_d5uN--
