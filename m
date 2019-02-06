From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Date: Thu, 7 Feb 2019 07:05:50 +1100
Message-ID: <20190207070550.0b650148@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fLFIfflFhhi3=SPda+1M/tz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-next.vger.kernel.org

--Sig_/fLFIfflFhhi3=SPda+1M/tz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d9111d36024d ("ASoC: rsnd: fixup rsnd_ssi_master_clk_start() user count c=
heck")

Fixes tag

  Fixes: commit 4d230d1271064 ("ASoC: rsnd: fixup not to call clk_get/set u=
nder non-atomic")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/fLFIfflFhhi3=SPda+1M/tz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxbPh4ACgkQAVBC80lX
0GxsHwf/SfETPsPfrw/ESm5Uzxcza99r7DkZ5oa7WUcg7Mj3dmCQYnfL+9N0nnCC
Qd0WgIJGT12hPA89d44lPQ9/PJcUPFaDyWT6Mz2+7umrWwoKLFpyXVdmeVER0F9e
ghrKkBU3ImnixjV2wOfhw2mQSu+ld7u4u707WZfIfn55d4urkP1IUFeUAJ7VIB/H
E/8HhCVbnQMW7NoIMALTxLZtbH2PIGaWc6yVkFXNWjNsjREkTEkt0TFWxbZS7iPd
Su5L0olvYiZCRSFz3kZaHnSJXnhOM/HL89o+M3XHJQVIsypJOATHsZS9FMV74aQL
YADZAPUBdlyeU3IjB1SfDCG/R46scQ==
=oFdY
-----END PGP SIGNATURE-----

--Sig_/fLFIfflFhhi3=SPda+1M/tz--
