From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: spi tree build warning
Date: Wed, 25 Nov 2009 21:29:59 +1100
Message-ID: <20091125212959.601673f5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Nov_2009_21_29_59_+1100_8+LZ2_c6ySI_Gl26"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38513 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751665AbZKYKaI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Nov 2009 05:30:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?IlJpY2hhcmQgUsO2amZvcnMi?= <richard.rojfors@mocean-labs.com>

--Signature=_Wed__25_Nov_2009_21_29_59_+1100_8+LZ2_c6ySI_Gl26
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

drivers/spi/xilinx_spi.c: In function 'xilinx_spi_init':
drivers/spi/xilinx_spi.c:411: warning: cast from pointer to integer of diff=
erent size

Maybe introduced by commit 8387f616c653f878b33d859310a8ed5c568505ee
("xilinx_spi: Split into of driver and generic part").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Nov_2009_21_29_59_+1100_8+LZ2_c6ySI_Gl26
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksNBycACgkQjjKRsyhoI8xsUwCgg93a7uPbwoBM0GqIuGnDlT/z
2bcAoJqxEIE9pORO6viZ/BUKHDUH4rr+
=UV+0
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Nov_2009_21_29_59_+1100_8+LZ2_c6ySI_Gl26--
