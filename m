From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with the arm-soc tree
Date: Tue, 3 Apr 2018 12:00:00 +1000
Message-ID: <20180403120000.4ff083a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MUJ_M+vyF6Y5JlAUTP45beY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhichang Yuan <yuanzhichang@hisilicon.com>, Robin Murphy <robin.murphy@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/MUJ_M+vyF6Y5JlAUTP45beY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/bus/Makefile

between commit:

  1888d3ddc3d6 ("drivers/bus: Move Arm CCN PMU driver")

from the arm-soc tree and commit:

  38e3446c5d06 ("HISI LPC: Support the LPC host on Hip06/Hip07 with DT bind=
ings")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/bus/Makefile
index 3d473b8adeac,50bb12a971a0..000000000000
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@@ -5,11 -5,10 +5,13 @@@
 =20
  # Interconnect bus drivers for ARM platforms
  obj-$(CONFIG_ARM_CCI)		+=3D arm-cci.o
 -obj-$(CONFIG_ARM_CCN)		+=3D arm-ccn.o
+=20
+ obj-$(CONFIG_HISILICON_LPC)	+=3D hisi_lpc.o
  obj-$(CONFIG_BRCMSTB_GISB_ARB)	+=3D brcmstb_gisb.o
 +
 +# DPAA2 fsl-mc bus
 +obj-$(CONFIG_FSL_MC_BUS)	+=3D fsl-mc/
 +
  obj-$(CONFIG_IMX_WEIM)		+=3D imx-weim.o
  obj-$(CONFIG_MIPS_CDMM)		+=3D mips_cdmm.o
  obj-$(CONFIG_MVEBU_MBUS) 	+=3D mvebu-mbus.o

--Sig_/MUJ_M+vyF6Y5JlAUTP45beY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrC4CAACgkQAVBC80lX
0GzvgAgAl3PV0uFTw6/sbNGN8HIIqBalcfJy7aLKPDE09+P+T0a/ggVoXjX7DN5v
uW7qfl0jtCiTXJGoOKYrwwUJxhbg1OMtOWF422W0ntUo/KvAY9Tkg/neUJp89mJe
SbQ3kRpbgmAXb827J3z3SoOSdSbQW9LsUlpVBY/8+wA34HRNVx1pE5r07Xj+dYC/
CkusrQows6IduYLhQQsXzq04EdGypOvc1Sr6846ja8wKiBDmIETbhCRPsAsbDxlA
HGnQNVuR2fFMk7py6NSxg3K6Ta4HtRUAf/SPvV7e93JYlMOAQEDD5ghra455qiYW
/YYFbJ6+l9mpAje8pHqAo0h//RbzcA==
=QNxP
-----END PGP SIGNATURE-----

--Sig_/MUJ_M+vyF6Y5JlAUTP45beY--
