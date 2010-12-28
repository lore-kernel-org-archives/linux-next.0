From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the v4l-dvb tree
Date: Tue, 28 Dec 2010 11:47:44 +1100
Message-ID: <20101228114744.e628825a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Dec_2010_11_47_44_+1100_5cDqwOU/tCDYr/m3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33035 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752127Ab0L1Aru (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Dec 2010 19:47:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@redhat.com>, =?UTF-8?B?IlV3ZSBLbGVpbmUtS8O2bmlnIg==?= <u.kleine-koenig@pengutronix.de>

--Signature=_Tue__28_Dec_2010_11_47_44_+1100_5cDqwOU/tCDYr/m3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
drivers/staging/stradis/stradis.c between commit
aef01debdfad83ab71a83b7af8cd90203404c1aa ("[media] cpia, stradis: remove
deprecated V4L1 drivers") from the v4l-dvb tree and commit
b595076a180a56d1bb170e6eceda6eb9d76f4cd3 ("tree-wide: fix comment/printk
typos") from the trivial tree.

The former removed the file modified by the latter, so I removed the file.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Dec_2010_11_47_44_+1100_5cDqwOU/tCDYr/m3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNGTOwAAoJEDMEi1NhKgbsqA0H/2Uevp9YBZglZYk9Lv/yJfJr
ud28MKrgiHKhMusdbH5zR5F0cBZeqzvhmjV+Jbsb+tI1mmdInwj/vrerfnQmWsn1
IFci2SxfjzW2yn0MCDSC69huhJQm8OtvWA0H342XRKCH9Obk74zttFvBnEBgvkjT
AP4EolQREyzd+RYCkKTMgnCP8Nk5xvVfu6rsqswNm6GBKTPCjry+QpB3iO/5DHmi
yGCXmDmkmlg1YNJ4NVnicJeBNxRlPQtY2J4aIICJhx1Gq9R56aR7l3Zu96362JmW
D0qFxJppTgJ3xd2lDmNh+MXThLQXQZ7khxfzuUBIFpOx3bRBMQBMoQdRPr9Qg8M=
=MCy2
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Dec_2010_11_47_44_+1100_5cDqwOU/tCDYr/m3--
