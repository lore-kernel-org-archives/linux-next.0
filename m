From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the kbuild tree
Date: Fri, 21 Dec 2018 12:59:45 +1100
Message-ID: <20181221125945.0114b06c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OtcpDx96gi_Op+L3WGIkaGf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sinan Kaya <okaya@kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/OtcpDx96gi_Op+L3WGIkaGf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pm tree got a conflict in:

  arch/arm64/Kconfig

between commits:

  2eac9c2dfb2b ("PCI: consolidate the PCI_DOMAINS and PCI_DOMAINS_GENERIC c=
onfig options")
  20f1b79d3359 ("PCI: consolidate the PCI_SYSCALL symbol")

from the kbuild tree and commit:

  52146173a033 ("arm64: select ACPI PCI code only when both features are en=
abled")

from the pm tree.

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
index 53233ab80744,bcb6262044d8..000000000000
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@@ -163,9 -163,7 +163,9 @@@ config ARM6
  	select OF
  	select OF_EARLY_FLATTREE
  	select OF_RESERVED_MEM
 +	select PCI_DOMAINS_GENERIC if PCI
- 	select PCI_ECAM if ACPI
+ 	select PCI_ECAM if (ACPI && PCI)
 +	select PCI_SYSCALL if PCI
  	select POWER_RESET
  	select POWER_SUPPLY
  	select REFCOUNT_FULL

--Sig_/OtcpDx96gi_Op+L3WGIkaGf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwcSREACgkQAVBC80lX
0Gwssgf/eRqT4c2Sxt7OKBlG0L1FLEoHi5BNMUmZvHJYWUijT/ziNctms/mJuvB0
ymP5h4eyTS0OuN9gA+TRhXnl1uWKjvq8NjfF0JfIo559Zfuvtu3ApOcvLGWvgdCU
zUb0MJqK9WJyfN+Mghcd6qUaaxFLNtigHjso9a+LE7LZP5UDdz5NVTib1f5OcnQF
Bpv2V7XIki7AB1ZP1G3eolevZkbZvJ0uU1So7SNGSJcMUy5pRwsHWXTxCalfxras
mfxhUC/CLhnuKtb0UXNFSsl733JNXwmSUBhq7hNTFF7M3+xt1oUnZCkAYsP3aZHp
WidPi+/k+NiD9lOJuhIVjkSVB20iug==
=pyEM
-----END PGP SIGNATURE-----

--Sig_/OtcpDx96gi_Op+L3WGIkaGf--
