From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the qcom tree
Date: Tue, 29 Jan 2019 14:08:46 +1100
Message-ID: <20190129140846.4dc4c158@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CZfcs.RrhR6kzgnlCitpHrj"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Andy Gross <andy.gross@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Dai <daidavid1@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: linux-next.vger.kernel.org

--Sig_/CZfcs.RrhR6kzgnlCitpHrj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  arch/arm64/boot/dts/qcom/sdm845.dtsi

between commits:

  05556681948b ("arm64: dts: sdm845: Add videocc node")
  5b6f186f0abb ("arm64: dts: sdm845: Add rpmh powercontroller node")

from the qcom tree and commit:

  ae0037dbfc5e ("arm64: dts: sdm845: Add interconnect provider DT nodes")

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

diff --cc arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0ec827394e92,5179cb94c95b..000000000000
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@@ -7,16 -7,13 +7,17 @@@
 =20
  #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 +#include <dt-bindings/clock/qcom,gpucc-sdm845.h>
 +#include <dt-bindings/clock/qcom,lpass-sdm845.h>
  #include <dt-bindings/clock/qcom,rpmh.h>
 +#include <dt-bindings/clock/qcom,videocc-sdm845.h>
+ #include <dt-bindings/interconnect/qcom,sdm845.h>
  #include <dt-bindings/interrupt-controller/arm-gic.h>
  #include <dt-bindings/phy/phy-qcom-qusb2.h>
 +#include <dt-bindings/power/qcom-rpmpd.h>
  #include <dt-bindings/reset/qcom,sdm845-aoss.h>
 +#include <dt-bindings/reset/qcom,sdm845-pdc.h>
  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 -#include <dt-bindings/clock/qcom,gcc-sdm845.h>
 =20
  / {
  	interrupt-parent =3D <&intc>;
@@@ -2075,55 -1604,10 +2076,60 @@@
  				#clock-cells =3D <1>;
  			};
 =20
 +			rpmhpd: power-controller {
 +				compatible =3D "qcom,sdm845-rpmhpd";
 +				#power-domain-cells =3D <1>;
 +				operating-points-v2 =3D <&rpmhpd_opp_table>;
 +
 +				rpmhpd_opp_table: opp-table {
 +					compatible =3D "operating-points-v2";
 +
 +					rpmhpd_opp_ret: opp1 {
 +						opp-level =3D <RPMH_REGULATOR_LEVEL_RETENTION>;
 +					};
 +
 +					rpmhpd_opp_min_svs: opp2 {
 +						opp-level =3D <RPMH_REGULATOR_LEVEL_MIN_SVS>;
 +					};
 +
 +					rpmhpd_opp_low_svs: opp3 {
 +						opp-level =3D <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 +					};
 +
 +					rpmhpd_opp_svs: opp4 {
 +						opp-level =3D <RPMH_REGULATOR_LEVEL_SVS>;
 +					};
 +
 +					rpmhpd_opp_svs_l1: opp5 {
 +						opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
 +					};
 +
 +					rpmhpd_opp_nom: opp6 {
 +						opp-level =3D <RPMH_REGULATOR_LEVEL_NOM>;
 +					};
 +
 +					rpmhpd_opp_nom_l1: opp7 {
 +						opp-level =3D <RPMH_REGULATOR_LEVEL_NOM_L1>;
 +					};
 +
 +					rpmhpd_opp_nom_l2: opp8 {
 +						opp-level =3D <RPMH_REGULATOR_LEVEL_NOM_L2>;
 +					};
 +
 +					rpmhpd_opp_turbo: opp9 {
 +						opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO>;
 +					};
 +
 +					rpmhpd_opp_turbo_l1: opp10 {
 +						opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L1>;
 +					};
 +				};
 +			};
++
+ 			rsc_hlos: interconnect {
+ 				compatible =3D "qcom,sdm845-rsc-hlos";
+ 				#interconnect-cells =3D <1>;
+ 			};
  		};
 =20
  		intc: interrupt-controller@17a00000 {

--Sig_/CZfcs.RrhR6kzgnlCitpHrj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxPw74ACgkQAVBC80lX
0GwzuwgAhZYufATKQCwwILOAX/aMZ3vWJhPI1Dk9GbyvzZ6iCmx+A5F+RkM+f5WB
0DlgrHQc9GNRNvHHYHqLkkDXqjLMocOl5ASTjwKbOBsIAaCsgDRfYZLNIr/hsKaY
fqZCTKHGjMm7ObQmdfbjjtyLTGdgGFGu+4gxPQkhBTtZf/pvHpQ/fjQ1Aolwwzjo
nNo7XzprrYQsPEGEXokP2jxtXB1SKutPjy/70zohKMiUytr0E26OqE6tN+nT3Hak
P9/hpXHJj6pNwZZWbFdVv0hdODtkSoLmXqi75gtLjX7mYxhCC969xYwiO/IF/Zu9
5k1zl9VzvKMfb4BCC2IJ7gCUmwJ/Nw==
=BYPh
-----END PGP SIGNATURE-----

--Sig_/CZfcs.RrhR6kzgnlCitpHrj--
