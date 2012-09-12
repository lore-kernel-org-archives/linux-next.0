From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with Linus' tree
Date: Wed, 12 Sep 2012 12:49:34 +1000
Message-ID: <20120912124934.8cdbf432ad630e200b0b7300@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__12_Sep_2012_12_49_34_+1000_D/7nihVkY0MVQPiq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:48687 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757178Ab2ILCtt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Sep 2012 22:49:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Bill Huang <bilhuang@nvidia.com>

--Signature=_Wed__12_Sep_2012_12_49_34_+1000_D/7nihVkY0MVQPiq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

Today's linux-next merge of the mfd tree got a conflict in
Documentation/devicetree/bindings/regulator/tps6586x.txt between commit
7f852e0584f6 ("regulator: tps6586x: correct vin pin for sm0/sm1/sm2")
from Linus' tree and commit 566a725dff0d ("mfd: dt: tps6586x: Add power
off control") from the mfd tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/devicetree/bindings/regulator/tps6586x.txt
index da80c2a,03dfa4e..0000000
--- a/Documentation/devicetree/bindings/regulator/tps6586x.txt
+++ b/Documentation/devicetree/bindings/regulator/tps6586x.txt
@@@ -30,9 -34,11 +34,11 @@@ Example
  		#gpio-cells =3D <2>;
  		gpio-controller;
 =20
+ 		ti,system-power-controller;
+=20
 -		sm0-supply =3D <&some_reg>;
 -		sm1-supply =3D <&some_reg>;
 -		sm2-supply =3D <&some_reg>;
 +		vin-sm0-supply =3D <&some_reg>;
 +		vin-sm1-supply =3D <&some_reg>;
 +		vin-sm2-supply =3D <&some_reg>;
  		vinldo01-supply =3D <...>;
  		vinldo23-supply =3D <...>;
  		vinldo4-supply =3D <...>;

--Signature=_Wed__12_Sep_2012_12_49_34_+1000_D/7nihVkY0MVQPiq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQT/g+AAoJEECxmPOUX5FEzvQQAJc2Yhrz/JbTGOR06fs0g9nS
aVZuemuiMYSVVW5QfUyykyxFSnoeHEV/8zRZsRiwi240jY3Y2/OZ1giGcsozilvw
SFSlNy69nlr9ZY7Y3Fdxz4gCaxL5CPWBQWP1VdoqVG6qSiNvvgUgnJw/Iwa8xRDU
ZQ+0Xtk803iQlMXWupbqBfuow9L+lN3CmI83rXZLryyKh6t+9x0HhQZ/62QZL5HT
4OHmt6s4LIsvrzB7cmQqy0qWcuPpG7mRjCNaFzs6I0qrjSueyVisSUVICrS/w8nr
M1zzcvv7ztQ7Lc74GbStHkvKTdjrQ0ZZakw76rPrjUPs+vbSUVGxIW5mN6ttQMeA
uRKINMiec/qqfG9Vc0KnScq1em4a8L0mqIcZ8xsl6lT2+aYZt9An8t30Kv64vdkN
RodowVsQ7ygSG9ezFQt7alRgGhAROOoMyMSyMDfgQUBpIB+cHwIS9p0JezlrCQx2
nPaqxFQChpK8YtWHWQOhAJLRBDGkw/9wiP9S5qr9waul5JrywbHy14+qmFa/mmZK
dnCJ5FaFtGwF5/DHrSMb/nvDejkQCxQa1n+P7em9VVKlVEvSDAHiS023qW1MJ7dd
PxzmMBa2jAKUFnPjMlGcyGVM5/2du050upGA0VBppWk9W1sJpy1iPNKPAallRJr0
Q4815x3IjoprxKdYVRXD
=g8ZU
-----END PGP SIGNATURE-----

--Signature=_Wed__12_Sep_2012_12_49_34_+1000_D/7nihVkY0MVQPiq--
