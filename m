From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the iommu tree with the powerpc tree
Date: Mon, 24 Dec 2018 16:03:51 +1100
Message-ID: <20181224160351.04a23901@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_/09.8j6P+ZIxSBW5akcE94"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Joerg Roedel <joro@8bytes.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>
List-Id: linux-next.vger.kernel.org

--Sig_/_/09.8j6P+ZIxSBW5akcE94
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iommu tree got a conflict in:

  arch/powerpc/kernel/iommu.c

between commit:

  c4e9d3c1e65a ("powerpc/powernv/pseries: Rework device adding to IOMMU gro=
ups")

from the powerpc tree and commit:

  bf8763d8f837 ("powerpc/iommu: Use device_iommu_mapped()")

from the iommu tree.

I fixed it up (I just used the powerpc tree version which removed the
code modified by the latter) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your
tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/_/09.8j6P+ZIxSBW5akcE94
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwgaLcACgkQAVBC80lX
0Gznegf/XgNzS4mNguePYLbRoG0Y96FOr3AYK8WKVvhjyUbF0B1WhA5gfwN8bU+7
XsHv5QD2Hu4zeB/48cY5r2k8t/q4P0NGcLm/s59zoTgAvJ3Dgdcr3QBEbyMfUepS
PzloWf0HrtsKLGCwNieg9Zz4+2ltSCDlDuYEtIdNT58d3Evqk9/2HGcIKLU7YLqw
ewYmKizxviamZvcmAFgedf0ZbXyPm/Th0La1H1M/mOuoLx21er38OecvCeJqnaeV
JyKDg5njjn/j3yCJl+I78UmuPypYfpF5ODtKMz3VpVNBPUUQd3qCvkl6vgZVlivg
tAoeKWLGc8aH6UhKglB39UPUzSujnQ==
=9OWf
-----END PGP SIGNATURE-----

--Sig_/_/09.8j6P+ZIxSBW5akcE94--
