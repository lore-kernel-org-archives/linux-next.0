From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the spi tree
Date: Thu, 10 Jan 2019 11:44:31 +1100
Message-ID: <20190110114431.65b7b129@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Xard+V.h9zHArzGvbhRjPfC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Xard+V.h9zHArzGvbhRjPfC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/spi/spi-dw.c: In function 'dw_spi_setup':
drivers/spi/spi-dw.c:400:6: warning: unused variable 'ret' [-Wunused-variab=
le]
  int ret;
      ^~~

Introduced by commit

  9400c41e77b8 ("spi: dw: Convert to use CS GPIO descriptors")

--=20
Cheers,
Stephen Rothwell

--Sig_/Xard+V.h9zHArzGvbhRjPfC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw2lW8ACgkQAVBC80lX
0Gw74wf8Cz5yhnUCwf8fKE03AAZCPU6eoWbUsfyOZ1bJ+YktWl1jOf2ccSR9PJo9
7s+2+UiNSkea8+hEDqU6wT9cEg1JrgFSgskQoxAIyAjQhhtX4O11Bx8Q6BHhSWB9
usoKEhtCsZ9LIeoNXcZhyGpGyeQqhnjbUZ80Sr/UwLV4j3Twy37QlshVkCpXfp0F
2pW182rqy2bZT9T99+cWrohQhK8lRsbO2bCi0krlomR91+LBfQuY+TzSV2a22kG7
YJ+zBxBJFT3Nn7Obl0LsGBT4L9ZmxOkCtqQqphPzwWx/wTYr7U9TPT4MQo3y9+3u
y7wEm/jcB6PIhlZyTtcMHmnUpKxBsg==
=ehQA
-----END PGP SIGNATURE-----

--Sig_/Xard+V.h9zHArzGvbhRjPfC--
