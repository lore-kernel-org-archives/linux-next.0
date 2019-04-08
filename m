From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Date: Tue, 9 Apr 2019 09:12:31 +1000
Message-ID: <20190409091231.57cf760a@canb.auug.org.au>
References: <20190326100145.3ee50933@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UWcL=wt71r.47lzmU.udJqq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190326100145.3ee50933@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Annaliese McDermond <nh6z@nh6z.net>
List-Id: linux-next.vger.kernel.org

--Sig_/UWcL=wt71r.47lzmU.udJqq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 26 Mar 2019 10:01:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> sound/soc/codecs/tlv320aic32x4-clk.c: In function 'clk_aic32x4_pll_recalc=
_rate':
> sound/soc/codecs/tlv320aic32x4-clk.c:149:38: warning: 'settings.d' may be=
 used uninitialized in this function [-Wmaybe-uninitialized]
>      ((settings->j * 10000) + settings->d);
>                               ~~~~~~~~^~~
> sound/soc/codecs/tlv320aic32x4-clk.c:197:32: note: 'settings.d' was decla=
red here
>   struct clk_aic32x4_pll_muldiv settings;
>                                 ^~~~~~~~
> sound/soc/codecs/tlv320aic32x4-clk.c:149:15: warning: 'settings.j' may be=
 used uninitialized in this function [-Wmaybe-uninitialized]
>      ((settings->j * 10000) + settings->d);
>        ~~~~~~~~^~~
> sound/soc/codecs/tlv320aic32x4-clk.c:197:32: note: 'settings.j' was decla=
red here
>   struct clk_aic32x4_pll_muldiv settings;
>                                 ^~~~~~~~
> sound/soc/codecs/tlv320aic32x4-clk.c:148:37: warning: 'settings.r' may be=
 used uninitialized in this function [-Wmaybe-uninitialized]
>   rate =3D (u64) parent_rate * settings->r *
>                              ~~~~~~~~^~~
> sound/soc/codecs/tlv320aic32x4-clk.c:197:32: note: 'settings.r' was decla=
red here
>   struct clk_aic32x4_pll_muldiv settings;
>                                 ^~~~~~~~
> sound/soc/codecs/tlv320aic32x4-clk.c:151:56: warning: 'settings.p' may be=
 used uninitialized in this function [-Wmaybe-uninitialized]
>   return (unsigned long) DIV_ROUND_UP_ULL(rate, settings->p * 10000);
>                                                         ^~
> sound/soc/codecs/tlv320aic32x4-clk.c:197:32: note: 'settings.p' was decla=
red here
>   struct clk_aic32x4_pll_muldiv settings;
>                                 ^~~~~~~~
>=20
> Introduced by commit
>=20
>   514b044cba66 ("ASoC: tlv320aic32x4: Model PLL in CCF")

I am still getting these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/UWcL=wt71r.47lzmU.udJqq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyr1V8ACgkQAVBC80lX
0GyUrAf/e8cfMwKWceRi9VmwDT+25ltW3Alzfq2rXyrnKMxgCRETRfUUf65nRZRC
IZzgCosIfkhBrt6uhmLfZh+Opu7B98r+uNSPTpZ07w+Or7rqQDZKS9ZrzrnsjrAJ
F+r5uo9F8aV8AlknM6Pp1lTWdImRAqQU43cI37IYjE4lnVQgDJOHUookUqvZjxOl
ZUiJW5BkEvNqUIGMmKkfEa4UdZf8xy1Q0p5c81thsYDOQTVxVTMGOBGV0VBoHXaw
ONVxkXjVKZmlw5KNoSgf754GaqhQdbaEQGmgwOraH5E2IW2YvVJOoj1e4NSofa6N
FElZGj2HY9fgeem2JauvwNb5og/PUw==
=EIkw
-----END PGP SIGNATURE-----

--Sig_/UWcL=wt71r.47lzmU.udJqq--
