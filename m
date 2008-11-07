From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build failure
Date: Fri, 7 Nov 2008 14:30:46 +1100
Message-ID: <20081107143046.7b2b171a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Nov_2008_14_30_46_+1100_tS6k3ZbifM=STCgv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39212 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750904AbYKGDa5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Nov 2008 22:30:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>

--Signature=_Fri__7_Nov_2008_14_30_46_+1100_tS6k3ZbifM=STCgv
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/staging/go7007/go7007-v4l2.c: In function 'go7007_ioctl':
drivers/staging/go7007/go7007-v4l2.c:1338: warning: passing argument 1 of '=
video_usercopy' from incompatible pointer type
drivers/staging/go7007/go7007-v4l2.c:1338: warning: passing argument 2 of '=
video_usercopy' makes integer from pointer without a cast
drivers/staging/go7007/go7007-v4l2.c:1338: warning: passing argument 4 of '=
video_usercopy' makes pointer from integer without a cast
drivers/staging/go7007/go7007-v4l2.c:1338: error: too many arguments to fun=
ction 'video_usercopy'

Caused by commit 579209181bfc24ee03a0d167bdc32106afd4e269 ("V4L/DVB
(9503): v4l: remove inode argument from video_usercopy") which missed the
above driver.

I have dropped your tree again for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Nov_2008_14_30_46_+1100_tS6k3ZbifM=STCgv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkTtmYACgkQjjKRsyhoI8wsUwCdFJmeiB/crz0M4xBNIHhaBa94
wBgAnjbyi5eelaDjpUlP9bPaEb05IgyB
=C7l3
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Nov_2008_14_30_46_+1100_tS6k3ZbifM=STCgv--
