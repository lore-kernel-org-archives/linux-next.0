From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the arm-current tree
Date: Wed, 18 Apr 2018 13:31:55 +1000
Message-ID: <20180418133155.0931baf7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Y3hgY4AeRmmxpTuTCb=qRl2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <rmk@armlinux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: linux-next.vger.kernel.org

--Sig_/Y3hgY4AeRmmxpTuTCb=qRl2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Russell,

After merging the arm-current tree, today's linux-next build
(lots of configs) failed like this:

/bin/sh: 1: arithmetic expression: expecting primary: " "
(lots of these)

Caused by commit

  fe680ca02c1e ("ARM: replace unnecessary perl with sed and the shell $(( )=
) operator")

(pointed out by Michael Ellerman)

Our /bin/sh is dash not bash ...

--=20
Cheers,
Stephen Rothwell

--Sig_/Y3hgY4AeRmmxpTuTCb=qRl2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrWvCsACgkQAVBC80lX
0GwXUgf9G06XjDPKVrEcDo+cs4LQk7TU0o3/ZNzHtILTXpt4cnQZeWLXpGvwDSEk
JxPjqFp/VHmHZDRkI1mr/Pxvc8Pu5PACZXonKF6yh2SlDgXrm8imGPLampWA4HlQ
O5nFa8zEyYvLPxvY8NaU9v+jxDdg6UH5yPHg7/f6QuU/zxiqdcRW1fgbOqVT6Ede
+VUIgvh88HVn8WAOKRmDs8MwZ3kwzCSquooL/qkkZYqZ6fYePeqVRaspUwzExAwM
KfkQx1oMtsJphIj7iDj7sBApudND5rSWnkcIuEGp5ctAdeaTwvKw4FZeQ9nO5mUt
1sGKil1QRXp8D8XKkl2plZFHrRX4Qw==
=4V5q
-----END PGP SIGNATURE-----

--Sig_/Y3hgY4AeRmmxpTuTCb=qRl2--
