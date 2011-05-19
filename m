From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the i2c tree
Date: Thu, 19 May 2011 13:27:04 +1000
Message-ID: <20110519132704.9785243e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__19_May_2011_13_27_04_+1000_uh6so6E9TY/oR/Sc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41330 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756414Ab1ESD1L (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 May 2011 23:27:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__19_May_2011_13_27_04_+1000_uh6so6E9TY/oR/Sc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

After merging the i2c tree, today's linux-next build (i386 defconfig)
failed like this:

drivers/built-in.o: In function `i2c_i801_init':
i2c-i801.c:(.init.text+0x88b9): undefined reference to `check_signature'

Probably caused by commit fc02951b3293 ("i2c-i801: Don't depend on other
kernel driver config options").  Reverting that commit fixes the problem,
so I have done that for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__19_May_2011_13_27_04_+1000_uh6so6E9TY/oR/Sc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN1I4IAAoJEDMEi1NhKgbssl0IAJrk7T8kvcZT6vFVXYH3a05X
XfvD1X21ic1GHIdUKjTGeu8jrLt4I8wrdxVKdr0kcQqHKYeUc7GASCHRpnJwHaOI
MIuSAdkEE+vYIzyr86kv+yTaMgjrsGDFJzBFAW25I/q+THbJH5Jgv9iE5UmzwZKe
M53CdxkLnr9Lb/j/PmXDPuiZU/qwTUuCLwVAM9G0wljejwyh1sqAvnDpLO6Zca9u
nuvcDeKRQhlNns0oOh/qwPrv/m+eZjtXTWmE02WhFop1m+3xtuMJzJbXBAGDmz92
YG2SUQQUN1HyKkeELdTeWZ52Kv+zmTs8IRnJxxBGF+m+bgeNZQRRfdnjCoYkGZw=
=qjTm
-----END PGP SIGNATURE-----

--Signature=_Thu__19_May_2011_13_27_04_+1000_uh6so6E9TY/oR/Sc--
