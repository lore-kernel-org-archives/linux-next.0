From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the backlight tree
Date: Mon, 10 May 2010 12:43:04 +1000
Message-ID: <20100510124304.2249532c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__10_May_2010_12_43_04_+1000_JNySHyVdKvuXstgs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41396 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754987Ab0EJCnM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 May 2010 22:43:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Michael Hennerich <michael.hennerich@analog.com>, Mike Frysinger <vapier@gentoo.org>

--Signature=_Mon__10_May_2010_12_43_04_+1000_JNySHyVdKvuXstgs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Richard,

After merging the backlight tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/video/backlight/adp8860_bl.c: In function 'adp8860_led_probe':
drivers/video/backlight/adp8860_bl.c:215: error: implicit declaration of fu=
nction 'kzalloc'
drivers/video/backlight/adp8860_bl.c:215: warning: assignment makes pointer=
 from integer without a cast
drivers/video/backlight/adp8860_bl.c:285: error: implicit declaration of fu=
nction 'kfree'
drivers/video/backlight/adp8860_bl.c: In function 'adp8860_probe':
drivers/video/backlight/adp8860_bl.c:673: warning: assignment makes pointer=
 from integer without a cast
drivers/video/backlight/adp8860_bl.c:689: error: too few arguments to funct=
ion 'backlight_device_register'

Caused by commit 6f1a02240dba279a389fd4a4138445bd3f13f67f ("backlight:
new driver for the ADP8860 backlight parts").  Use of kzalloc or kfree
requires including linux/slab.h (see Rule 1 in
Documentation/SubmitChecklist) and the prototype of
backlight_device_register changed before v2.6.34-rc2.

Was this even build tested?

I have used the version of the backlight tree from next-20100507 for
today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__10_May_2010_12_43_04_+1000_JNySHyVdKvuXstgs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvncrgACgkQjjKRsyhoI8wFUwCeLRFfJQLf0DKUfjM4BfA/YM3g
hXcAn3fmW/f6NAKGYfuR5xAaORAnpaBK
=aa/0
-----END PGP SIGNATURE-----

--Signature=_Mon__10_May_2010_12_43_04_+1000_JNySHyVdKvuXstgs--
