From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb tree build failure
Date: Tue, 14 Oct 2008 15:08:02 +1100
Message-ID: <20081014150802.e043baf3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_15_08_02_+1100_ZcY32VUWoCdYRXQQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59340 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757011AbYJNEmM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 00:42:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Alexey Klimov <klimov.linux@gmail.com>, Mauro Carvalho Chehab <mchehab@redhat.com>

--Signature=_Tue__14_Oct_2008_15_08_02_+1100_ZcY32VUWoCdYRXQQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/media/radio/radio-mr800.c: In function 'vidioc_s_frequency':
drivers/media/radio/radio-mr800.c:362: error: implicit declaration of funct=
ion 'warn'
drivers/media/radio/radio-mr800.c: In function 'usb_amradio_suspend':
drivers/media/radio/radio-mr800.c:508: error: implicit declaration of funct=
ion 'info'

Direct cause is commits 9ade02815223bc15481f64dc9bef0ba7493d9fdc ("USB:
remove info() macro from usb.h") and
fb2d8e064998cfc6fdc3f8e2d30382e4f8dfd40a ("USB: remove warn() macro from
usb.h") which I have reverted.

Commit 2aa72f3b63e4b524e9e4b1438f6c0d50a214d836 ("4L/DVB (9101):
radio-mr800: Add driver for AverMedia MR 800 USB FM radio devices") in
Linus' tree added new references to warn() and info().

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_15_08_02_+1100_ZcY32VUWoCdYRXQQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0GyIACgkQjjKRsyhoI8xeGwCePZEJZZL01WBeWNK1BHmcDfm3
mNgAn3GNy0w18vq2gVgQCs/kqDn1dnDG
=5Vz8
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_15_08_02_+1100_ZcY32VUWoCdYRXQQ--
