From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with the arm-soc tree
Date: Mon, 23 Mar 2015 12:03:14 +1100
Message-ID: <20150323120314.3631211a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/b.n2bcvvrnfWdxpKT5Li8.M"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>
List-Id: linux-next.vger.kernel.org

--Sig_/b.n2bcvvrnfWdxpKT5Li8.M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Today's linux-next merge of the mips tree got a conflict in
drivers/bus/Makefile between commit 6320c41198c7 ("drivers: bus: Sort
Makefile entries alphabetically") from the arm-soc tree and commit
cd46cf20d04a ("MIPS: Add CDMM bus support") from the mips tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/bus/Makefile
index e023a2bec664,807dd17ef2f8..000000000000
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@@ -2,13 -2,11 +2,14 @@@
  # Makefile for the bus drivers.
  #
 =20
 +# Interconnect bus drivers for ARM platforms
 +obj-$(CONFIG_ARM_CCI)		+=3D arm-cci.o
 +obj-$(CONFIG_ARM_CCN)		+=3D arm-ccn.o
 +
  obj-$(CONFIG_BRCMSTB_GISB_ARB)	+=3D brcmstb_gisb.o
 -obj-$(CONFIG_IMX_WEIM)	+=3D imx-weim.o
 +obj-$(CONFIG_IMX_WEIM)		+=3D imx-weim.o
+ obj-$(CONFIG_MIPS_CDMM) +=3D mips_cdmm.o
 -obj-$(CONFIG_MVEBU_MBUS) +=3D mvebu-mbus.o
 -obj-$(CONFIG_OMAP_OCP2SCP)	+=3D omap-ocp2scp.o
 +obj-$(CONFIG_MVEBU_MBUS) 	+=3D mvebu-mbus.o
 =20
  # Interconnect bus driver for OMAP SoCs.
  obj-$(CONFIG_OMAP_INTERCONNECT)	+=3D omap_l3_smx.o omap_l3_noc.o

--Sig_/b.n2bcvvrnfWdxpKT5Li8.M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVD2ZXAAoJEMDTa8Ir7ZwVOboP/R0y5UdiIQG9lnRVMJXJxVsT
EpvYfTJe9kx6Mm7q5ctHk45E7LNu2c+8keIbDxaMg3dez1Xkugf/N1Uq/YotlDaZ
F3U8xbxGo+VU91E0mG8v/vMgaz6Ec2TrrxSB5p+r+K7ot2PW6VUPWuI0OCoS0nB5
UNUS3Q1SxkzB5URfDG6WnkpFbGIZ5nQMPhVz6FDV4fJx4p7Ck0CapDlo82F8Zpm9
NrKxyKo3eW4gEI+ObKcGstJsV+weRwR3wV+OwXazO9Ao9Nj+3PMnfukCKYWCq2TA
SEELeXm21Kl5y39PM7BLxZc+eKmbOun3DcExEFmRxNQorEIhPCMflvqf4+n9h9tA
EUlM1lcSWjfUVHAXWgPlNYouhjUR10IjjfPC4BLaKBz+daPuX5jPDkjwne+AUBYP
9xBdoTnCe/xnFrotZloIlKgRd4U5xDg8djXOj5XLf8Oq6V9y5pCvALoBmohuYaji
lwV7d0pgrifFVG5BGDY3lrwxx/Wuf70nS/1Pp4JARDAlqQKaUe471uJ7LWGzqvPt
aH8DEoLcgSNZaWPE8Z+NdyvIjCcUmwoNqRzaYoH1KPy9BxcQtuNNDOYyn83OIzgg
GWKbzczQpamI+OZmlmGS0YxdMh1X0iNN9bN2eVO9oDdYzAuOvyQGbPvDuwNxq2l4
bI8XcCVLL9gVJGQCeGvo
=LBaP
-----END PGP SIGNATURE-----

--Sig_/b.n2bcvvrnfWdxpKT5Li8.M--
