From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the powerpc-fixes tree
Date: Mon, 22 Apr 2019 15:39:49 +1000
Message-ID: <20190422153950.4488fd7e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/M8qfRr2dOHX9cZdNwPpP24Q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>
List-Id: linux-next.vger.kernel.org

--Sig_/M8qfRr2dOHX9cZdNwPpP24Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7a3a4d763837 ("powerpc/mm_iommu: Allow pinning large regions")

Fixes tag

  Fixes: 678e174c4c16 ("powerpc/mm/iommu: allow migration of cma allocated =
pages during mm_iommu_do_alloc", 2019-03-05)

has these problem(s):

  - the ", 2019-03-05" is unexpected in a Fixes tag
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

In commit

  eb9d7a62c386 ("powerpc/mm_iommu: Fix potential deadlock")

Fixes tag

  Fixes: c10c21efa4bc ("powerpc/vfio/iommu/kvm: Do not pin device memory", =
2018-12-19)

has these problem(s):

  - the ", 2018-12-19" is unexpected in a Fixes tag
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/M8qfRr2dOHX9cZdNwPpP24Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly9U6YACgkQAVBC80lX
0GzuwQf/Tg5k2+JLzmQv71XXAvomr8zCS4BkJSMEjYmBlJU/n+QbiamyueqJX3Wb
PHYZQaPROrgZ5zCwuqpNA529ZUXvmRWtNWYVeEMz830VRtJzfapi6IsRlhRUkClU
jSH0joMAHnasT5Z13IDEBUaFY3UaDrXL8fTBu3OUwrUB8ei730wLg9nJKoeVHrLl
zWmAodxzHVK4sDKBJcDDSqEedL7lHancj8ATWuspJ2zAOaMRWQ8hJ3lobmahWBV4
TRVKLMLCrF5FVIUprbdsNARk2r0UPTHrVNIET6faU0rmaHp5nP5xcyY5qN3+1kbB
7kdAjVR69dc4fcGFwQ/GUaaik/4usg==
=0q47
-----END PGP SIGNATURE-----

--Sig_/M8qfRr2dOHX9cZdNwPpP24Q--
