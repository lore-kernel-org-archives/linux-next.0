From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dma-mapping tree with the kbuild
 tree
Date: Fri, 14 Dec 2018 08:04:49 +1100
Message-ID: <20181214080449.58ae1659@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=bp.B2DC8GW/IgtKGCq8q77"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/=bp.B2DC8GW/IgtKGCq8q77
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dma-mapping tree got a conflict in:

  arch/alpha/Kconfig

between commit:

  6630a8e50105 ("eisa: consolidate EISA Kconfig entry in drivers/eisa")

from the kbuild tree and commit:

  3731c3d4774e ("dma-mapping: always build the direct mapping code")

from the dma-mapping tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/alpha/Kconfig
index 5e7a44e6110f,5da6ff54b3e7..000000000000
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@@ -5,10 -5,8 +5,11 @@@ config ALPH
  	select ARCH_MIGHT_HAVE_PC_PARPORT
  	select ARCH_MIGHT_HAVE_PC_SERIO
  	select ARCH_NO_PREEMPT
+ 	select ARCH_NO_SG_CHAIN
  	select ARCH_USE_CMPXCHG_LOCKREF
 +	select FORCE_PCI if !ALPHA_JENSEN
 +	select PCI_DOMAINS if PCI
 +	select PCI_SYSCALL if PCI
  	select HAVE_AOUT
  	select HAVE_IDE
  	select HAVE_OPROFILE
@@@ -208,8 -203,6 +209,7 @@@ config ALPHA_EIGE
  config ALPHA_JENSEN
  	bool "Jensen"
  	depends on BROKEN
- 	select DMA_DIRECT_OPS
 +	select HAVE_EISA
  	help
  	  DEC PC 150 AXP (aka Jensen): This is a very old Digital system - one
  	  of the first-generation Alpha systems. A number of these systems

--Sig_/=bp.B2DC8GW/IgtKGCq8q77
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwSyXEACgkQAVBC80lX
0GzprQgAlZR+iqFngtITN4FqOT/Y1uaA3ye+D9+USvi37GPWr6mgZDHJN7k+q4PR
pGPlWn5muyB2EItOC3mfQ7Ncn5tp0Eh8lw2HoU7QMeKmQppi4L6U4OATASshvlFa
us2/qyuefLJotDdwExuV8qKhJDi1g6Fd2GsHtjBuE4Jc6pBk+/1blDamgJSbywev
q1vZ6yNAmup2KtnqJWORrTpeynigMEWCioBL6l2H5MfyXZeiziVTXiYSGfSsvGPD
C0iJ4OsMleETmabdnU+Nm++pHgT+DyjqA5FvkpaO9d3rLO/2KCiibIQBU7cVrgPq
J/GDJTS+IzaraPDEe9nekjMuph1hjw==
=LFyO
-----END PGP SIGNATURE-----

--Sig_/=bp.B2DC8GW/IgtKGCq8q77--
