From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mfd tree
Date: Tue, 11 Nov 2014 13:32:15 +1100
Message-ID: <20141111133215.66f578ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cPbEhK5Dc897LMP0HIPFVlH"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52796 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751178AbaKKCcZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Nov 2014 21:32:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gyungoh Yoo <jack.yoo@skyworksinc.com>

--Sig_/cPbEhK5Dc897LMP0HIPFVlH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

After merging the mfd tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/mfd/sky81452.c:29:0:
include/linux/mfd/sky81452.h:24:52: fatal error: linux/platform_data/sky814=
52-backlight.h: No such file or directory
 #include <linux/platform_data/sky81452-backlight.h>
                                                    ^

Caused by commit f4eaf386bcf1 ("mfd: Add support for Skyworks SKY81452
driver").

I have used the mfd tree from next-20141110 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/cPbEhK5Dc897LMP0HIPFVlH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUYXU1AAoJEMDTa8Ir7ZwVK0YP/iv82y1O4hGze4hwCO/zmpzH
NyVUJDgZKQyZ2SM6xeEixNeHfAi6nlUSvbQGz5YowCkTVJ/HKjQnFDXTo4+4hNCY
FBAbHT++2v9Qr0DSm8cmN9xpNnB1dZ/9iim3oEweYDn5Dw/nceM51QGjLD1VMX1Z
Rku18zXE0LDy9RduhIWbS0jmget1NDtqV8YC+6alvJtdt93wpqvkyYuFf4IWE6MH
PbjPZu4/zLu/Tc2kgSJj23AitC3BSdHXRjnNS9j2i5dLFzhIqUqR7gP+iQwURD8Q
NifjtcjcqaFsGWADZMMdL9G8QC9zC417syWoYReRSukrRDKL2SDGX9tms/TNCVkt
ycJBPsUDJXhiYUbz1+BRkEKRFPJxxaE9dBCkoyou/QuOw8jOtBy9opKvtdgVEv7A
OgNOv+x/PrfbAdv2BWQZ3EBcsdEUKsEt6MTX7o3ijvqT2V4dcYyURO9n6Gr0wf8O
vomrSm+t663O/2OXXLBMavp1eqyyOHNhp2Ak1yJwfNhlJg9AvRyyfX80vsp1vuzB
hyrSUTsG58g15Bs715Wf0d/k5nX73VP+ARbkQl0rXkKV8UAxMt24zxJ9HUOhdaLZ
NDX0Q4Tos1waJIfXo8+7JpuXbbxfuctsd5DWLWcLH5aiu3zmB9quHriZ/z4OI/Hj
b/8q5uMMxaQaz6F+uftX
=sset
-----END PGP SIGNATURE-----

--Sig_/cPbEhK5Dc897LMP0HIPFVlH--
