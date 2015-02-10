From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: linux-next: Tree for Feb 9 (build failures)
Date: Tue, 10 Feb 2015 08:07:24 +0100
Message-ID: <54D9AE2C.5080403@rempel-privat.de>
References: <20150209211827.652dc2ce@canb.auug.org.au> <20150209172048.GA27107@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="40tN8bVBf4vxPPvoubldHROR7swL0D1N8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:51117 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751261AbbBJHHm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Feb 2015 02:07:42 -0500
In-Reply-To: <20150209172048.GA27107@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kenneth Westfield <kwestfie@codeaurora.org>, Mark Brown <broonie@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--40tN8bVBf4vxPPvoubldHROR7swL0D1N8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 09.02.2015 um 18:20 schrieb Guenter Roeck:
> On Mon, Feb 09, 2015 at 09:18:27PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please oo not add any material destined for v3.21 to your linux-next
>> included trees until after v3.20-rc1 has been released.
>>
>=20
> Build failures:
>=20
> Building arm:efm32_defconfig ... failed
> --------------
> Error log:
> arm-poky-linux-gnueabi-ld: Text section oversize
>=20
> [ wonder if I need a new/different compiler ]
>=20
> ---
>=20
> Building mips:allmodconfig ... failed
> --------------
> Error log:
>=20
> sound/soc/codecs/max98357a.c: In function 'max98357a_daiops_trigger':
> sound/soc/codecs/max98357a.c:30:3: error: implicit declaration of funct=
ion 'gpiod_set_value'
> sound/soc/codecs/max98357a.c: In function 'max98357a_codec_probe':
> sound/soc/codecs/max98357a.c:55:2: error: implicit declaration of funct=
ion 'devm_gpiod_get'
> sound/soc/codecs/max98357a.c:61:2: error: implicit declaration of funct=
ion 'gpiod_direction_output'
>=20
> Looks like this driver depends on GPIOLIB but does not select it,
> and MIPS doesn't seem to support GPIOLIB. Missing dependencies ?
>=20
> ---
>=20
> Building sparc64:allmodconfig ... failed
> --------------
> Error log:
> asm9260_timer.c:(.init.text+0x60d4): undefined reference to `of_io_requ=
est_and_map'

The patch for this issue was send for two weeks:
https://lkml.org/lkml/2015/1/31/21

Should i resend it?


--=20
Regards,
Oleksij


--40tN8bVBf4vxPPvoubldHROR7swL0D1N8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iF4EAREIAAYFAlTZrjEACgkQHwImuRkmbWlocQD7BHHuV/cBA2woPXvy6mvSoMbo
g2rEQmKKnpCxnIjc6n4A/2UAgUdTBh3FcJdfpEBR4Bphh25WWoUzRb+6aBZHKYnM
=lZDW
-----END PGP SIGNATURE-----

--40tN8bVBf4vxPPvoubldHROR7swL0D1N8--
