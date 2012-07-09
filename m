From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Date: Mon, 9 Jul 2012 11:50:46 +1000
Message-ID: <20120709115046.f09fe2d15e33e7502cbad222@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__9_Jul_2012_11_50_46_+1000_ZbeRoIkMmk_tV4h_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:43021 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751405Ab2GIBvG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 8 Jul 2012 21:51:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, Sylwester Nawrocki <s.nawrocki@samsung.com>

--Signature=_Mon__9_Jul_2012_11_50_46_+1000_ZbeRoIkMmk_tV4h_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

After merging the v4l-dvb tree, today's linux-next build (x86_64
allmodconfig) failed like this:

usr/include/linux/v4l2-subdev.h:28: included file 'linux/v4l2-common.h' is =
not exported
usr/include/linux/videodev2.h:63: included file 'linux/v4l2-common.h' is no=
t exported

Introduced by commit 5689b28890f4 ("[media] v4l: Unify selection targets
across V4L2 and V4L2 subdev interfaces").

I have used the v4l-dvb tree from next-20120706 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__9_Jul_2012_11_50_46_+1000_ZbeRoIkMmk_tV4h_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJP+jj2AAoJEECxmPOUX5FERP0QAIdYQntEeZAs7ditbNC4K90Z
B3j0pjqsW0pEI+Qch8xrdggfXF7maFCRVSzUqaLp3kyn+TjMrMoDLbzDuOzmJSyv
xyJatAKVwr4dQaRi2wgG5DAmFkoi2pueGpsv+FvcTUscKDDixlOLd6Ng97lpXqIo
XAE3BWv4L+wQnNrnBRy0rkzFOJHRmcOogxORWDBpSeDzp8KXvYbm0a62jKjd2CZs
9ye/ZaHMAHlH05wq3fX3fXA+uc2Mcvg1B3HrSlk8vjCj58fFsszd7G1rqPl2xBNx
q0Ek4jrySKHm7eHzI9OxFHisAGazEcd/27ASdC97zMx4l2KLfUjXsLoNQj5qY2sy
AeZ43R9FjKwVa83IrlvGTbhWS000+bvNGJloVRwGnzhan4zleDFFLwt8TrpG+Wh5
Nkvy8nvUQ083STCz3MBsVmR4PLa+oTUE/zUhI46WIQB/dR9qCvCc+h2UhZXN+7DY
z5PEL8Su+j5hIq0i8X1yQgZsq4biztIG+KqYPCVmdGN8TqmWvesCgMthIMbQjBXl
lOEhUy2O2ZEsjYx+xSVxxcOPWcJo61bV/O1DPXIAwaGnv8GRnG3C37SQt4HL58mr
/TvopX3lWXchV6aqU/2KIn9MyCOYW2w0SXjjJiwSSXbosQfMTFbCUH9MpMyDp1i4
jaw7OGHIYSWiyK+DF7E9
=KkNj
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Jul_2012_11_50_46_+1000_ZbeRoIkMmk_tV4h_--
