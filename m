From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the imx-mxs tree with the arm-soc tree
Date: Mon, 6 Jan 2014 10:38:50 +1100
Message-ID: <20140106103850.3c60fa973ae9355c0a3c2449@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0013517463573351960=="
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
To: Shawn Guo <shawn.guo@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>
List-Id: linux-next.vger.kernel.org

--===============0013517463573351960==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__6_Jan_2014_10_38_50_+1100_zHLIbuw/TY3GiNlU"

--Signature=_Mon__6_Jan_2014_10_38_50_+1100_zHLIbuw/TY3GiNlU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

Today's linux-next merge of the imx-mxs tree got a conflict in
arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi between commit
8f568b496dd9 ("ARM: imx: Explicitly pass the active level of the PHY
reset") from the arm-soc tree and commit 208d5b9c2c71 ("ARM: dts: i.MX27
boards: Switch to use standard GPIO and IRQ flags definitions") from the
imx-mxs tree.

I fixed it up (I randomly chose to go with the latter - please get
together and decide which is right) and can carry the fix as necessary
(no action is required).

At the time of those commits, the file was called
arch/arm/boot/dts/imx27-phytec-phycore-som.dts (it is renamed by commit
c7914d9b5565 ("ARM: dts: imx27-phytec-phycore-som: Rename file to .dtsi"
from the imx-mxs tree) and we we ended up with (cut and paste damaged):

&fec {
	phy-mode =3D "mii";
	phy-reset-gpios =3D <&gpio3 30 GPIO_ACTIVE_HIGH>;
	phy-supply =3D <&reg_3v3>;
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&pinctrl_fec1>;
	status =3D "okay";
};

--=20
Cheers,
Stephen Rothwell <sfr@canb.auug.org.au>

--Signature=_Mon__6_Jan_2014_10_38_50_+1100_zHLIbuw/TY3GiNlU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSye0OAAoJEMDTa8Ir7ZwVmDcQAINLAoNQv1ANcrw7Mah0ylrA
iStW0WV7rieWaa69AOSkssS7CxHTOwYfaw4CVrhZAmN61x+fqx3KLALtnHBWtyaz
g9/SS8Dlzwkvc7hXoD7kgnxa9/uEMsZsMqka/lQJdmUbs5JWnSo191fj0vDmdx0d
jjvVp89DqLk5tZMdDuv4a+1cDTKTMvaBtHk9JRvW6bQ83TVnZTczLQmEVuyrDZPD
Q/YP+LYQKhSvNUdEkU86O4aY99GYqeqAng4Ojf3JPwSmeMnFCcDfpDWmMM+AL7k9
EftxpUpXqsbuMmevaotB4ahr0owjw7KG/7hsA1zUfnl10B7N/tQCG35OQj0bN83S
JV55ZmzxY03nNIE+3TOjHjm87CQJgKjuC2CATVHeh02FWioNrMY6TktxLfhDE8Jp
BkH2jDIcJXr0MMX2dXYzllQz8VN9pIsGa3O93nA3miAZUaftx3Q6IyIuIsTRiDkc
Tm8+PaWFE3A1degtNwDYdBGT4kWtIVf6Dxq/2aAUcIIG26vmPRQtLhq4Mt16mwdM
PeJaO8yDwSuALB+EUOKvg8GK00aABOjsV2Jmh2t6JQIQ0qxbOOAdaI5kaBLds2kX
Xr/VzitnQCUo8pztq6SbJnyAwp8LD+Y9lEKWiTRDq5z7OHKjMKpyKzQ3Zj20Sz7v
XmYVGtdIbVISrfE41ZdK
=zsw8
-----END PGP SIGNATURE-----

--Signature=_Mon__6_Jan_2014_10_38_50_+1100_zHLIbuw/TY3GiNlU--


--===============0013517463573351960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0013517463573351960==--
