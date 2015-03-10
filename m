From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tty tree
Date: Tue, 10 Mar 2015 16:28:16 +1100
Message-ID: <20150310162816.3301cff5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rm4KRQrIOUVXRvhjI0fZIEj"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34798 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750773AbbCJF2X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2015 01:28:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>

--Sig_/rm4KRQrIOUVXRvhjI0fZIEj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the tty tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/tty/serial/imx.c: In function 'imx_set_termios':
drivers/tty/serial/imx.c:1301:7: warning: suggest explicit braces to avoid =
ambiguous 'else' [-Wparentheses]
    if (port->rs485.flags & SER_RS485_ENABLED)
       ^

Introduced by commit 17b8f2a3fdca ("serial: imx: add support for half
duplex rs485").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/rm4KRQrIOUVXRvhjI0fZIEj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU/oD0AAoJEMDTa8Ir7ZwVkTkP/06xX8eWDzzp6ksdp9niJbic
0OKJZElZ4ygyOHsA3fofvMi7jw+kcT4zEQhsya5AGYG1ThjzWv+rc7Gl6dGkWVmW
+mSvLJTLT0P/i6yNOGGgEugkJ1wsSdHCn/hZiekb/AgQjtcJcYo42v41hgo+dYPD
LEiy60mnQn6bGYDdptnwuIB+DJbAMwSMMyp2P5SRHWeJxNI0yCk+MiwCXshki6nZ
5hSU9E0vl0zSqGNgQtY7p9r6y5yUBkRn5LoI2bHUf4Fr3xyyjCpYUFJqFrzQQgpc
jrhO9qQE52V/w4tIiLG69WQBKP2Gp2ewBqw3OObX01st4tdOFDOzbOIkboahZczt
SQZefFfov2aAZGLwWwjS0FehomU+1EgfdbIMH6lbQ2pkq1ez9nEzMPKOKkfM90va
r7y4rA0ABECAqlVsLpytW3UJWdwk74zMGM53M6K5YdG1Gw/+/MGfy7eZ5/eRSOnS
WvplZKOoClJNClBEg/wQ0mN5/r0jL6a94D1uynDi/5pp3jdD4mKXdtaHLI2h11Lj
QJ4T+RQkAitBzMVV6WkfiFCgLaKgYuDSY6nphTUh2CUzdxOAp+IJ3kBkL5hvEkmu
hiQMRaTzE/ZB2e3LRkChA8pQ0nAnyGf0MHZIno9QtvBYOXXEmLq6DIBN+NzwW6FX
vRfwJf5jP98fXYrui5pO
=dR38
-----END PGP SIGNATURE-----

--Sig_/rm4KRQrIOUVXRvhjI0fZIEj--
