From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kbuild tree with the mips-fixes
 tree
Date: Mon, 24 Dec 2018 09:23:51 +1100
Message-ID: <20181224092351.4f58c1ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/L28VHnv2MMg8dsHidwMlIzx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, James Hogan <james.hogan@mips.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>, Paul Burton <paul.burton@mips.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/L28VHnv2MMg8dsHidwMlIzx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild tree got a conflict in:

  arch/mips/ralink/Kconfig

between commit:

  0b15394475e3 ("MIPS: ralink: Select CONFIG_CPU_MIPSR2_IRQ_VI on MT7620/8")

from the mips-fixes tree and commit:

  eb01d42a7778 ("PCI: consolidate PCI config entry in drivers/pci")

from the kbuild tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/mips/ralink/Kconfig
index 613d61763433,4c8006b4a5f7..000000000000
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@@ -38,8 -38,7 +38,8 @@@ choic
 =20
  	config SOC_MT7620
  		bool "MT7620/8"
 +		select CPU_MIPSR2_IRQ_VI
- 		select HW_HAS_PCI
+ 		select HAVE_PCI
 =20
  	config SOC_MT7621
  		bool "MT7621"

--Sig_/L28VHnv2MMg8dsHidwMlIzx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwgCvcACgkQAVBC80lX
0GxVqAf7Bf/uVndq/44LOJzR2dy8386B7/+ti6cqLEK0G6W12Hc5VFH/OSyMOgsq
2Lav+4EpZME014MY718+hYM73+Rmn9DXE/pEZFm/ILT/UrkgpHB4zgbCRJslFMVV
JuLRyZcD6zORE5fhkCJiKrjrb9ccu3VJyI7pzlVf+UzX1zFHDNOpxKN4Drp0tW8s
6/Jv+voou/PalxXcwHRBu1lwHNWwnB+pNpC9LGdA9TA11cq1tNoedTnhyl632Qjm
q28ahgBck9Nb9cRa7GHEK+uvHHa85lvpM6cq7FIlG0t8nrmXLs7bkzVoiUTlpdsd
580Hhds7WgHT+WM3dFXttcnF5TZeIQ==
=K4o4
-----END PGP SIGNATURE-----

--Sig_/L28VHnv2MMg8dsHidwMlIzx--
