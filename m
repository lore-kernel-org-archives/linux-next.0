From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 17 Apr 2018 11:02:32 +1000
Message-ID: <20180417110232.19225908@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ah7BZ6fB0KAVxG=rOF2nG+x"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shuming Fan <shumingf@realtek.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ah7BZ6fB0KAVxG=rOF2nG+x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/codecs/rt1305.c:1179:23: error: implicit declaration of function =
'ACPI_PTR'; did you mean 'ERR_PTR'? [-Werror=3Dimplicit-function-declaratio=
n]
   .acpi_match_table =3D ACPI_PTR(rt1305_acpi_match)
                       ^~~~~~~~
                       ERR_PTR
sound/soc/codecs/rt1305.c:1179:23: warning: initialization makes pointer fr=
om integer without a cast [-Wint-conversion]
sound/soc/codecs/rt1305.c:1179:23: note: (near initialization for 'rt1305_i=
2c_driver.driver.acpi_match_table')
sound/soc/codecs/rt1305.c:1179:23: error: initializer element is not consta=
nt
sound/soc/codecs/rt1305.c:1179:23: note: (near initialization for 'rt1305_i=
2c_driver.driver.acpi_match_table')

Caused by commit

  29bc643ddd7e ("ASoC: rt1305: Add RT1305/RT1306 amplifier driver")

I have used the sound-asoc tree from next-20180416 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ah7BZ6fB0KAVxG=rOF2nG+x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrVR6gACgkQAVBC80lX
0Gw4bwf/Zn6nbHIe4ozQsNhKJZP9P5bTUdzMDcTW1E4KsmExP8D8DSJ2q3HCyq4A
zj1t+278PlDtWqaM6SwKqQ7+FoUgcOvL3n6kV33lGAHIrJVhF8FEMLlTwqTzq8UB
OAcdUpvu6xIfVlHjnSSDEK7x7QMgTBk9xfqPnvY+OCjmjT2AA1n4b6yZ0l6wHbef
YAeYpNy44ftdgWsFz5w8I96MP8MsUiUcpm3hMQWZluaE3t1FRX548NhtX9D61+45
Pxl8cez/wC6pla7PtpCsWOymJcsBWaKadTTRVUI76lpy6AzLdVfC1vF0fikXV8KM
yB7ffNX5g0sEj4Yt9l3txjXNOeN8fQ==
=p2VR
-----END PGP SIGNATURE-----

--Sig_/ah7BZ6fB0KAVxG=rOF2nG+x--
