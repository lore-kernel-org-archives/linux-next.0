From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: failed import of the usb quilt series
Date: Tue, 27 Jul 2010 10:42:36 +1000
Message-ID: <20100727104236.eeccabdf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__27_Jul_2010_10_42_36_+1000_li87L/6tPpqmS13a"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47481 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752877Ab0G0Amm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Jul 2010 20:42:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Tue__27_Jul_2010_10_42_36_+1000_li87L/6tPpqmS13a
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Importing the usb quilt series today produced this error:

usb-serial-enabling-support-for-segway-rmp-in-ftdi_sio.patch
error: patch failed: drivers/usb/serial/ftdi_sio.c:746
error: drivers/usb/serial/ftdi_sio.c: patch does not apply
Context reduced to (1/0) to apply fragment at 1012

I removed that patch for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__27_Jul_2010_10_42_36_+1000_li87L/6tPpqmS13a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMTit8AAoJEDMEi1NhKgbsuJYH+wQSRgPyRWGTlY8XQB+gHKVg
2wcI/a7YWT70in6rd3EDW0X6DZ42ZMiK1F4oqZuMhbSt9QzGCa3WO/Jslf8Yyf1L
pR/tbwHlgbjfXIlvXrYdyn9tl2vfHmwFPAwtbrh8ng4q50/98PCSD0wWiuhNwzmv
IWyOw9pbWgjMQPP6Vdb7fuAjRDcmqrM3DDiuCS0+kWaiC757n+g1O7pfjG+UJrO0
Q4FPD0CW0WWtjHEoTOVhA0Qep78leRNQRgighdHjrtG6+AtKRyeeiU3FIXVkl9KE
9wXVS5/QMZ8orkO84Z3OtreCNGUXM6y1CBAIhLklEObAAe3atufjocIGgg00huE=
=2zUj
-----END PGP SIGNATURE-----

--Signature=_Tue__27_Jul_2010_10_42_36_+1000_li87L/6tPpqmS13a--
