From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 12 Mar 2015 13:11:32 +1100
Message-ID: <20150312131132.3f321cda@canb.auug.org.au>
References: <20150310130120.38bb6c55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_QNDVnpsS_QdwD9RcodEJGg"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54299 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751138AbbCLCLj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2015 22:11:39 -0400
In-Reply-To: <20150310130120.38bb6c55@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bard Liao <bardliao@realtek.com>

--Sig_/_QNDVnpsS_QdwD9RcodEJGg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 10 Mar 2015 13:01:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> sound/soc/codecs/rt5670.c: In function 'is_sys_clk_from_pll':
> sound/soc/codecs/rt5670.c:519:38: error: 'struct snd_soc_dapm_widget' has=
 no member named 'codec'
>   struct snd_soc_codec *codec =3D source->codec;
>                                       ^
>=20
> Caused by commit 485372dc24ca ("ASoC: rt5670: Check sysclk source by
> private data")?

Still getting this.

> sound/soc/codecs/rt5670.c: In function 'rt5670_set_dai_sysclk':
> sound/soc/codecs/rt5670.c:2272:1: error: expected expression before '<<' =
token
>  <<<<<<< HEAD
>  ^
> sound/soc/codecs/rt5670.c:2284:1: error: expected expression before '>>' =
token
>  >>>>>>> v4.0-rc3
>  ^
>=20
> Oops :-(

This has been fixed.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/_QNDVnpsS_QdwD9RcodEJGg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVAPXYAAoJEMDTa8Ir7ZwV31gP/3HA4KCc/uXn0rHgGHlpoytG
kEDZwWjr65akYiDlZ6Hpi+el+7yTHXK4jsV9jNpimCbFcUzrJCFeCgjkl5TY+KIb
zwgrYppuzutc5+447Vul3dik/jVrInwJr89zLy9CpXJBNTPxnYz9QESYf0MHvYOU
ggLXr2IceKKQHpkL2CU/NwtQyGYRK40a/twlxDFkjhQOzh0IZB3gCkXusF3WC+z/
pCJKNWWI2KPZuQZwmlgw2CzCb3apwr3sbhXEJJVcQhF0HqafnsNu+h+U3vQ6fKFN
/1GsPbthk05QtXPvVz5CS0Anps62uzs3ioMJwG6UV/A/LZYMuG51LWlWqKz1u7Ei
L7CcuSH7yenStFk6wgzIEKsW426vqFOeQJ5LkiTjY/SVZa+a0GSa/YGvGazAbQu9
UVFeojd0RbuhHu8jQ8CmIKMNhFpPx2GlyurOacwI4u7TwSrC/1xyrdI5CXzpCyyF
WXhQQ8XZjDnalkAkU71ybSpq0eyhpTNyNLacbxJ0sncxP+GY0R51MGknbYgPCz2a
9UuoaKQsu3Rc+aMp7HK3+lMWcEVY6z1stvBJPSCv/3yVaX5ibwNc9gKhpfONKYBV
7Dw8bYomfZzKWThNtlkvTyZnufP/mNvos6xVcTQAM3Kk29r97NxbQwQoim6uy/kk
clgQDQsQc+OfT6yujbtP
=YMEx
-----END PGP SIGNATURE-----

--Sig_/_QNDVnpsS_QdwD9RcodEJGg--
