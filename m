From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with Linus' tree
Date: Mon, 15 Oct 2018 18:04:37 +1100
Message-ID: <20181015180437.6d06093c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KzZK94x7vinDrGnT1Sd+l_N"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/KzZK94x7vinDrGnT1Sd+l_N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/arm64/kernel/setup.c

between commit:

  d91680e687f4 ("arm64: Fix /proc/iomem for reserved but not memory regions=
")

from Linus' tree and patch:

  "memblock: replace alloc_bootmem_low with memblock_alloc_low (2)"

from the akpm tree.

I fixed it up (the new patch hunk for this file is below) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index d0f62dd24c90..c8ba593cc3ac 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -217,8 +217,8 @@ static void __init request_standard_resources(void)
 	kernel_data.end     =3D __pa_symbol(_end - 1);
=20
 	num_standard_resources =3D memblock.memory.cnt;
-	standard_resources =3D alloc_bootmem_low(num_standard_resources *
-					       sizeof(*standard_resources));
+	standard_resources =3D memblock_alloc_low(num_standard_resources *
+						sizeof(*standard_resources), 0);
=20
 	for_each_memblock(memory, region) {
 		res =3D &standard_resources[i++];

--Sig_/KzZK94x7vinDrGnT1Sd+l_N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvEPAUACgkQAVBC80lX
0GxCsAf/WM9qbi0CPLZQx2iVHFlhVD39DIRrMoSCKX+/axVhmlFowNhmRdy+f2Sm
Mjo8M6kH3JX1LfiF6zai59NTfqRUh5RsQRFwKuyWhDZG/WJgeRa2QZprToslffBO
k2fO0zba+FN5lSWkk7RFCCus7qZdgyMx4DWucgNLfu/43nwKM1cH/Q2aRVeKcSjy
z6OUAi0l1ZPtTW4NVvg7D4baYpkohCLLoPsYcY3Ro7cBuhcLC6rhFieRCabCJLry
ArB5ayk1Bs8ktQDAzK6cOMS9Cl3TKv22ZT4wtQgJmYzPl8C6FELLnMp/4u6Rkaas
AHSGKQwi1+h3N0yOtpPxzlIPBAjjjw==
=vnxe
-----END PGP SIGNATURE-----

--Sig_/KzZK94x7vinDrGnT1Sd+l_N--
