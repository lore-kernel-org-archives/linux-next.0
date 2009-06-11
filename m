From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: device-mapper series import failed
Date: Thu, 11 Jun 2009 11:13:13 +1000
Message-ID: <20090611111313.57b4d151.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Jun_2009_11_13_13_+1000_lF6vfr9poK8djbxt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44010 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753547AbZFKBNR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 21:13:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Thu__11_Jun_2009_11_13_13_+1000_lF6vfr9poK8djbxt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alasdair,

I got this:

dm-table-replace-struct-io_restrictions-with-struct-queue_limits.patch
error: patch failed: drivers/md/dm-table.c:89
error: drivers/md/dm-table.c: patch does not apply
error: patch failed: include/linux/device-mapper.h:144
error: include/linux/device-mapper.h: patch does not apply

I removed that patch and the following one (the last) for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Jun_2009_11_13_13_+1000_lF6vfr9poK8djbxt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkowWikACgkQjjKRsyhoI8za+gCeK5MlVmC8WzFBF7a35UiXyPYP
u0IAoJjSqwuh4wxtetoK3lmuTF+aeDSE
=L0Nq
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Jun_2009_11_13_13_+1000_lF6vfr9poK8djbxt--
