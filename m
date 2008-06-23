From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb build failure
Date: Mon, 23 Jun 2008 13:08:34 +1000
Message-ID: <20080623130834.7d370f90.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Jun_2008_13_08_34_+1000_rNMnljySur1e8rQA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52719 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752921AbYFWDIm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Jun 2008 23:08:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>

--Signature=_Mon__23_Jun_2008_13_08_34_+1000_rNMnljySur1e8rQA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/media/video/videodev.c: In function 'get_index':
drivers/media/video/videodev.c:1992: warning: passing argument 2 of 'class_=
for_each_device' from incompatible pointer type
drivers/media/video/videodev.c:1992: error: too few arguments to function '=
class_for_each_device'

The class_for_each_device API is changing, so I have applied the
following patch.  There is nothing you can do about this so I will carry
this patch in linux-next.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 9729a44374ade4322ac8813c38c0be2cdc3449cb Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 23 Jun 2008 13:05:52 +1000
Subject: [PATCH] v4l-dvb: class_for_each_device API change fallout

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/video/videodev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/videodev.c b/drivers/media/video/videodev.c
index 56044a0..d913008 100644
--- a/drivers/media/video/videodev.c
+++ b/drivers/media/video/videodev.c
@@ -1988,7 +1988,7 @@ static int get_index(struct video_device *vdev, int n=
um)
=20
 	info->dev =3D vdev->dev;
=20
-	ret =3D class_for_each_device(&video_class, info,
+	ret =3D class_for_each_device(&video_class, NULL, info,
 					__fill_index_info);
=20
 	if (ret < 0)
--=20
1.5.5.4


--Signature=_Mon__23_Jun_2008_13_08_34_+1000_rNMnljySur1e8rQA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhfE7IACgkQTgG2atn1QN8fSQCgjoSgZic6VAuebkmjp/n35inY
PzsAn1kzAfvJ5sRcslUOWp1nQth5FtKU
=2aB1
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Jun_2008_13_08_34_+1000_rNMnljySur1e8rQA--
