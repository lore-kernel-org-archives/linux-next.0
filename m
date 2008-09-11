From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pxa tree build failure
Date: Fri, 12 Sep 2008 08:55:48 +1000
Message-ID: <20080912085548.81d070ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Sep_2008_08_55_48_+1000_kbAmRlnSZAOJFfhl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54356 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752722AbYIKWz7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Sep 2008 18:55:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Miao <eric.y.miao@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__12_Sep_2008_08_55_48_+1000_kbAmRlnSZAOJFfhl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/video/backlight/corgi_lcd.c:27:36: error: asm/mach/sharpsl_param.h:=
 No such file or directory
drivers/video/backlight/corgi_lcd.c: In function 'lcdtg_set_phadadj':
drivers/video/backlight/corgi_lcd.c:197: error: 'sharpsl_param' undeclared =
(first use in this function)
drivers/video/backlight/corgi_lcd.c: In function 'corgi_lcd_power_on':
drivers/video/backlight/corgi_lcd.c:244: error: 'sharpsl_param' undeclared =
(first use in this function)

This driver is added in the pxa tree.  I suspect it needs to depend on
ARM or some such, but for now I have made it depend on BROKEN in Kconfig.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Sep_2008_08_55_48_+1000_kbAmRlnSZAOJFfhl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjJofQACgkQjjKRsyhoI8znagCfX//i9n42V62w3rOi7rSkVolK
r5UAn03IOkONSgR4TxJd0JywKJmZ7kQ+
=z6H0
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Sep_2008_08_55_48_+1000_kbAmRlnSZAOJFfhl--
