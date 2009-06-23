From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core tree build failure
Date: Tue, 23 Jun 2009 16:01:00 +1000
Message-ID: <20090623160100.ab086e63.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__23_Jun_2009_16_01_00_+1000_HkUPdoUXi5hDI/O_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51174 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752568AbZFWGBF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Jun 2009 02:01:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

--Signature=_Tue__23_Jun_2009_16_01_00_+1000_HkUPdoUXi5hDI/O_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (arm omap_osk_5912_defconfig) failed like this:

drivers/video/omap/omapfb_main.c: In function 'omapfb_show_caps_num':
drivers/video/omap/omapfb_main.c:1253: error: 'struct device' has no member=
 named 'driver_data'
drivers/video/omap/omapfb_main.c: In function 'omapfb_show_caps_text':
drivers/video/omap/omapfb_main.c:1273: error: 'struct device' has no member=
 named 'driver_data'
drivers/video/omap/omapfb_main.c: In function 'omapfb_show_panel_name':
drivers/video/omap/omapfb_main.c:1320: error: 'struct device' has no member=
 named 'driver_data'
drivers/video/omap/omapfb_main.c: In function 'omapfb_show_bklight_level':
drivers/video/omap/omapfb_main.c:1329: error: 'struct device' has no member=
 named 'driver_data'
drivers/video/omap/omapfb_main.c: In function 'omapfb_store_bklight_level':
drivers/video/omap/omapfb_main.c:1344: error: 'struct device' has no member=
 named 'driver_data'
drivers/video/omap/omapfb_main.c: In function 'omapfb_show_bklight_max':
drivers/video/omap/omapfb_main.c:1363: error: 'struct device' has no member=
 named 'driver_data'
drivers/video/omap/omapfb_main.c: In function 'omapfb_show_ctrl_name':
drivers/video/omap/omapfb_main.c:1396: error: 'struct device' has no member=
 named 'driver_data'

Caused by commit 53d8ba57f16029a47ed5df9840ab6c3f9abd3727 ("Driver core:
move dev_get/set_drvdata to drivers/base/dd.c") from the driver-core tree.

I see more grepping in your future :-)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__23_Jun_2009_16_01_00_+1000_HkUPdoUXi5hDI/O_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpAb5wACgkQjjKRsyhoI8zAfACgocB2QLn5LCT+VUkhH2CVeNRW
gKkAnj1/pQGpTbtcAPKmePhcoj9djKji
=h5az
-----END PGP SIGNATURE-----

--Signature=_Tue__23_Jun_2009_16_01_00_+1000_HkUPdoUXi5hDI/O_--
