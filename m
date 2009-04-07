From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build failure
Date: Tue, 7 Apr 2009 10:58:32 +1000
Message-ID: <20090407105832.d2590e6e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__7_Apr_2009_10_58_32_+1000_oQq++/cfi6t.C4kA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47735 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751937AbZDGA6w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Apr 2009 20:58:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>

--Signature=_Tue__7_Apr_2009_10_58_32_+1000_oQq++/cfi6t.C4kA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/media/video/v4l2-common.c: In function 'v4l2_i2c_new_probed_subdev_=
addr':
drivers/media/video/v4l2-common.c:874: warning: passing argument 1 of 'v4l2=
_i2c_new_probed_subdev' from incompatible pointer type
drivers/media/video/v4l2-common.c:874: warning: passing argument 2 of 'v4l2=
_i2c_new_probed_subdev' from incompatible pointer type
drivers/media/video/v4l2-common.c:874: warning: passing argument 4 of 'v4l2=
_i2c_new_probed_subdev' from incompatible pointer type
drivers/media/video/v4l2-common.c:874: error: too many arguments to functio=
n 'v4l2_i2c_new_probed_subdev'

Caused by commit b97a45dfbd99a414a1af8e7224ab12d6ccbe3789 ("V4L/DVB
(11374): v4l2-common: add v4l2_i2c_new_probed_subdev_addr").

This was clearly never even built ...

I have used the v4l-dvb tree fomr next-20090406 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__7_Apr_2009_10_58_32_+1000_oQq++/cfi6t.C4kA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknapTgACgkQjjKRsyhoI8y88QCfc8PqIDtF7Co0wBOAzDXZQf45
5S8AnRKCCXxRfr6dGLhoOMPfeIW/xax9
=2rLS
-----END PGP SIGNATURE-----

--Signature=_Tue__7_Apr_2009_10_58_32_+1000_oQq++/cfi6t.C4kA--
