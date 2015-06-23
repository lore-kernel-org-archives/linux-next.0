From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-exynos tree
Date: Tue, 23 Jun 2015 11:52:45 +1000
Message-ID: <20150623115245.2142288e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j4o8HKwcQ4bioTcyKEKQF5b"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57141 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932680AbbFWBwv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Jun 2015 21:52:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hyungwon Hwang <human.hwang@samsung.com>, Rob Herring <robh+dt@kernel.org>

--Sig_/j4o8HKwcQ4bioTcyKEKQF5b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Inki,

After merging the drm-exynos tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/media/i2c/adv7604.o: In function `of_graph_get_endpoint_by_regs':
adv7604.c:(.text+0x586c): multiple definition of `of_graph_get_endpoint_by_=
regs'
drivers/media/i2c/adv7343.o:adv7343.c:(.text+0xa13): first defined here
drivers/media/platform/soc_camera/atmel-isi.o: In function `of_graph_get_en=
dpoint_by_regs':
atmel-isi.c:(.text+0x1ec9): multiple definition of `of_graph_get_endpoint_b=
y_regs'
drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0x2ce3):=
 first defined here
drivers/media/platform/soc_camera/rcar_vin.o: In function `of_graph_get_end=
point_by_regs':
rcar_vin.c:(.text+0x307c): multiple definition of `of_graph_get_endpoint_by=
_regs'
drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0x2ce3):=
 first defined here

Caused by commit:

  a0f7001c18ca ("of: add helper for getting endpoint node of specific ident=
ifiers")

I have used the drm-exynos from next-20150622 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/j4o8HKwcQ4bioTcyKEKQF5b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJViLvxAAoJEMDTa8Ir7ZwV2pEP/0PRHgmY514AqIdzJsHLRD2u
BD5voaKd61kmzqS/ed/8Nt9L9ioHeBWcBVY3VNXssPsl1POaJBbELw47qo5NhR3b
4ibhOrqB7ZQF8U/wfqnKmoU2gAAttVnRfqXljS02Br3ZI32KUhyJvBQG7kW2/9Pn
eIr2gzcBTxvjqa9Tpho8CTm5N4O+YNsfWAeMo8y/LNhrg6zFirBbvW2h9Lo87njg
SIhGgrAe0+0qOFIGIKYsdlLsiDfHJY3v2XqjjBiM4nfaD6Lesfj1rx1AKhBYGtgs
frXwn5pZ5774EFH7xk8HUyUDVJD7sy3VFQsbnR0UwwDDGtwAz2rK9fuYl5PFWgS3
6BjHxpJclyu+9jZfyXACGYrz7mdwX21wBB6n1GUPuS2EkSbqhnOxllVviPCcEj+1
If78WeGJ1gJ8XTKHG20OL/hLpgoXhy5/WvlH993PQ3rqdhPmplBIDsLdquSdLuIg
kg1ytD5X8hkuzay7tyX7nDPwGKg5Gkq1JFSugPrdlGUz/jQe14mJxoiwc8dwvZqV
a9TY3f9vzrZi5pIsnt3wa88S3wOvoVZtxIcN6ajDcolONbdjJMHmOc0ldI1dWlIw
yyzsQTE33kK/aC3mWYjat/GCpesyEt1xGeTuH2ejyTqqxykSHW7TAGWW/Mx0QxV3
nIDy30ETjUldal65iaoM
=r5+x
-----END PGP SIGNATURE-----

--Sig_/j4o8HKwcQ4bioTcyKEKQF5b--
