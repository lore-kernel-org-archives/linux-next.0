From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the kbuild tree
Date: Mon, 6 Aug 2018 14:47:36 +1000
Message-ID: <20180806144736.4fbe1e51@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7+BWlk0jVWhykzLsh17oL/V"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/7+BWlk0jVWhykzLsh17oL/V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  arch/arm64/Kconfig
  arch/openrisc/Kconfig

between commit:

  1572497cb0e6 ("kconfig: include common Kconfig files from top-level Kconf=
ig")

from the kbuild tree and commits:

  78ae2e1cd845 ("arm64: Use the new GENERIC_IRQ_MULTI_HANDLER")
  c5ca4560de0f ("openrisc: Use the new GENERIC_IRQ_MULTI_HANDLER")

from the tip tree.

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
index a3de6ad666d4,3d1011957823..000000000000
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@@ -278,9 -265,10 +279,6 @@@ config ARCH_SUPPORTS_UPROBE
  config ARCH_PROC_KCORE_TEXT
  	def_bool y
 =20
- config MULTI_IRQ_HANDLER
- 	def_bool y
 -source "init/Kconfig"
 -
 -source "kernel/Kconfig.freezer"
--
  source "arch/arm64/Kconfig.platforms"
 =20
  menu "Bus support"
diff --cc arch/openrisc/Kconfig
index fee9d91a66e6,dfb6a79ba7ff..000000000000
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@@ -71,9 -69,10 +71,6 @@@ config STACKTRACE_SUPPOR
  config LOCKDEP_SUPPORT
  	def_bool  y
 =20
- config MULTI_IRQ_HANDLER
- 	def_bool y
 -source "init/Kconfig"
 -
 -source "kernel/Kconfig.freezer"
--
  menu "Processor type and features"
 =20
  choice

--Sig_/7+BWlk0jVWhykzLsh17oL/V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltn0ugACgkQAVBC80lX
0GxJYQgAmyCviLG+CL/If0djfbU4oRNBG1DbBrduE5u3Vyv5wwNpHC3+KavrRnKE
qPOgOZhkGEZ+rw+zI3h10hS/ghdJX5aisoC0iIuPghxzyvkEBydKz1KZzYCfjv4y
KNh64YPbpDz8uzCA9Saic8NTKYGzM9UxzWZ4av+FNszshwm0oJcOsgCm58ifvFN6
e6qOcVO8UGLfaSFGz4Wcg8Oy8sj9ImE7tF9JkD57Ytxjs0bboTdcSR1rUJz8e1BI
JZwEMOb7FfyLOOifr/bTh6Tr0tdwtWRo9i5Vf+6k5mGMbYLpxzdeL7OuXn3Ihdbx
3gJDs3NFFvy1lYj+CO6Pk8lITBkO2A==
=B6+M
-----END PGP SIGNATURE-----

--Sig_/7+BWlk0jVWhykzLsh17oL/V--
