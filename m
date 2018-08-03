From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the kbuild
 tree
Date: Fri, 3 Aug 2018 18:36:53 +1000
Message-ID: <20180803183653.4d394bcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MAJjaLh58Iau11g91//MwJq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/MAJjaLh58Iau11g91//MwJq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/Kconfig.debug

between commit:

  06ec64b84c35 ("Kconfig: consolidate the "Kernel hacking" menu")

from the kbuild tree and commit:

  bbd89226bb66 ("fs/buffer.c: add debug print for __getblk_gfp() stall prob=
lem")

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

diff --cc lib/Kconfig.debug
index 46f755a60872,01ec99f1cf2e..000000000000
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@@ -1729,10 -1713,9 +1727,9 @@@ config KPROBES_SANITY_TES
  	bool "Kprobes sanity tests"
  	depends on DEBUG_KERNEL
  	depends on KPROBES
- 	default n
  	help
  	  This option provides for testing basic kprobes functionality on
 -	  boot. A sample kprobe, jprobe and kretprobe are inserted and
 +	  boot. Samples of kprobe and kretprobe are inserted and
  	  verified for functionality.
 =20
  	  Say N if you are unsure.
@@@ -1851,12 -1820,8 +1844,11 @@@ config TEST_HAS
  	  This is intended to help people writing architecture-specific
  	  optimized versions.  If unsure, say N.
 =20
 +config TEST_IDA
 +	tristate "Perform selftest on IDA functions"
 +
  config TEST_PARMAN
  	tristate "Perform selftest on priority array manager"
- 	default n
  	depends on PARMAN
  	help
  	  Enable this option to test priority array manager on boot
@@@ -2062,6 -2018,8 +2045,12 @@@ config IO_STRICT_DEVME
 =20
  	  If in doubt, say Y.
 =20
+ config DEBUG_AID_FOR_SYZBOT
+        bool "Additional debug code for syzbot"
+        default n
+        help
+          This option is intended for testing by syzbot.
++
 +source "arch/$(SRCARCH)/Kconfig.debug"
 +
 +endmenu # Kernel hacking

--Sig_/MAJjaLh58Iau11g91//MwJq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltkFCUACgkQAVBC80lX
0GxrlQf/SVZholYhG/AYcyN6U8Xh+3a11zWuzdqmj8ZUPxKLajb4ulE0R7PP4a/N
BkYF1P9OtQXClY2HTKQPmt+KP5SUThHeYYXk2+Uk388PAkt7jI+CPYc9pYUYU+s1
GnS7JGTC7Wv1ABGYQsHQpzJ3L2Kk8TOzf+vMROurb1+RWWvbHfijC2/tEuyQC5sh
Y+0u/6h/9DBQ9i7hoFIey5+33uCYPfpJ9jSdDXjQetfsR1aEUZ+ecGDQgh17r07R
vf+ocpqYZoaLk6zbeshUWsgiOPmlQL2GiixmFzv2+yG0R85rd+o5S8NLWXC4Akn4
r9cmICwSh4+6XhHXJJnS1ZggznM/2A==
=cDEf
-----END PGP SIGNATURE-----

--Sig_/MAJjaLh58Iau11g91//MwJq--
