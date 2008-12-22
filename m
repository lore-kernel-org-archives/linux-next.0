From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb tree build failure
Date: Mon, 22 Dec 2008 11:33:35 +1100
Message-ID: <20081222113335.667c2d01.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__22_Dec_2008_11_33_35_+1100_yVbZpd.s1HOk6r6L"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58940 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751090AbYLVAdp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Dec 2008 19:33:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Inaky Perez-Gonzalez <inaky@linux.intel.com>

--Signature=_Mon__22_Dec_2008_11_33_35_+1100_yVbZpd.s1HOk6r6L
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) failed like this:

x86_64-linux-ld: drivers/net/wimax/built-in.o: No such file: No such file o=
r directory

I reverted commit 66aa675719ab82a03a66b75210fd40be6541f8fb ("wimax:
Makefile, Kconfig and docbook linkage for the stack") just to make the
build work.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__22_Dec_2008_11_33_35_+1100_yVbZpd.s1HOk6r6L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklO4F8ACgkQjjKRsyhoI8xVAQCfTHImwnAvAprCsbRU3nzjzQHi
E0YAn2rH/AWDQz8Ia+jQ+x3bSW3fkLL0
=SWpy
-----END PGP SIGNATURE-----

--Signature=_Mon__22_Dec_2008_11_33_35_+1100_yVbZpd.s1HOk6r6L--
