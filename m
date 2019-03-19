From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Wed, 20 Mar 2019 10:45:02 +1100
Message-ID: <20190320104502.29d22b96@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KUo4UheB7.tCZKCPkEosc3O"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Wen Shi <wenshi@opensource.cirrus.com>
List-Id: linux-next.vger.kernel.org

--Sig_/KUo4UheB7.tCZKCPkEosc3O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/pm_runtime.h:12,
                 from sound/soc/codecs/wm_adsp.c:21:
sound/soc/codecs/wm_adsp.c: In function 'wmfw_parse_id_header':
sound/soc/codecs/wm_adsp.c:45:22: warning: format '%zu' expects argument of=
 type 'size_t', but argument 8 has type 'int' [-Wformat=3D]
  dev_info(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
                      ^~~~~~
include/linux/device.h:1400:22: note: in definition of macro 'dev_fmt'
 #define dev_fmt(fmt) fmt
                      ^~~
sound/soc/codecs/wm_adsp.c:45:2: note: in expansion of macro 'dev_info'
  dev_info(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
  ^~~~~~~~
sound/soc/codecs/wm_adsp.c:2145:2: note: in expansion of macro 'adsp_info'
  adsp_info(dsp, "Firmware: %x v%d.%d.%d, %zu algorithms\n",
  ^~~~~~~~~
sound/soc/codecs/wm_adsp.c:2145:44: note: format string is defined here
  adsp_info(dsp, "Firmware: %x v%d.%d.%d, %zu algorithms\n",
                                          ~~^
                                          %u
In file included from include/linux/pm_runtime.h:12,
                 from sound/soc/codecs/wm_adsp.c:21:
sound/soc/codecs/wm_adsp.c: In function 'wmfw_v3_parse_id_header':
sound/soc/codecs/wm_adsp.c:45:22: warning: format '%zu' expects argument of=
 type 'size_t', but argument 9 has type 'int' [-Wformat=3D]
  dev_info(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
                      ^~~~~~
include/linux/device.h:1400:22: note: in definition of macro 'dev_fmt'
 #define dev_fmt(fmt) fmt
                      ^~~
sound/soc/codecs/wm_adsp.c:45:2: note: in expansion of macro 'dev_info'
  dev_info(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
  ^~~~~~~~
sound/soc/codecs/wm_adsp.c:2158:2: note: in expansion of macro 'adsp_info'
  adsp_info(dsp, "Firmware: %x vendor: 0x%x v%d.%d.%d, %zu algorithms\n",
  ^~~~~~~~~
sound/soc/codecs/wm_adsp.c:2158:57: note: format string is defined here
  adsp_info(dsp, "Firmware: %x vendor: 0x%x v%d.%d.%d, %zu algorithms\n",
                                                       ~~^
                                                       %u

Introduced by commits

  a5dcb24d70ff ("ASoC: wm_adsp: Factor out parsing of firmware ID header")
  170b1e123f38 ("ASoC: wm_adsp: Add support for new Halo core DSPs")

--=20
Cheers,
Stephen Rothwell

--Sig_/KUo4UheB7.tCZKCPkEosc3O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyRfv4ACgkQAVBC80lX
0GwIhAgAix2SPD+KLayj90+ET1qt9404kvtE7GMDzX5scOQnllo4WhRQjYoQaiey
QpJ/Jenor+SO7FtsGiETefBuU7Tgywl7tECd/A3h0fMu4fb0WLHfkIuiL/E0f74u
1Z0uV2AZCq0q1RrXaaWI43frBuSMJz94EN5KlafAnhTfc9Mqa1ZKFX89gDgRgveN
HuyyCIKdbMzQToThjesRKW/+wVQfAyXdJjM+Ip6kV2ipe4VGtG9vB0k03v3IeCbl
nqNMIbHEcOe7St7kEoGiJEUIX5XpWZIMyl5ear3g2jP1UNNwEH0QxfegVmEp/WGc
ae5ieG63wOgbt8tOk4C6fOymuHpW1w==
=6O7Y
-----END PGP SIGNATURE-----

--Sig_/KUo4UheB7.tCZKCPkEosc3O--
