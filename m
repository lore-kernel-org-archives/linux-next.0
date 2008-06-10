From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: backlight/arm merge conflict
Date: Tue, 10 Jun 2008 19:25:09 +1000
Message-ID: <20080610192509.31eaf3d4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Jun_2008_19_25_09_+1000_i7VGB+zgzDbzSWq_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37382 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751937AbYFJJZS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 05:25:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, eric miao <eric.miao@marvell.com>, Matthew Garrett <mjg@redhat.com>

--Signature=_Tue__10_Jun_2008_19_25_09_+1000_i7VGB+zgzDbzSWq_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Richard, Russell,

Today's linux-next merge of the backlight tree got trivial conflicts in
drivers/video/backlight/Makefile and drivers/video/backlight/Kconfig
between commit b137c7086e4130685df73e967b6774f1d02f8686 ("[ARM] pxa: add
generic PWM backlight driver") from the arm tree and commit
da3d25b63b3691edeecf255eae6ad2cc60a8a9cf ("backlight: Add Nvidia-based
Apple Macbook Pro backlight driver") from the backlight tree.

They were just overlapped additions.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Jun_2008_19_25_09_+1000_i7VGB+zgzDbzSWq_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhOSHUACgkQTgG2atn1QN8qMQCfQNAttzC0iTbKVcYjfQ5Y5lOV
7aIAnAicT1k/BcIbF7rPG5MEVeIGd1GD
=rIav
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Jun_2008_19_25_09_+1000_i7VGB+zgzDbzSWq_--
