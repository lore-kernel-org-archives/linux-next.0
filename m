From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s5p tree with the  tree
Date: Wed, 4 Jan 2012 13:18:18 +1100
Message-ID: <20120104131818.5758cb3cb563379df97ee0ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__4_Jan_2012_13_18_18_+1100_YtAHEa/wzR48YvEl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:49897 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756083Ab2ADCS3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Jan 2012 21:18:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

--Signature=_Wed__4_Jan_2012_13_18_18_+1100_YtAHEa/wzR48YvEl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kukjin,

Today's linux-next merge of the s5p tree got a conflict in
arch/arm/mach-s3c2410/include/mach/system-reset.h between commit
281c8724c10c ("ARM: restart: Temporary #error to persuade platform
maintainers to take the restart changes seriously") from the arm tree and
commit 11ca5f97077d ("ARM: restart: S3C24XX: use new restart hook") from
the s5p tree.

The arm tree patch seems to have had the desired affect so I used the s5p
tree version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__4_Jan_2012_13_18_18_+1100_YtAHEa/wzR48YvEl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPA7bqAAoJEECxmPOUX5FEz+YP/17QeXTruZYJffs7afoGzUh6
l9m04v10SDx0RCrv30LsTkunbd0Oamn+tnl5l1IYKs8RezPOHKUTdWPxJoZGhhtS
vXsxR9aWvZVuIsncbuTFjS5R2JLEpFUBMj+DfZgZUspa+QJ64+V/aSZg/O9iib5k
b+kNZYLb06qkFiThhaZYfiJs0Ajk8u88pWVg47g2t+XEhJ/5vVe2I31cEFhu9VXS
jpEwns2ke8f3s02JgqvRomCWbcd1cqVDxv8+v3YNHDDk0/U+W8WyJ1Lo6vxEjuF1
/F/Lz77yaD+1D7fj2BY/XMo6untZu4A3IFx6HCerHMBXHRL8LT5OLcruSFptRaza
jTcWpcZDU8DnIfpF3UI/CvQ3JPLACS0v6VLWBjL5P24KT00pFcb/2a+ZXkyx/QHW
cQv8ohesTWqKy150vbjAxKSAxJ18pQYMb+roPv5PQqIH4WlcHkSOz9ZX5d+20aRK
vJdJMF7b+MRLokonWF0EbzaE+ID9XCZRGi+kiYKT5zqgF/lSiyG0iPJtnN4n7EkY
1q40cyfOFh3GG0Oc+yHUqbW1F0GYc6oP3kJk/CvB1j7dxTG3zWGMOxgX3TTB5YY/
1YfTB/0sTmAAFqcYeTWvt5zNhzJIQh/TbIIuT0oM3kvmkWkeduSaGxrQ1aSty1e3
8pCToG+aahlEhU4nv9iY
=SX85
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Jan_2012_13_18_18_+1100_YtAHEa/wzR48YvEl--
