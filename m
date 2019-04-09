From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Tue, 9 Apr 2019 11:46:25 +1000
Message-ID: <20190409114625.7bd282f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MP1ZEC1DMNnGhlx0NgPyzjm"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>
List-Id: linux-next.vger.kernel.org

--Sig_/MP1ZEC1DMNnGhlx0NgPyzjm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/intel/boards/bytcht_es8316.c: In function 'snd_byt_cht_es8316_mc_=
probe':
sound/soc/intel/boards/bytcht_es8316.c:508:11: warning: cast from pointer t=
o integer of different size [-Wpointer-to-int-cast]
   quirk =3D (int)dmi_id->driver_data;
           ^

Introduced by commit

  a8d218f4fe81 ("ASoC: Intel: bytcht_es8316: Add quirk for the Teclast X98+=
 II")

--=20
Cheers,
Stephen Rothwell

--Sig_/MP1ZEC1DMNnGhlx0NgPyzjm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyr+XEACgkQAVBC80lX
0GwK9gf/aqkvqEyanVOIYi0cqqOVrgGhGY1te79jo9xpnvLrfDcQSe7mppoPU2/Z
7DXhz6YO10cacGQWPxm8Nuif1KyyoIOxMCKNhnU0cvJXt0MDYO3WImbNBMYfsAYr
4MzdC957YLuoUS2t4GiGFrTv7aG2/DYvkm20URzE7j3tUEkbRLfdaq5mkMXwB2ax
s91KVLVCx1h2rMCqr3Ej8ogeAaQYo2BoukSrBctU6NBu5Fhl9jtnSRVto+7Ozfg4
I+FNuYNpY+d0Gq4IpPy1jcMM5hK6fjiRUDEQ8MhNrAR4OZ35Ausz5ka7sf4AVStq
TP6GTeWcNKQMZ6+l1p2EpSUWC3RDyg==
=Wsb5
-----END PGP SIGNATURE-----

--Sig_/MP1ZEC1DMNnGhlx0NgPyzjm--
