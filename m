From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: linux-next: Fixes tag needs some work in the mfd-fixes tree
Date: Thu, 4 Apr 2019 23:21:51 +0200
Message-ID: <20190404232151.46cb903c@kemnade.info>
References: <20190405074843.7f0013db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vHMLlvOAa3d=0GF1FpV27k7"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405074843.7f0013db@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/vHMLlvOAa3d=0GF1FpV27k7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, 5 Apr 2019 07:48:43 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Lee,
>=20
> In commit
>=20
>   20bb907f7dc8 ("mfd: twl-core: Disable IRQ while suspended")
>=20
> Fixes tag
>=20
>   Fixes: 6e2bd956936 ("i2c: omap: Use noirq system sleep pm ops to idle d=
evice for suspend")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> Did you mean
>=20
> Fixes: c6e2bd956936 ("i2c: omap: Use noirq system sleep pm ops to idle de=
vice for suspend")
>
I meant that patch. Copy and paste error on my side.
Sorry for the confusion.

Regards,
Andreas

--Sig_/vHMLlvOAa3d=0GF1FpV27k7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAlymdW8ACgkQl4jFM1s/
ye+bKhAAslPcXLN4x1kHuBmSdfvRZskFZ0SIXExTXZy4wkibiGH7hBtyk+rXWaCh
5KnYz8ZSQJCp9/ZNltw64xW96gH1V9mQcBkSfqN5lo6fO7tviZ3u3u55H0+YvoNc
QCJTKJ3yA5IudkMAYEsw29ywW+ZnBd28UGXg85o0YMwBxNZ0i420s1IRLWlAKAO0
SrSXByKsOl3bb3WYtmMefae6NC4knWTHG9ssdnvQhnATawaoDwcw74vD0bx/1GD5
QsHSrVMo9TUnUHCuhqVJy/RJdN6q5ct7RSH+sn+3mF8HxfiwYsPsznKrAM1wwNI1
+xJuWqRiPjQ2jb2aLuPXHkImQdW8pMPjKx27jXEmrzXR/wqxmM1LxK/EEeSx3N9C
v1T6mXzWj/owv6Y8g+TNw4AcErfOXr6emzfOtkqpEsfXf1If0Yd4e+ZtnOAozm8I
SVRO2ptZLVvO45euOse223VO6pQO8pFedRuQWWEphFJvYjsWsk/PfUzDUVL/j1Dr
1EQb5+/jYX3YIN7pEdF9g58N112f78cUuUjZ0kdaMuCnIj8pnv1k3aWKj+fwMhSc
0S73nsP2btVEAtCRmXfHw78/d79kQ2DeeASeCRAAOqDAl3rfDHh53tu4DEFzHnDl
00ikxRMBUg2qQPX4TOaeMFFP28OyRJ50x5cgBjkKuEm+dWn8fNE=
=zvj5
-----END PGP SIGNATURE-----

--Sig_/vHMLlvOAa3d=0GF1FpV27k7--
