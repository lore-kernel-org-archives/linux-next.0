From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Tue, 26 Mar 2019 10:01:45 +1100
Message-ID: <20190326100145.3ee50933@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ii3hkwhZ5D44rD1XYfWX67q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Annaliese McDermond <nh6z@nh6z.net>
List-Id: linux-next.vger.kernel.org

--Sig_/Ii3hkwhZ5D44rD1XYfWX67q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/codecs/tlv320aic32x4-clk.c: In function 'clk_aic32x4_pll_recalc_r=
ate':
sound/soc/codecs/tlv320aic32x4-clk.c:149:38: warning: 'settings.d' may be u=
sed uninitialized in this function [-Wmaybe-uninitialized]
     ((settings->j * 10000) + settings->d);
                              ~~~~~~~~^~~
sound/soc/codecs/tlv320aic32x4-clk.c:197:32: note: 'settings.d' was declare=
d here
  struct clk_aic32x4_pll_muldiv settings;
                                ^~~~~~~~
sound/soc/codecs/tlv320aic32x4-clk.c:149:15: warning: 'settings.j' may be u=
sed uninitialized in this function [-Wmaybe-uninitialized]
     ((settings->j * 10000) + settings->d);
       ~~~~~~~~^~~
sound/soc/codecs/tlv320aic32x4-clk.c:197:32: note: 'settings.j' was declare=
d here
  struct clk_aic32x4_pll_muldiv settings;
                                ^~~~~~~~
sound/soc/codecs/tlv320aic32x4-clk.c:148:37: warning: 'settings.r' may be u=
sed uninitialized in this function [-Wmaybe-uninitialized]
  rate =3D (u64) parent_rate * settings->r *
                             ~~~~~~~~^~~
sound/soc/codecs/tlv320aic32x4-clk.c:197:32: note: 'settings.r' was declare=
d here
  struct clk_aic32x4_pll_muldiv settings;
                                ^~~~~~~~
sound/soc/codecs/tlv320aic32x4-clk.c:151:56: warning: 'settings.p' may be u=
sed uninitialized in this function [-Wmaybe-uninitialized]
  return (unsigned long) DIV_ROUND_UP_ULL(rate, settings->p * 10000);
                                                        ^~
sound/soc/codecs/tlv320aic32x4-clk.c:197:32: note: 'settings.p' was declare=
d here
  struct clk_aic32x4_pll_muldiv settings;
                                ^~~~~~~~

Introduced by commit

  514b044cba66 ("ASoC: tlv320aic32x4: Model PLL in CCF")

--=20
Cheers,
Stephen Rothwell

--Sig_/Ii3hkwhZ5D44rD1XYfWX67q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyZXdkACgkQAVBC80lX
0Gw68ggAmJf+6gDljC6i4xZOK5rdcZ/ACrJTCXojm8RWeGzQgqFoO/97rdg+ar1q
7/NnCTxXh+XN8T/0Eb8WN1ZN9eeloFhG2EQWDga6uhaxjdENPpPsrq1hup3mUIv1
q+8rK3b5JP7Rs4/u7t/V4Xdt4/giJVI9bfs8Wsv8tPW2FcYqRsEEME03Kzcex32/
M/h12HBBumtazMLR4YQU3j5WgOz5NEd/uWJZjJo5tB32Oii2VutdjxVx2swYk70o
lncG/M3iPilmDZPnu1Urj00P4yNy73hvQDWjjHQUxjJFiCSBL7n5vD/xFPpb+g6g
V6W07Wk9pwEprzWA6dWR8GqhF1hBsA==
=H3fs
-----END PGP SIGNATURE-----

--Sig_/Ii3hkwhZ5D44rD1XYfWX67q--
