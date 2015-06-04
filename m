From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the mips tree
Date: Thu, 4 Jun 2015 18:39:33 +1000
Message-ID: <20150604183933.5f403cfd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5O5IkVmGEA+M=CR9=Mdg=zE"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Brian Norris <computersforpeace@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: linux-next.vger.kernel.org

--Sig_/5O5IkVmGEA+M=CR9=Mdg=zE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/phy/Makefile between commit d38dee131827 ("PHY: Add driver for
Pistachio USB2.0 PHY") from the mips tree and commit 0d486806ffd0 ("phy:
add Broadcom SATA3 PHY driver for Broadcom STB SoCs") from the usb tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/phy/Makefile
index 75a37dc952f5,bc92b427e5ca..000000000000
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@@ -40,4 -40,5 +40,6 @@@ obj-$(CONFIG_PHY_STIH41X_USB)		+=3D phy-s
  obj-$(CONFIG_PHY_QCOM_UFS) 	+=3D phy-qcom-ufs.o
  obj-$(CONFIG_PHY_QCOM_UFS) 	+=3D phy-qcom-ufs-qmp-20nm.o
  obj-$(CONFIG_PHY_QCOM_UFS) 	+=3D phy-qcom-ufs-qmp-14nm.o
 +obj-$(CONFIG_PHY_PISTACHIO_USB)		+=3D phy-pistachio-usb.o
+ obj-$(CONFIG_PHY_TUSB1210)		+=3D phy-tusb1210.o
+ obj-$(CONFIG_PHY_BRCMSTB_SATA)		+=3D phy-brcmstb-sata.o

--Sig_/5O5IkVmGEA+M=CR9=Mdg=zE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVcA7LAAoJEMDTa8Ir7ZwV8NUP/jhxw+Vg3rjI6T19NaOIMDt2
rE97xXYolgZ1QpdqSX+H/QHL65fvZ7RQ84UJNcanasmXMeHibucRnRsSrCV4blDu
amV8WsVLK3bLM9KlmmqXIVxB3811yjwyoxSALYUE9f8bSRUwHour5T7d/RTKeXr+
nxPjlemsHdKFtUmumvAO1Rpa2dVpvXDgmUdwa6Rspn2U2UtItb4G83I1ldb9GVol
bON2xpZG/lifbrFHK4m9GcoXp2YtJlYoGu+Oze7am/KMeo+CSK1PLsklj/rYQpjp
pp68h9qA/RjUEMZ0NMCa9qkDmtAymtcUap7xKSg8e2s7ilEevw5ahatr3b5W33SD
PPRw8F1xtMANzlwatCeoIQCvFYLNIu8fvKK8zkrmquHxJoduB8okcPtm+ZEyz4VH
8VfTun+RKOn94bkf2rB6y+2uCuBvX+LnkfGID84e4HkAUhrciOd3rjZm90nWfDEy
KgvsWPhVfzF5M/8dyOLhUUPbhMYApS9xCceV3xrat+0KB4FAguUCb0td+d5iHUxh
eWn5DfJkGP31YaRjjirXvKYj3P1tYDqQe7muVT15+rk6K87YXMsrzV9N1jWbkoV8
lXkNmlT1P8+yfHJsfQFJhTGwODANsafxxDJAZU+hJ3Zw1h3ohrD5zEGDqn6zLOUH
IrlxZbYmNtu8hh0q7Nvl
=8CPV
-----END PGP SIGNATURE-----

--Sig_/5O5IkVmGEA+M=CR9=Mdg=zE--
