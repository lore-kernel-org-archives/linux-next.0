From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: import of usb series failed
Date: Thu, 18 Feb 2010 10:55:00 +1100
Message-ID: <20100218105500.898ece5e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__18_Feb_2010_10_55_00_+1100_ytwfx_Ec9byV_jy_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60502 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756690Ab0BQXzF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Feb 2010 18:55:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Thu__18_Feb_2010_10_55_00_+1100_ytwfx_Ec9byV_jy_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Importing the usb quilt series failed like this:

usb-ftdi_sio-correct-spelling-in-header-files.patch
error: patch failed: drivers/usb/serial/ftdi_sio_ids.h:185
error: drivers/usb/serial/ftdi_sio_ids.h: patch does not apply

I removed that patch for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__18_Feb_2010_10_55_00_+1100_ytwfx_Ec9byV_jy_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkt8gdQACgkQjjKRsyhoI8zvzwCeJ/yd5JfBE+kmF1Irv+p4nHzk
rKcAn3S7e841at4r31gi6E5BNlEEdDFa
=PP9K
-----END PGP SIGNATURE-----

--Signature=_Thu__18_Feb_2010_10_55_00_+1100_ytwfx_Ec9byV_jy_--
