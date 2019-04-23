From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the qcom tree
Date: Wed, 24 Apr 2019 09:25:31 +1000
Message-ID: <20190424092531.3988850d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MdrnBC5ykLaNcA9m6R7BzHc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/MdrnBC5ykLaNcA9m6R7BzHc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the qcom tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/boot/dts/qcom-apq8064.dtsi:1297.29-1309.5: ERROR (phandle_referenc=
es): /soc/dsi-phy@4700200: Reference to non-existent node or label "xo_boar=
d"

Caused by commit

  3560af5a56b5 ("ARM: dts: qcom-apq8064: Set 'xo_board' as ref clock of the=
 DSI PHY")

I have used the version of the qcom tree from next-20190423 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/MdrnBC5ykLaNcA9m6R7BzHc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly/nusACgkQAVBC80lX
0GyOhggAjtHMOWN14OpkY33HFFHGlnXt2JzrszGAisrqemEBqnhfJ0AhY9Ez0Elc
De8ThAyuJORxb1mcRatYHDspGKFs9jc2/jot9F1E4rqnyqlAR+hAJNiRPqQMkJuL
3KkKfEy74BNMImuF6YGet3be1nZGMekezpxAu33U/kBGsGqmaMLcTo+/zxfuPfVn
YN2PjeAuyWB02Ur2JQ3P/hz7eTGaBh6/xMLQtBlLo5soZeQt40uezQh/zKq66qRa
U78VjHAubuATRvZzuPQ3IyCjXKNatzNNx8+xGDwIWCEjymX7TVlsr1K+fLDqob4a
oPiKsGXVhnhtcgPBbGgK9OW+ptQ0qQ==
=qdUn
-----END PGP SIGNATURE-----

--Sig_/MdrnBC5ykLaNcA9m6R7BzHc--
