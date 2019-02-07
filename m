From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the qcom tree
Date: Fri, 8 Feb 2019 00:47:21 +1100
Message-ID: <20190208004721.129a9eb7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BjaIFSiDSbYLuTTzOa_Sn9a"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/BjaIFSiDSbYLuTTzOa_Sn9a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andy,

In commit

  761f63b2ff21 ("arm64: dts: sdm845: Add clocks and iommus to WCN3990 WLAN =
node")

Fixes tag

  Fixes: be7019103469 ("dts: arm64/sdm845: Add WCN3990 WLAN module device n=
ode")

has these problem(s):

  - Target SHA1 does not exist

Did you mean:

  022bccb840b7 ("arm64: dts: sdm845: Add WCN3990 WLAN module device node")

--=20
Cheers,
Stephen Rothwell

--Sig_/BjaIFSiDSbYLuTTzOa_Sn9a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxcNukACgkQAVBC80lX
0GyegAgAmfcukKZOJpy0z7Ung0nahPqBX5T6Tb5PVnrPei0EY/d/9/EzSlNYR47n
diYx6t/sdGC+5OnSy4Xqm18oX22bny8mqolIaf2DnTs1GIqUScssWAFNwuy/GNsI
oEXZocBhE457HqEmch8rvLnTIZj/JWES1qwt98/QMbPh4Uo8Hfg0/HWDAK3LPpZ9
4I+oGW9fm4NezXv543Hd5iNLtljRr+Pb3h5XbDwjA/1/L6C1izwLz9esRlGsAX1U
1A/ixluZTaZ1DwhcB8X+bYzVLJp4o27Ox2YLSus0vsrkDmlRzyiHurHZAs7uWo5i
ABmaMIsxek9VMf09YeTka+VCXubPPQ==
=iq23
-----END PGP SIGNATURE-----

--Sig_/BjaIFSiDSbYLuTTzOa_Sn9a--
