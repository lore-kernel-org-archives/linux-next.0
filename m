From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Date: Mon, 24 Sep 2018 14:38:53 +1000
Message-ID: <20180924143853.0f6cc235@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/H9NPypStBoDAPCLASOe0of0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jia He <jia.he@hxt-semitech.com>, James Morse <james.morse@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/H9NPypStBoDAPCLASOe0of0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm64/Kconfig

between commit:

  8a695a587333 ("arm64: Kconfig: Remove ARCH_HAS_HOLES_MEMORYMODEL")

from the arm64 tree and commit:

  e1405baa7db1 ("arm: arm64: introduce CONFIG_HAVE_MEMBLOCK_PFN_VALID")

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

diff --cc arch/arm64/Kconfig
index da5e6f085561,f8a618a292f4..000000000000
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@@ -785,7 -786,8 +785,8 @@@ config ARCH_FLATMEM_ENABL
  	def_bool !NUMA
 =20
  config HAVE_ARCH_PFN_VALID
 -	def_bool ARCH_HAS_HOLES_MEMORYMODEL || !SPARSEMEM
 +	def_bool y
+ 	select HAVE_MEMBLOCK_PFN_VALID
 =20
  config HW_PERF_EVENTS
  	def_bool y

--Sig_/H9NPypStBoDAPCLASOe0of0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluoal0ACgkQAVBC80lX
0GzA2gf+JPxzWjqtncHmMA8RMrcz6djQDW3CzrEtkwWtrnFuxYL9Lx9Yr4or6PuU
g7URYczAKCv70UvrMvEFWnIcWUQBBwUvwEfYxxBspuk8pq7YUaf4Awxolp0RxJFm
RoS2MHeLuAgRvqCJaQdzwCs9AzHom9Y8ZF0r06uFxbm0w3by9+aPwbvtagZ/vnDG
DDstnRphjNnxxqrCEPJB1zf0/SbaIEMOl08JsFwakBudTAv50EXc7dQS+vMNQGy9
1ojHaVGeqieiVfSWRr9tFK+a9aisRvbGxiRaHMeph54VvbzqeD9Shfm6bnP4UDbS
9oPNA8wZqoEoRaC79WNbvD3Thv0vwg==
=tlOH
-----END PGP SIGNATURE-----

--Sig_/H9NPypStBoDAPCLASOe0of0--
