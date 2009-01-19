From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: hid tree build failure
Date: Mon, 19 Jan 2009 12:33:19 +1100
Message-ID: <20090119123319.a079edbd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_Jan_2009_12_33_19_+1100_Ntnz23yYG/b_48iY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40997 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755945AbZASBd2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 18 Jan 2009 20:33:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@jikos.cz>
Cc: linux-next@vger.kernel.org, Oliver Neukum <oliver@neukum.org>

--Signature=_Mon__19_Jan_2009_12_33_19_+1100_Ntnz23yYG/b_48iY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/hid/usbhid/hid-core.c: In function 'hid_suspend':
drivers/hid/usbhid/hid-core.c:1220: error: 'struct usb_device' has no membe=
r named 'auto_pm'
drivers/hid/usbhid/hid-core.c:1245: error: 'struct usb_device' has no membe=
r named 'auto_pm'
drivers/hid/usbhid/hid-core.c:1258: error: 'struct usb_device' has no membe=
r named 'auto_pm'

The immediate cause is commit ae14e83aaa975a732ed46dcc9a080172a60f08a6
("HID: autosuspend support for USB HID").  The above config does not have
CONFIG_PM set and auto_pm is only defined for CONFIG_PM.

I have dropped the hid tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_Jan_2009_12_33_19_+1100_Ntnz23yYG/b_48iY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklz2F8ACgkQjjKRsyhoI8yUXwCglqzi7mlp9zgU0gdiWNUbxInF
QJIAn1kQJf/0tc++0IoVBWNn0wuBNJrF
=/fDS
-----END PGP SIGNATURE-----

--Signature=_Mon__19_Jan_2009_12_33_19_+1100_Ntnz23yYG/b_48iY--
