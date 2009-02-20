From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: hid tree build warning
Date: Fri, 20 Feb 2009 19:08:46 +1100
Message-ID: <20090220190846.46ec3d76.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Feb_2009_19_08_46_+1100_4TeOXFTdzEozJXl+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59536 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751746AbZBTIIy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Feb 2009 03:08:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@jikos.cz>
Cc: linux-next@vger.kernel.org, Oliver Neukum <oliver@neukum.org>

--Signature=_Fri__20_Feb_2009_19_08_46_+1100_4TeOXFTdzEozJXl+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

drivers/hid/usbhid/hid-core.c:1337: warning: 'hid_reset_resume' defined but=
 not used

Introduced by commit 8aa650161ced641fec0bc9c38e3dea6a1f315442 ("HID: fix
USB HID devices after STD with autosuspend") from the hid tree.

hid_reset_resume() is only used if CONFIG_PM is set.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Feb_2009_19_08_46_+1100_4TeOXFTdzEozJXl+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmeZQ4ACgkQjjKRsyhoI8zdzACeNIPB0M4L6RyXe1jFZ6GEx9hr
u7MAoKF1KZShdkeAPXWwMU2p48Y9mY3O
=OBnD
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Feb_2009_19_08_46_+1100_4TeOXFTdzEozJXl+--
