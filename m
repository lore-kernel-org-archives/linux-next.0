From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build failure
Date: Mon, 23 Mar 2009 20:38:10 +1100
Message-ID: <20090323203810.14776298.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Mar_2009_20_38_10_+1100_6QfokWIvfadQq.q."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45385 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752245AbZCWJiT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 05:38:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>

--Signature=_Mon__23_Mar_2009_20_38_10_+1100_6QfokWIvfadQq.q.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/media/video/ov7670.c: In function 'ov7670_write':
drivers/media/video/ov7670.c:433: error: implicit declaration of function '=
msleep'

Caused by commit c69a6f8d071763141e774893c71e09ded722f05d ("V4L/DVB
(11113): ov7670: convert to v4l2_subdev") which removed the include of
linux/delay.h ...

I have reverted that commit (and the two dependent commits
b7db06380e43161560a0eb2cc5fe891c23994b35 ("V4L/DVB (11116): ov7670:
cleanup and remove legacy code") and
2134b61009c102142e5140ab156d1cd99e0f6362 ("V4L/DVB (11117): ov7670: add
support to get/set registers")) for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Mar_2009_20_38_10_+1100_6QfokWIvfadQq.q.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknHWIIACgkQjjKRsyhoI8y8mACcDGzrqc5egci4rhIkdVLJ0hY1
hxMAn3lkgpMe0wk/Mkw8F97qpst/5hbd
=/Qxi
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Mar_2009_20_38_10_+1100_6QfokWIvfadQq.q.--
