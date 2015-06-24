From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dt-rh tree with the arm-soc tree
Date: Wed, 24 Jun 2015 13:31:33 +1000
Message-ID: <20150624133133.435a979d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LZuNRPQ5fRjoS5OvSmZRMdO"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47480 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752099AbbFXDbj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Jun 2015 23:31:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Jun Nie <jun.nie@linaro.org>, Kevin Hilman <khilman@linaro.org>

--Sig_/LZuNRPQ5fRjoS5OvSmZRMdO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Today's linux-next merge of the dt-rh tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.txt

between commit:

  d5553cb05a04 ("ARM: dts: zx: add an initial zx296702 dts and doc")

from the arm-soc tree and commit:

  72d942e23cda ("of: Add vendor prefix for Zodiac Inflight Innovations")

from the dt-rh tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/devicetree/bindings/vendor-prefixes.txt
index a0aa80bb3480,c400c95abc67..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@@ -225,4 -211,4 +225,5 @@@ xillybus	Xillybus Ltd
  xlnx	Xilinx
  zyxel	ZyXEL Communications Corp.
  zarlink	Zarlink Semiconductor
+ zii	Zodiac Inflight Innovations
 +zte	ZTE Corp.

--Sig_/LZuNRPQ5fRjoS5OvSmZRMdO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJViiSZAAoJEMDTa8Ir7ZwV80gP/3IZaIsLujgJHeTsSOAs6aX1
jisUfZQ/ORb6hv66wqSO6lsbbxSIpD2IKp8P1VT3lM6r203TTak+WmD8Kin/+8s9
iYZo716us07qmCPDI85v90fO1cala+bLqxX5w/8QqHTyX/bi8kUXdg0VCpBqBa2c
x/Gaqh3idx+0IKeU9mX2PfXFDx6vqpetd1BFvMN+C+HgM4BmJnGFp9IotkM5i0mb
eCThququDbN2y7Uw4Z982/2v7DTrhuKljtHfxMH8GHL5BzSk7ueseiqa8z9sNnq8
Dp0aIDUaaiBOvn7ELstjA9GtIiTdlWtCvxhg3npHWlwp9F8zdYecoxQAqihbByt1
rBgV8UlDnV78q0mj63z9pK7XYP+NorfkWtdlkNyiDHeGBeejGPVoIlRm7JxSmE8K
NxqMfj3gzTuGorE8xjIygDo00SoBpr/XqdnwoW08ymDET6uOzWr+6Fem8EjsaJd5
AEmGZta6mji1zbxoGN8mnP7mTJrF50ACbdImN7FLgCXfR3AkY+udBs3KqBUn44BN
bkw2wBSLFI2L2S58XWIJPg2VXuLj/wzhs8I9TvwYW2Oc2mGx+eFA6ZVjKeg/hP6Q
h1lwZR9vM75EhmWKRJKn3XwMDlu2Z3iVQUC9g+UDPpfUIwvo+r0vWBo/w837anxq
1DHXzRVrPmKvfVElnmrA
=Bpol
-----END PGP SIGNATURE-----

--Sig_/LZuNRPQ5fRjoS5OvSmZRMdO--
