From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the phy-next tree with the qcom tree
Date: Thu, 18 Apr 2019 15:29:54 +1000
Message-ID: <20190418152954.255015e1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/S2ux4pHhYr8mbIa=z2S4lT."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <andy.gross@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>
List-Id: linux-next.vger.kernel.org

--Sig_/S2ux4pHhYr8mbIa=z2S4lT.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt

between commit:

  369b89366a3d ("dt-bindings: phy-qcom-qmp: Tweak qcom,msm8998-qmp-ufs-phy")

from the qcom tree and commit:

  2815588ea64b ("dt-bindings: phy-qcom-qmp: Add qcom,msm8998-qmp-pcie-phy")

from the phy-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index d882e40c3bd9,5fca57b12534..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@@ -69,8 -73,9 +73,10 @@@ Required properties
  			"phy", "common".
  		For "qcom,msm8998-qmp-usb3-phy" must contain
  			"phy", "common".
 -		For "qcom,msm8998-qmp-ufs-phy": no resets are listed.
 +		For "qcom,msm8998-qmp-ufs-phy": must contain:
 +			"ufsphy".
+ 		For "qcom,msm8998-qmp-pcie-phy" must contain:
+ 			"phy", "common".
  		For "qcom,sdm845-qmp-usb3-phy" must contain:
  			"phy", "common".
  		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:

--Sig_/S2ux4pHhYr8mbIa=z2S4lT.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly4C1IACgkQAVBC80lX
0GzEfQf/bzGGfC1oMJs1GmG7eFhgx7+oPWs1YbJXrjPoW+6oKceUcTntVG+0KclN
7M6r5BSsa5TtiZKzVy1BCyt4jGDPCzyvlRE6BMhE5BRHKU0GnrJNyeAyryueKry+
CP6rzdE+dvkLV/XzfFLiFfShnnCCVgmmIuluRh9ayEmVn7Z5fUNPfAsin7PLpeqp
EzZ/5aGv6HbZkxi8zcF5Zi6BEMGpYYUG/lJwlI0J8gcF4gO8frdSEZ8UY3ZjWtvd
XguluF3UVuXT24VWvPfsHGCMBdPIKfynepr7H00KgYKDMWTFjYaoCKghopDomaAz
ksyA2Z5MafMgGDYbppqlN3AxPF+07g==
=kj61
-----END PGP SIGNATURE-----

--Sig_/S2ux4pHhYr8mbIa=z2S4lT.--
