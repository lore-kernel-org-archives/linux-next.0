From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nios2 tree with Linus' tree
Date: Fri, 24 Aug 2018 09:18:43 +1000
Message-ID: <20180824091843.66cdda06@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_KbKSOVp9_kkKS2PDDeqRyk"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ley Foon Tan <lftan@altera.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Tobias Klauser <tklauser@distanz.ch>
List-Id: linux-next.vger.kernel.org

--Sig_/_KbKSOVp9_kkKS2PDDeqRyk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nios2 tree got a conflict in:

  arch/nios2/Kconfig.debug

between commit:

  06ec64b84c35 ("Kconfig: consolidate the "Kernel hacking" menu")

from Linus' tree and commit:

  93bdd8902339 ("nios2: kconfig: remove duplicate DEBUG_STACK_USAGE symbol =
defintions")

from the nios2 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/nios2/Kconfig.debug
index 7a49f0d28d14,2ee8d5144c15..000000000000
--- a/arch/nios2/Kconfig.debug
+++ b/arch/nios2/Kconfig.debug
@@@ -3,15 -4,8 +3,6 @@@
  config TRACE_IRQFLAGS_SUPPORT
  	def_bool y
 =20
- config DEBUG_STACK_USAGE
- 	bool "Enable stack utilization instrumentation"
- 	depends on DEBUG_KERNEL
- 	help
- 	  Enables the display of the minimum amount of free stack which each
- 	  task has ever had available in the sysrq-T and sysrq-P debug output.
-=20
- 	  This option will slow down process creation somewhat.
 -source "lib/Kconfig.debug"
--
  config EARLY_PRINTK
  	bool "Activate early kernel debugging"
  	default y

--Sig_/_KbKSOVp9_kkKS2PDDeqRyk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt/QNMACgkQAVBC80lX
0GwR3Af/Z73aj1F3RnLQ6vxwDrB0eXpi1o7J+37TyO+3l/S3f8m2S5kDAco8hGiS
g5Tdw63Flwp/ke/Q3Pyhs2R6yydJtYVwO+AYmcqFfL78naIY+9kW7BASKiMwJy11
4H2LyIxHPDXSR6XOwnhhDfU/EfwA6nr+c0fauATzQbdiIZbSlxj1+8nyNBxNnhKq
mdmixnCYa1cIoSyet1io0O6kDS52U4SWLUWGs/WO+WqvJJ1a6T4l/127PDph6V3g
fEdibY0SHo++58DgKs3KyUZik0krz/bpJAO6r5go9lVa0fxgcky6z8/aGDBabvs3
7o4mXmQ9bq6F5f4J22gq9jP5DdUZew==
=oGDQ
-----END PGP SIGNATURE-----

--Sig_/_KbKSOVp9_kkKS2PDDeqRyk--
