From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the regulator tree
Date: Tue, 20 Nov 2018 11:49:04 +1100
Message-ID: <20181120114904.10ef0573@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/X1cY5X_AX8RQn72FrFZW0m."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/X1cY5X_AX8RQn72FrFZW0m.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the regulator tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "regulator_lock" [drivers/regulator/wm8350-regulator.ko] undefined!
ERROR: "regulator_unlock" [drivers/regulator/wm8350-regulator.ko] undefined!
ERROR: "regulator_unlock" [drivers/regulator/da9210-regulator.ko] undefined!
ERROR: "regulator_lock" [drivers/regulator/da9210-regulator.ko] undefined!

Caused by commit

  f8702f9e4aa7 ("regulator: core: Use ww_mutex for regulators locking")

I have used the regulator tree from next-20181119 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/X1cY5X_AX8RQn72FrFZW0m.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvzWgAACgkQAVBC80lX
0GxYuAgAm9jNAru0Hzh/iIvdvsVVHHnMJ5nc40fsTEzlRW25XF9jX0R0D1P0gn8m
8AV/9u6eJOXhlN/rL1akeS4dusLUZyFVaj7DivyrdX7XFJXzAErqaZsjc9q0kAat
D2KPxhy43B4qMrVD9Fi4gxVwAnAJPept8jxt+yLxXLuta+Vz0J2Kt0+rQOsCz7am
l3g4SaoPSd2Z0Ceg7FS/vnyScoooGnUR6DvcPyxk7hYAtGtKKnxxjBg5wzM0Sjb0
6eVXJDPEpqDyJickqrYEyCp5yGEGf4a0++fMq29igGRnTQW0mdaA2nGagqQYhAvf
tZQ4F+YRv28s6BL2dfSYmA3ZxVOQJA==
=Epmi
-----END PGP SIGNATURE-----

--Sig_/X1cY5X_AX8RQn72FrFZW0m.--
