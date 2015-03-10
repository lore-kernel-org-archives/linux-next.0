From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the tty tree
Date: Tue, 10 Mar 2015 16:37:40 +1100
Message-ID: <20150310163740.0f3bc651@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UX=SWwhdYObsw7GcU82ofTX"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50827 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751117AbbCJFhq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2015 01:37:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>

--Sig_/UX=SWwhdYObsw7GcU82ofTX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the tty tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

drivers/tty/serial/serial_mctrl_gpio.c: In function 'mctrl_gpio_init':
drivers/tty/serial/serial_mctrl_gpio.c:110:4: warning: return makes pointer=
 from integer without a cast
    return PTR_ERR(gpios->gpio[i]);
    ^
drivers/tty/serial/serial_mctrl_gpio.c:90:6: warning: unused variable 'err'=
 [-Wunused-variable]
  int err;
      ^

Introduced by commit 1d267ea6539f ("serial: mctrl-gpio: simplify init
routine").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/UX=SWwhdYObsw7GcU82ofTX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU/oMpAAoJEMDTa8Ir7ZwVkAMP/3gFOx0ttw3gWIztqWuy/sbL
VE0lAfMkb6uJTrDFBkBTa+do0TTNGWWAAx08jZZoqbkVwNiBbJoBUZJOkZKWhbp9
xJlUwXn+JGLgOJ4gT6n7VJs81mMrYrmq3suByzKIYrurBRiCMOeHLFotVr9ZY8LQ
IcXibwgoesyKiB4Bv7E1icqLy1EGTvh7BycoMUBszYSbjzXsVLh71kgYz2QUrOxF
HfPULfDw83Q2ZlUojDfhKKWlov0P31WVWPZCUtO9UBfLMqy6Hh9K0oGvFx229F64
hWrjYgc+WVoWyB5JaYYHpAgD2lDCWBY4ZScg6OZA+4F0KHZ7/6oQrobyPoJfbFoG
2uvhAaIwjyUzXIriRwqF8DiTILW4sBh12rfzSGeMixp48uu5GUqJj/UPdpKSyoHa
PTGKFqwncvVPkBiEHmEmlZx7r7XTnVLzAklsZwwHy1aPEXHXVV1+3PIFATkHKbWa
PtUSjdUl/Zns4yFnj0UG5zNfc5JkNWfuRiGEPdh5YxZXu14lyqpoiItlxNv40e5b
3kUgIWhIxkYyLfwY17qU+zcumN3IBCGvroLI40imKnApXZRgomv+Rjc2Jw4r/2ge
7cJrjvgkPkPoNAdAG8tT62M1/vI2n1JhCrMuMoa5fE7ErPkmNJPiv9dXbkRBvaSd
QESB8nlWQ2/Qo8HsFPrR
=QCkx
-----END PGP SIGNATURE-----

--Sig_/UX=SWwhdYObsw7GcU82ofTX--
