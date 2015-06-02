From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 2 Jun 2015 12:51:09 +1000
Message-ID: <20150602125109.1fe3c37a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aBFtjNyZ+lao/daRZ5KJu1A"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/aBFtjNyZ+lao/daRZ5KJu1A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/soc-dapm.c: In function 'dapm_kcontrol_data_alloc':
sound/soc/soc-dapm.c:387:4: error: implicit declaration of function 'snd_so=
c_dapm_new_control' [-Werror=3Dimplicit-function-declaration]
    data->widget =3D snd_soc_dapm_new_control(widget->dapm,
    ^
sound/soc/soc-dapm.c:387:17: warning: assignment makes pointer from integer=
 without a cast
    data->widget =3D snd_soc_dapm_new_control(widget->dapm,
                 ^
sound/soc/soc-dapm.c: At top level:
sound/soc/soc-dapm.c:3269:1: error: conflicting types for 'snd_soc_dapm_new=
_control'
 snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
 ^
sound/soc/soc-dapm.c:387:19: note: previous implicit declaration of 'snd_so=
c_dapm_new_control' was here
    data->widget =3D snd_soc_dapm_new_control(widget->dapm,
                   ^

Caused by commit 02aa78abec6e ("ASoC: DAPM: Add APIs to create
individual DAPM controls").

I have used the sound-asoc tree from next-20150601 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/aBFtjNyZ+lao/daRZ5KJu1A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbRohAAoJEMDTa8Ir7ZwVK94QAIYegYay+diqgGJMhFHniphj
LzPY72Mvm6vWBcN32LyW/vP54vC988yXlBYgT8+GSaxsNjK/GwZ5s4k6TKIpRP8o
6T/ax93c2AtmgtD/1alYgx3ibIJQYeuKAv5Ao26HclByzfDPj+b6JJqLofh9u0OX
GjkIfbVm8OdvBfCUCBC4f5+UctCr30SVuvYG/Gmc+8SONtOcdNscmTTcJ/Qv/EQ6
1g7+vMnj5SGGQ4vJfWRRfZ2wOprxeFDuVLA3En60NGGfrlseEQeIEkYiJZUWmZnO
gisgAjHSRYsjdm1dt0cH631iopw727tRNwxk4A/Ai+GfDwGMdY5VomT12YCIjomT
4oovQlBGp1kFNVit5NZxvFiu61na55hABOvgDqmQpce160oCxfIiSyme7BrqJS+0
Hlsn19JpiXxztc4pCzaN+bfrMaeh9Igzpx163IkS8I29cskf0GlqgsIQnXVygIjq
kMEw9ZbtPc/lVlUhCpYh+VzY1iJY09HCV60/m74u3hX4IiMIBWK3kldzGwGC0BJF
0Fwmv2lNIwRTc7woH6y5RCe9lE1Qb6f2h5LVqivvfzTUCfQ8fUHRKTUkBSWn9rev
kaJwyWxfod2xvh2HL2pCis84MPBBWxZ85/IBqrHjONeJxt5eN4KAi1LHEChug9fi
oE5r4upqXF2SBSY2RRcd
=RSI4
-----END PGP SIGNATURE-----

--Sig_/aBFtjNyZ+lao/daRZ5KJu1A--
