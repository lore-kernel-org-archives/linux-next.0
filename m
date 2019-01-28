From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Date: Tue, 29 Jan 2019 07:27:14 +1100
Message-ID: <20190129072714.6a5f4a95@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VAP5OkJHrwINr4TkJTvehOP"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-next.vger.kernel.org

--Sig_/VAP5OkJHrwINr4TkJTvehOP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  720734a0b66f ("ASoC: soc-core: use for_each_link_codecs() for dai_link co=
decs V2")

Fixes tag

  Fixes: 50acc7e49 ("ASoC: core: Fix multi-CODEC setups")

has these problem(s):

  - Target SHA1 does not exist

Maybe commit 3f6a125230d8bfcbfe0c06ff0b8eaccbc727acd7?

Fixes tag

  Fixes: 10dff9b0d ("ASoC: soc-core: use for_each_link_codecs() for dai_lin=
k codecs")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  141474c6ac7f ("ASoC: Fixup build error for mt6358")

Fixes tag

  Fixes: commit 6a8d4198ca8 ("ASoC: mediatek: mt6358: add codec driver")

has these problem(s):

  - leading word 'commit' unexpected
  - SHA1 should be at least 12 digits long

--=20
Cheers,
Stephen Rothwell

--Sig_/VAP5OkJHrwINr4TkJTvehOP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxPZaIACgkQAVBC80lX
0GwCaAf/RMLiCOcx7j6Yq2GttU3Jq7HypxQvKN8Ywj0sMnBUBLySrSiLn4fUttlo
OaZ6pAUpHuPM/A1W5/LIyv3+25PU8/W4S40ifjeWjlzbc+y8Bclqgq2o5eSUQvSf
NbiRtf6riLYYllO6cAZ0qiOLlKiG4PywEV9TUj8P1kAgW+Bd0y00GNbip6Mgc6Wa
rUQLgP9hpT1KMq/6BIBlRAesZHcATVyuUwDOfCRu+2Hcvg7LJ3GbXhaBPULBVMUW
ywPk8Cvujo9dSLxktVXE8o0HNsYatlfCl1wIHauMrwDoYih3mg9TaIrgCIqPA7xG
OHG1ijjrbyUh0BxIeqI09DlEhCu+0A==
=B4pV
-----END PGP SIGNATURE-----

--Sig_/VAP5OkJHrwINr4TkJTvehOP--
