From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Wed, 6 Mar 2019 16:53:21 +1100
Message-ID: <20190306165321.681712d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xxf0+bjchqGOdpU3OtBvoX+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yury Norov <ynorov@caviumnetworks.com>, Borislav Petkov <bp@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/xxf0+bjchqGOdpU3OtBvoX+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/um/Kconfig

between commit:

  eac616557050 ("x86: Deprecate a.out support")

from Linus' tree and commit:

  942fa985e9f1 ("32-bit userspace ABI: introduce ARCH_32BIT_OFF_T config op=
tion")

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

diff --cc arch/x86/um/Kconfig
index 494eeb51e4e1,ab14e6f73ca4..a9e80e44178c
--- a/arch/x86/um/Kconfig
+++ b/arch/x86/um/Kconfig
@@@ -16,6 -16,8 +16,7 @@@ config 64BI
 =20
  config X86_32
  	def_bool !64BIT
 -	select HAVE_AOUT
+ 	select ARCH_32BIT_OFF_T
  	select ARCH_WANT_IPC_PARSE_VERSION
  	select MODULES_USE_ELF_REL
  	select CLONE_BACKWARDS

--Sig_/xxf0+bjchqGOdpU3OtBvoX+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx/YFIACgkQAVBC80lX
0Gz22Af/enj2lc2djVHy4zZOzB0Dso/qgMFo7WeIsD+eIGiJeCjGt6/25cOZ4wqc
tvXMDIbzrHQIU+dgtyPWK7SqgfXm64uaATI9jp/xdj8JudLFYKBCxOdkeiY0MSWR
MVI3lU0n8f20CZUNhSbl6ghorZAX4yavAnwb9l/CBsoA8YzJjpA6/Stgw3G7AilC
p1eb7C21X6wGdzVF076ohdqNCW6oZJaV6g1P6XA2EFTBmEeF2sFFMaBuzYmQtbFK
FUpetWHfYjUBaIpmhNi5i4lVDLjLTA5Gkb8NrSqWqhEr96IJDb0hOioqHQ6xiStQ
8PAvUYAer8r+BJAqbUVrbcWFmZplhw==
=bgc7
-----END PGP SIGNATURE-----

--Sig_/xxf0+bjchqGOdpU3OtBvoX+--
