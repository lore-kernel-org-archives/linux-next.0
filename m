From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: backlight tree build failure
Date: Thu, 4 Dec 2008 16:30:59 +1100
Message-ID: <20081204163059.98d02c8c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Dec_2008_16_30_59_+1100_1WBgl.+wzKhqSALg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36640 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751638AbYLDFbJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Dec 2008 00:31:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__4_Dec_2008_16_30_59_+1100_1WBgl.+wzKhqSALg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/video/backlight/tdo24m.c:17:30: error: linux/spi/tdo24m.h: No such =
file or directory
drivers/video/backlight/tdo24m.c: In function 'tdo24m_probe':
drivers/video/backlight/tdo24m.c:337: error: storage size of 'model' isn't =
known
drivers/video/backlight/tdo24m.c:342: error: dereferencing pointer to incom=
plete type
drivers/video/backlight/tdo24m.c:344: error: 'TDO24M' undeclared (first use=
 in this function)
drivers/video/backlight/tdo24m.c:344: error: (Each undeclared identifier is=
 reported only once
drivers/video/backlight/tdo24m.c:344: error: for each function it appears i=
n.)
drivers/video/backlight/tdo24m.c:379: error: 'TDO35S' undeclared (first use=
 in this function)
drivers/video/backlight/tdo24m.c:337: warning: unused variable 'model'

I have dropped the backlight tree for today.  More care, please.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__4_Dec_2008_16_30_59_+1100_1WBgl.+wzKhqSALg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk3axMACgkQjjKRsyhoI8xdBgCgpCJr+7Nt3hQ8Wg5jCYuzINdD
TrwAoKqHD2jtvKZ2XUAY65gjxMOPJ81F
=ghsQ
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Dec_2008_16_30_59_+1100_1WBgl.+wzKhqSALg--
