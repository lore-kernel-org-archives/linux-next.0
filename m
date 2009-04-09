From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: block tree build failure
Date: Thu, 9 Apr 2009 13:37:16 +1000
Message-ID: <20090409133716.12af28e6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__9_Apr_2009_13_37_16_+1000_Hj8d/iNOJPrnlJN4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42853 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754620AbZDIDhY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Apr 2009 23:37:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__9_Apr_2009_13_37_16_+1000_Hj8d/iNOJPrnlJN4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next build (x86_64 allmodconfig) failed like this:

usr/include/linux/fs.h:11: included file 'linux/rwtypes.h' is not exported
make[4]: *** [usr/include/linux/.check] Error 1

Caused by commit 93fe0305df9344f57edfa0444f8764b34ea74f9b ("Document and
move the various READ/WRITE types") which I have reverted for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__9_Apr_2009_13_37_16_+1000_Hj8d/iNOJPrnlJN4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkndbWwACgkQjjKRsyhoI8welACfYO5MIP502w1xUziUDwlDVJNt
ZLEAn2hTbPDwjwx59c8jrXKO4FkCkdWa
=1nIe
-----END PGP SIGNATURE-----

--Signature=_Thu__9_Apr_2009_13_37_16_+1000_Hj8d/iNOJPrnlJN4--
