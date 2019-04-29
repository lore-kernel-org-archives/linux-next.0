From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the imx-mxs tree with the arm-soc tree
Date: Tue, 30 Apr 2019 09:49:23 +1000
Message-ID: <20190430094923.10e3be32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6036731471626006055=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============6036731471626006055==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Iw_hvswPpXbdgI0hpBQL2t2"; protocol="application/pgp-signature"

--Sig_/Iw_hvswPpXbdgI0hpBQL2t2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

Today's linux-next merge of the imx-mxs tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  7b0d021fbe41 ("arm64: defconfig: enable PCIE_ALTERA")

from the arm-soc tree and commit:

  2b4fd225df89 ("arm64: defconfig: Enable CONFIG_SPI_IMX")

from the imx-mxs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index 5392c12ef3b7,eb31c20e9914..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -357,7 -365,7 +358,8 @@@ CONFIG_SPI=3D
  CONFIG_SPI_ARMADA_3700=3Dy
  CONFIG_SPI_BCM2835=3Dm
  CONFIG_SPI_BCM2835AUX=3Dm
 +CONFIG_SPI_NXP_FLEXSPI=3Dy
+ CONFIG_SPI_IMX=3Dy
  CONFIG_SPI_MESON_SPICC=3Dm
  CONFIG_SPI_MESON_SPIFC=3Dm
  CONFIG_SPI_ORION=3Dy

--Sig_/Iw_hvswPpXbdgI0hpBQL2t2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzHjYMACgkQAVBC80lX
0GxmfAgAno8fSN5vL9ATAuhtSUMt2B01kxbRiVjVC235N2aFwLRx3mvgQqoyPzW4
XVB5OPdHOcHW+fIM/pIQ2G85MqBph0KpQWhfYOoIIMNc9Ct5NkxSkLwtzPBhGddy
js+lV+iAt1fYRDOO8cKHUMznrYct7QkrGD+ToUf/kMCqCbfmEY6Jsxmk3Hw4nquO
WBgexu3qBJcxvQK7vwBrqSuoVkKTTJ7e/uZc1IFNYhDuZiGzLZO2ByLfkONiQ6/F
wqdqdLABU7htcBgAiQRxcca3PRWBpOovTfuvBfuYCxPgp3CFauNkV7KU5Oj3NoNZ
Ocj3qmNWhJ6fLm4xToHcMcXOv9q6Vw==
=QgVM
-----END PGP SIGNATURE-----

--Sig_/Iw_hvswPpXbdgI0hpBQL2t2--


--===============6036731471626006055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6036731471626006055==--
