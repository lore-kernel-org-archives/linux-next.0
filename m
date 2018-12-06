From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the mmc tree
Date: Thu, 6 Dec 2018 15:48:00 +1100
Message-ID: <20181206154800.760ff17a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ffg39yqI/Vx32a1y1J=WXlm"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Oleksij Rempel <linux@rempel-privat.de>, Peng Hao <peng.hao2@zte.com.cn>
List-Id: linux-next.vger.kernel.org

--Sig_/Ffg39yqI/Vx32a1y1J=WXlm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/misc/Makefile

between commit:

  4eb78924bf0e ("misc: cardreader: add new Alcor Micro Cardreader PCI drive=
r")

from the mmc tree and commit:

  fcb418cd567f ("pvpanic: move pvpanic to misc as common driver")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/misc/Makefile
index fe3134cf3008,b76d611c87de..000000000000
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@@ -57,4 -57,5 +57,5 @@@ obj-$(CONFIG_ASPEED_LPC_CTRL)	+=3D aspeed
  obj-$(CONFIG_ASPEED_LPC_SNOOP)	+=3D aspeed-lpc-snoop.o
  obj-$(CONFIG_PCI_ENDPOINT_TEST)	+=3D pci_endpoint_test.o
  obj-$(CONFIG_OCXL)		+=3D ocxl/
 -obj-$(CONFIG_MISC_RTSX)		+=3D cardreader/
 +obj-y		+=3D cardreader/
+ obj-$(CONFIG_PVPANIC)   	+=3D pvpanic.o

--Sig_/Ffg39yqI/Vx32a1y1J=WXlm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwIqgAACgkQAVBC80lX
0Gyjjgf9FaEoV1AVFyRXqRMbZWAE40NHZfRtqVv1dlXmAKZfJggQIUMNBnpaj5X2
wFdPYZuFx4yqRA9ZA27dXn4sFUIrB1VJ6FQvZUmhktQDAVVMWTaoZrcmcglEpbha
z493m/9W/UPutwOD+f7swFdiiLIpmiCZVDgmVaF8Dav21sopHh8Zovf0R6JkTaoj
jYvG9bh85iVlHT6zpCwrJ/IOOmhqvgcpS9Sq4wNBZ0Fma2XXfFlWV6qi+P0shG9q
ZXl29FvwsPsAw0EePU1cuDKwK3vDKPSfLUcy4t7xSSUfBw940CfaUYcQF2nVeD+p
bJw9LJLVbHR3uc4l9ncfpuJkrkxmkg==
=k1v1
-----END PGP SIGNATURE-----

--Sig_/Ffg39yqI/Vx32a1y1J=WXlm--
