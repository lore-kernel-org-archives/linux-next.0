From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: arm build failure
Date: Wed, 26 Nov 2008 13:30:52 +1100
Message-ID: <20081126133052.082e1d45.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__26_Nov_2008_13_30_52_+1100_KQzFHFIJZytJCV7c"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44198 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751390AbYKZCbL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 21:31:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Miao <eric.y.miao@gmail.com>
Cc: linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Dmitry Baryshkov <dbaryshkov@gmail.com>

--Signature=_Wed__26_Nov_2008_13_30_52_+1100_KQzFHFIJZytJCV7c
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

next-20081125 build (arm corgi_defconfig) failed like this:

arch/arm/mach-pxa/built-in.o: In function `sleep_save_sp':
tosa.c:(.data+0x3978): undefined reference to `tc6393xb_lcd_set_power'
tosa.c:(.data+0x397c): undefined reference to `tc6393xb_lcd_mode'

Caused by commit fc37aa322a7e9170979a044c3f178ae4162ca285 ("[ARM]
pxa/tosa: support tc6393xb/tmiofb.").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__26_Nov_2008_13_30_52_+1100_KQzFHFIJZytJCV7c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkstNwACgkQjjKRsyhoI8yERACfcpYTOiR4347y8qCkLLdonaml
efQAnjQRCBx7N3WAxO2ztCK7fiarAEm7
=flxT
-----END PGP SIGNATURE-----

--Signature=_Wed__26_Nov_2008_13_30_52_+1100_KQzFHFIJZytJCV7c--
