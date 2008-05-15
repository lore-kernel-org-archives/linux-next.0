From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: i2c build failure
Date: Thu, 15 May 2008 12:12:41 +1000
Message-ID: <20080515121241.1ede11be.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__15_May_2008_12_12_41_+1000_s+WY.xqAM0zzbPeZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47486 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751991AbYEOCMx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 May 2008 22:12:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>

--Signature=_Thu__15_May_2008_12_12_41_+1000_s+WY.xqAM0zzbPeZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

Today's linux-next build (powerpc ppc64_defconfig) fails like this:

arch/powerpc/platforms/pasemi/misc.c: In function 'find_i2c_driver':
arch/powerpc/platforms/pasemi/misc.c:43: error: 'struct i2c_board_info' has=
 no member named 'driver_name'
arch/powerpc/platforms/pasemi/misc.c:44: error: 'struct i2c_board_info' has=
 no member named 'driver_name'
arch/powerpc/platforms/pasemi/misc.c:44: error: 'struct i2c_board_info' has=
 no member named 'driver_name'

So I reverted commit f625810ef235a8b238427df3129792f89187c085 ("i2c: Kill
the old driver matching scheme").  Obviously not the correct fix, but it
makes the build work.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_May_2008_12_12_41_+1000_s+WY.xqAM0zzbPeZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIK5wiTgG2atn1QN8RAsOHAJ42eajYlEk+L0oBS5nEnF4DPK9MfACfbwnQ
QFyuH8cH1ZP5+xYBMOcScS4=
=4z3A
-----END PGP SIGNATURE-----

--Signature=_Thu__15_May_2008_12_12_41_+1000_s+WY.xqAM0zzbPeZ--
