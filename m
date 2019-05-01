From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the input tree with the arm-soc tree
Date: Wed, 1 May 2019 13:40:54 +1000
Message-ID: <20190501134054.4271616e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UWQNxjObisc6mUEj5M3b=YF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgUMOp?= =?UTF-8?B?cm9u?= <peron.clem@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Jeff LaBundy <jeff@labundy.com>
List-Id: linux-next.vger.kernel.org

--Sig_/UWQNxjObisc6mUEj5M3b=YF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Today's linux-next merge of the input tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.txt

between commit:

  2c98d9e47533 ("dt-bindings: vendor-prefixes: add AZW")

from the arm-soc tree and commit:

  7b5bb55d0dad ("Input: add support for Azoteq IQS550/572/525")

from the input tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/vendor-prefixes.txt
index 5f2b185a04e6,51f99549161e..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@@ -54,7 -53,7 +54,8 @@@ avic	Shanghai AVIC Optoelectronics Co.
  avnet	Avnet, Inc.
  axentia	Axentia Technologies AB
  axis	Axis Communications AB
+ azoteq	Azoteq (Pty) Ltd
 +azw     Shenzhen AZW Technology Co., Ltd.
  bananapi BIPAI KEJI LIMITED
  bhf	Beckhoff Automation GmbH & Co. KG
  bitmain	Bitmain Technologies

--Sig_/UWQNxjObisc6mUEj5M3b=YF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzJFUYACgkQAVBC80lX
0GwG8gf+PSn5NwiucS2UN3Q5cHfZXRaTVQjB78Dkpj3XTPbyFqg7SVpsas3Ct9Ns
8OjTx6pYCJp1tWvhxYAwqRVqETe9NmBDB3o4Xh9yOnqim16XqjihKG9dI8zGnpGC
hRvvtAYJA4cRK8vvfjJyH+AEakSdAsxeMT2f4ga0EiRbJzqA+w1xXANhPJaCb8i/
IbfkkIJlm7BBDFASt8ffm20NZPBLCgw6W+FgwztU6YRT2GI+d1wxO+ntlAncoFtt
5c6Rd4n0RVLoZk6zXXA/20Vbb/8C0hIa/QlGX9zOHykOb2dzAEIlBJ4eR41+gmo/
M/lYHoOjepSUO1R3PU9dCCguMDsalg==
=tn9Y
-----END PGP SIGNATURE-----

--Sig_/UWQNxjObisc6mUEj5M3b=YF--
