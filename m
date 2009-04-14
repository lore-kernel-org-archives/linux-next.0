From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: firmware tree build failure
Date: Tue, 14 Apr 2009 14:12:54 +1000
Message-ID: <20090414141254.70ddc8ce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Apr_2009_14_12_54_+1000_D0VUkWUQ2tsoa1TM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38027 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750699AbZDNENI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2009 00:13:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

--Signature=_Tue__14_Apr_2009_14_12_54_+1000_D0VUkWUQ2tsoa1TM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (sparc64 defconfig) failed like this:

drivers/base/firmware_class.c: In function 'firmware_loading_store':
drivers/base/firmware_class.c:173: error: 'PAGE_KERNEL_RO' undeclared (firs=
t use in this function)

Caused by commit 0bb1338d4467c143987560f841130292c124074c ("firmware:
speed up request_firmware()").  PAGE_KERNEL_RO appears to not be defined
for several architectures.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Apr_2009_14_12_54_+1000_D0VUkWUQ2tsoa1TM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknkDUYACgkQjjKRsyhoI8zYUACguYuKN/jE3LUVMzXfGX4z5FIk
J00AnjZQIgoNRb2rh+OhnoMN3jl0vKLu
=azKT
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Apr_2009_14_12_54_+1000_D0VUkWUQ2tsoa1TM--
