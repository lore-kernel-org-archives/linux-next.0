From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build warnings
Date: Mon, 9 Nov 2009 18:31:04 +1100
Message-ID: <20091109183104.2bf7add6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__9_Nov_2009_18_31_04_+1100_mGdS_55yb6h9SkxN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44727 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750768AbZKIHbC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Nov 2009 02:31:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__9_Nov_2009_18_31_04_+1100_mGdS_55yb6h9SkxN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

drivers/usb/storage/libusual.c:239: warning: passing argument 1 of '__check=
_old_set_param' from incompatible pointer type
include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, stru=
ct kernel_param *)' but argument is of type 'int (*)(const char *, const st=
ruct kernel_param *)'
drivers/usb/storage/libusual.c:239: warning: passing argument 1 of '__check=
_old_set_param' from incompatible pointer type
include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, stru=
ct kernel_param *)' but argument is of type 'int (*)(const char *, const st=
ruct kernel_param *)'
drivers/usb/storage/libusual.c:239: warning: passing argument 1 of '__check=
_old_set_param' from incompatible pointer type
include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, stru=
ct kernel_param *)' but argument is of type 'int (*)(const char *, const st=
ruct kernel_param *)'
drivers/usb/storage/libusual.c:239: warning: passing argument 1 of '__check=
_old_set_param' from incompatible pointer type
include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, stru=
ct kernel_param *)' but argument is of type 'int (*)(const char *, const st=
ruct kernel_param *)'

Introduced by commit 9f94999724555729819ea0143eab1d0529c029d1
("param:param_ops").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__9_Nov_2009_18_31_04_+1100_mGdS_55yb6h9SkxN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr3xTgACgkQjjKRsyhoI8xumQCgnb89O5wP1mBVI8VEmEVBPQTQ
4akAn0QZpGXqZY//qRj35FLHP6hp+yx6
=vkmH
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Nov_2009_18_31_04_+1100_mGdS_55yb6h9SkxN--
