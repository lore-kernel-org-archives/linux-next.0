From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the keystone tree with the arm-soc tree
Date: Mon, 30 Oct 2017 12:05:30 +0000
Message-ID: <20171030120530.rmyan374grqenqyj@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1663847621513055461=="
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
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, arnd@arndb.de, rob.herring@linaro.org
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org


--===============1663847621513055461==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gbok64zzjqiznqho"
Content-Disposition: inline


--gbok64zzjqiznqho
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Santosh,

Today's linux-next merge of the keystone tree got a conflict in:

  arch/arm/boot/dts/keystone-k2g.dtsi

between commit:

  8dccafaa281aa1d24 ("arm: dts: fix unit-address leading 0s")

=66rom the arm-soc tree and various commits from the keystone tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm/boot/dts/keystone-k2g.dtsi
index a1ae69d712f7,6f3521d18125..000000000000
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@@ -133,7 -136,40 +136,40 @@@
  			clocks =3D <&k2g_clks 0x0009 1>;
  		};
 =20
+ 		i2c0: i2c@2530000 {
+ 			compatible =3D "ti,keystone-i2c";
+ 			reg =3D <0x02530000 0x400>;
+ 			clocks =3D <&k2g_clks 0x003a 0>;
+ 			power-domains =3D <&k2g_pds 0x003a>;
+ 			interrupts =3D <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
+ 			#address-cells =3D <1>;
+ 			#size-cells =3D <0>;
+ 			status =3D "disabled";
+ 		};
+=20
+ 		i2c1: i2c@2530400 {
+ 			compatible =3D "ti,keystone-i2c";
+ 			reg =3D <0x02530400 0x400>;
+ 			clocks =3D <&k2g_clks 0x003b 0>;
+ 			power-domains =3D <&k2g_pds 0x003b>;
+ 			interrupts =3D <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
+ 			#address-cells =3D <1>;
+ 			#size-cells =3D <0>;
+ 			status =3D "disabled";
+ 		};
+=20
+ 		i2c2: i2c@2530800 {
+ 			compatible =3D "ti,keystone-i2c";
+ 			reg =3D <0x02530800 0x400>;
+ 			clocks =3D <&k2g_clks 0x003c 0>;
+ 			power-domains =3D <&k2g_pds 0x003c>;
+ 			interrupts =3D <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
+ 			#address-cells =3D <1>;
+ 			#size-cells =3D <0>;
+ 			status =3D "disabled";
+ 		};
+=20
 -		kirq0: keystone_irq@026202a0 {
 +		kirq0: keystone_irq@26202a0 {
  			compatible =3D "ti,keystone-irq";
  			interrupts =3D <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>;
  			interrupt-controller;

--gbok64zzjqiznqho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAln3FYkACgkQJNaLcl1U
h9As/Qf+LU0bJkr4jzbJNghMwAgmfM/yG5wP2ls7MrJ0Sppb/APzLFemrzj3wuzT
EIwuHuvp7sWq/iTXiw/36p4X+FGhEWWZN2Yj7Hk4xrFjfy0mFbWx1k7qjeIl42jM
vKOaPihR5/9XLumKicMZJB4QubVTjzZ5bjSuoBaJX3OzPC2QLDthqCjHD36j4mXx
+xY7TMjmnFej/+9lZMamAdcQo4Ebpl6E3NwSOqYKwzxHj8bOo1vnfoXBhM0oA7Jr
tbCZCbQd5o/M962rrgPmv+qhhwzY21MzLQkpihvHJVLVmmHTa5fts/K1leJv3n0C
7NjgROc2fcDaPRZomoGHDxQx4/SW0w==
=j/Pj
-----END PGP SIGNATURE-----

--gbok64zzjqiznqho--


--===============1663847621513055461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1663847621513055461==--
