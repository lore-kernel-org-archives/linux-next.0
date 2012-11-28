From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the thermal tree
Date: Wed, 28 Nov 2012 16:27:27 +1100
Message-ID: <20121128162727.b7fa486fb3cc39f8c9169b19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4588721345742431443=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: "hongbo.zhang" <hongbo.zhang@linaro.com>, Zhang Rui <rui.zhang@intel.com>, linux-next@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--===============4588721345742431443==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__28_Nov_2012_16_27_27_+1100__Q9r2zMSiUsefiq6"

--Signature=_Wed__28_Nov_2012_16_27_27_+1100__Q9r2zMSiUsefiq6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
arch/arm/boot/dts/dbx5x0.dtsi between commit dc1956b5f84d ("Thermal: Add
ST-Ericsson DB8500 thermal properties and platform data") from the
thermal tree and commit 0563f638f052 ("ARM: ux500: Add node for the MMC
GPIO regulator") from the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/boot/dts/dbx5x0.dtsi
index 487b705,9f55363..0000000
--- a/arch/arm/boot/dts/dbx5x0.dtsi
+++ b/arch/arm/boot/dts/dbx5x0.dtsi
@@@ -695,10 -630,18 +664,23 @@@
  			status =3D "disabled";
  		};
 =20
 +		cpufreq-cooling {
 +			compatible =3D "stericsson,db8500-cpufreq-cooling";
 +			status =3D "disabled";
 +		 };
 +
+ 		vmmci: regulator-gpio {
+ 			compatible =3D "regulator-gpio";
+=20
+ 			regulator-min-microvolt =3D <1800000>;
+ 			regulator-max-microvolt =3D <2600000>;
+ 			regulator-name =3D "mmci-reg";
+ 			regulator-type =3D "voltage";
+=20
+ 			states =3D <1800000 0x1
+ 				  2900000 0x0>;
+=20
+ 			status =3D "disabled";
+ 		};
  	};
  };

--Signature=_Wed__28_Nov_2012_16_27_27_+1100__Q9r2zMSiUsefiq6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQtaC/AAoJEECxmPOUX5FEnQkP/jeKT6igWJASWh03bAb1mte2
3U8vjbSnFWlv/SYDDsJAu+7zSvsveL2pnDeq70HmbZl73VJJBBBVXNH6F07Tkqpt
/7MyQQeGPQBwyDmKrlkWIyYjpqseS2t1caOBCiTKHeuYRmX8MZR04PzrUd6HdKRJ
qx04lIC2j+HGJtFy8S1KdtCs2JH/bowuX8AeUQ+iyjbK3pDWgk3iizZFgzDZWMPo
fDsQhB4RxE5z7rk31Qyn6xCOROwodOZaQmNls5U0MJgRIfhHc6UD/bHrL2vgt8on
qxsphSZt1Kp92XTKfnrcJEdptSSijOyeuhku2ozzyNConSidkVbp8WmdmWRTFm3D
e6+QprRsdbfkvZx3eBAzceXsUOgUItiH/QdeJfxeKQnbubDEhihGVuNeeJn2SPd9
FXrEWkgnjcYll00OR8GegLYfPZldvKhzSiGe7rw4l93cQciWuS5QV3TsDXcPENTk
qObqDzHC/bBKO4aITocgHXMWwtwtJJOF/q7lR63e9tbVIOC4b6wd4Ge19MApXiFx
VicTcUQOExMVHo0BkchZ3HFbFlWOFJ7BQ6aDxivYiIi6z8y5kvd1ngoJF+QxxSTR
B9HxXxFiHMd1HO9UOl5wFGnU/g3Z3Prpq8KaplOSMsPiy9MmPnyyc0o+LzlxbWNh
+VUtVs/oPrtL2rYukCNW
=uShg
-----END PGP SIGNATURE-----

--Signature=_Wed__28_Nov_2012_16_27_27_+1100__Q9r2zMSiUsefiq6--


--===============4588721345742431443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4588721345742431443==--
