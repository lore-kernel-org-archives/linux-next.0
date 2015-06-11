From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the edac-amd tree with the pci tree
Date: Thu, 11 Jun 2015 15:28:53 +1000
Message-ID: <20150611152853.4102c2f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/l/eVeTbkTU1vasAxC8uCNXM"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54908 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750904AbbFKF3D (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Jun 2015 01:29:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Duc Dang <dhdang@apm.com>, Loc Ho <lho@apm.com>, Tanmay Inamdar <tinamdar@apm.com>

--Sig_/l/eVeTbkTU1vasAxC8uCNXM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

Today's linux-next merge of the edac-amd tree got a conflict in
arch/arm64/boot/dts/apm/apm-storm.dtsi between commit e1e6e5c4de24
("arm64: dts: Add APM X-Gene PCIe MSI nodes") from the  tree and commit
8f2ae6f30d5e ("arm64: Add APM X-Gene SoC EDAC DTS entries") from the
edac-amd tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm64/boot/dts/apm/apm-storm.dtsi
index d8f3a1c65ecd,577799f0c5a3..000000000000
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@@ -374,28 -374,89 +374,111 @@@
  			};
  		};
 =20
 +		msi: msi@79000000 {
 +			compatible =3D "apm,xgene1-msi";
 +			msi-controller;
 +			reg =3D <0x00 0x79000000 0x0 0x900000>;
 +			interrupts =3D <  0x0 0x10 0x4
 +					0x0 0x11 0x4
 +					0x0 0x12 0x4
 +					0x0 0x13 0x4
 +					0x0 0x14 0x4
 +					0x0 0x15 0x4
 +					0x0 0x16 0x4
 +					0x0 0x17 0x4
 +					0x0 0x18 0x4
 +					0x0 0x19 0x4
 +					0x0 0x1a 0x4
 +					0x0 0x1b 0x4
 +					0x0 0x1c 0x4
 +					0x0 0x1d 0x4
 +					0x0 0x1e 0x4
 +					0x0 0x1f 0x4>;
 +		};
 +
+ 		csw: csw@7e200000 {
+ 			compatible =3D "apm,xgene-csw", "syscon";
+ 			reg =3D <0x0 0x7e200000 0x0 0x1000>;
+ 		};
+=20
+ 		mcba: mcba@7e700000 {
+ 			compatible =3D "apm,xgene-mcb", "syscon";
+ 			reg =3D <0x0 0x7e700000 0x0 0x1000>;
+ 		};
+=20
+ 		mcbb: mcbb@7e720000 {
+ 			compatible =3D "apm,xgene-mcb", "syscon";
+ 			reg =3D <0x0 0x7e720000 0x0 0x1000>;
+ 		};
+=20
+ 		efuse: efuse@1054a000 {
+ 			compatible =3D "apm,xgene-efuse", "syscon";
+ 			reg =3D <0x0 0x1054a000 0x0 0x20>;
+ 		};
+=20
+ 		edac@78800000 {
+ 			compatible =3D "apm,xgene-edac";
+ 			#address-cells =3D <2>;
+ 			#size-cells =3D <2>;
+ 			ranges;
+ 			regmap-csw =3D <&csw>;
+ 			regmap-mcba =3D <&mcba>;
+ 			regmap-mcbb =3D <&mcbb>;
+ 			regmap-efuse =3D <&efuse>;
+ 			reg =3D <0x0 0x78800000 0x0 0x100>;
+ 			interrupts =3D <0x0 0x20 0x4>,
+ 				     <0x0 0x21 0x4>,
+ 				     <0x0 0x27 0x4>;
+=20
+ 			edacmc@7e800000 {
+ 				compatible =3D "apm,xgene-edac-mc";
+ 				reg =3D <0x0 0x7e800000 0x0 0x1000>;
+ 				memory-controller =3D <0>;
+ 			};
+=20
+ 			edacmc@7e840000 {
+ 				compatible =3D "apm,xgene-edac-mc";
+ 				reg =3D <0x0 0x7e840000 0x0 0x1000>;
+ 				memory-controller =3D <1>;
+ 			};
+=20
+ 			edacmc@7e880000 {
+ 				compatible =3D "apm,xgene-edac-mc";
+ 				reg =3D <0x0 0x7e880000 0x0 0x1000>;
+ 				memory-controller =3D <2>;
+ 			};
+=20
+ 			edacmc@7e8c0000 {
+ 				compatible =3D "apm,xgene-edac-mc";
+ 				reg =3D <0x0 0x7e8c0000 0x0 0x1000>;
+ 				memory-controller =3D <3>;
+ 			};
+=20
+ 			edacpmd@7c000000 {
+ 				compatible =3D "apm,xgene-edac-pmd";
+ 				reg =3D <0x0 0x7c000000 0x0 0x200000>;
+ 				pmd-controller =3D <0>;
+ 			};
+=20
+ 			edacpmd@7c200000 {
+ 				compatible =3D "apm,xgene-edac-pmd";
+ 				reg =3D <0x0 0x7c200000 0x0 0x200000>;
+ 				pmd-controller =3D <1>;
+ 			};
+=20
+ 			edacpmd@7c400000 {
+ 				compatible =3D "apm,xgene-edac-pmd";
+ 				reg =3D <0x0 0x7c400000 0x0 0x200000>;
+ 				pmd-controller =3D <2>;
+ 			};
+=20
+ 			edacpmd@7c600000 {
+ 				compatible =3D "apm,xgene-edac-pmd";
+ 				reg =3D <0x0 0x7c600000 0x0 0x200000>;
+ 				pmd-controller =3D <3>;
+ 			};
+ 		};
+=20
  		pcie0: pcie@1f2b0000 {
  			status =3D "disabled";
  			device_type =3D "pci";

--Sig_/l/eVeTbkTU1vasAxC8uCNXM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVeRycAAoJEMDTa8Ir7ZwVnAkP/RgCsvbW4FQEvSlxUXRvRD0U
GAK0klmDT5AKiNBPlELpbXtkbtxEcFmTF428b4k8Dr6fuyZeZuVK0ZEJy49GtFdw
TXB5x6OBd1xeUeeo+KIW48G7ZUlOY4iAXCIHzwmvP+0aHi4JRWr+ZJ0xvtub199U
j/CqgLLttx6eLo/na+Agkfc34LbX1H3my+N5ZAMm/RNnouyqeqSsafOriBmAD86V
D85bXWFxhz+JfdyyH7cEkOFzwraPXUozz1F+hTIG2CNXJxWNSEwJIWqJ03HfyOHz
y+TKMjgNFdeBs/ZPXsJcaRiZHE6xJZUfNom7YYlHVhgplr/REnkOswCYUF7IO9Be
c7odVRuQX8LC+T58REFJw3F6I/khXqJd2DdjhFsJQzfxhCEj9dLz+/HHNsnxQn2g
XKrSh5e6/EwdOiOJxFPjOrqE9anzJ7XP4hJu1uv0LDtwSbLhjhVXwW7UYU85ttrw
eA1cw1AwLbh4yTP9xL+0t+7h6ZM8GG93YBCAf2yN8gIyoeBE3e3r4oFpdc+GbYj1
ZvnAjRWxPWE6prpMqcn13CYDhelqdZ/28zh4s1yMHQU/mA+V9g3h291qKo0am8f2
zOlhi9tcGXfuy4/nsGz1O8iNtbRruzWkaGVYRvYqfPCtGrxeJySG6rS3ymMtNPPb
YeoPGn6160P6z2ed4wSm
=5Dgy
-----END PGP SIGNATURE-----

--Sig_/l/eVeTbkTU1vasAxC8uCNXM--
