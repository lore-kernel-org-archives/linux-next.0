From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: incorrect build fix
Date: Wed, 9 Nov 2011 08:26:24 +1100
Message-ID: <20111109082624.ea5697763c50ef9128244783@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__9_Nov_2011_08_26_24_+1100_1.vBDq31obDZ23GO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:59577 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751560Ab1KHV0f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2011 16:26:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Wed__9_Nov_2011_08_26_24_+1100_1.vBDq31obDZ23GO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed in commit 8644c202ff42 ("ARM: EXYNOS: Fix compiler error with
THIS_MODULE") in the s5p tree, an include of linux/module.h is used to
get THIS_MODULE. For THIS_MODULE, you only need to include
linux/export.h, now.  To fix the other errors that were fixed by side
effects of including module.h, you should include linux/time.h (for
struct timeval, USEC_PER_SEC and do_gettimeofday).

Please try a bit harder to get these things right.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__9_Nov_2011_08_26_24_+1100_1.vBDq31obDZ23GO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOuZ6AAAoJEECxmPOUX5FECIsP/16sKoV/S40Ooqf6qpeLotm2
fv7gQM6qUgYw4qNBU6YnP0NmnHNw8+7XC1c02g32FRHYpdC+TDQG0i0v4chPrX8m
SisXt+PeMmfARPQMdy1dLX6tScLcQb3QUcbg1avsGZHZGvSIegpETOcyM/TK/i52
SLT68jvrDnA2oyw2ai5WDVqnsCCVJe6rrp0QR97pGKgO3MNqbuBCIYta36QXfyjU
SsyD3Q4oWEY60Id1NHHvPYY//vp7t4D73PViia+g301xQRzbLKf2i9INoZC0pEfp
WeFXxblcloUa9sdoLNE4/Fp+Fxkj4yZ8gym2RHDzFPPU7iyPJWM7Ro4lf5QHhjRS
wuowSnQKntQKAJ6hFEbVOpk5f+6PjxLUrpHy0YHFyJVwtXfWmh7KZx9e20o9tPCr
ZVgefT7o45vD4t+r2z9YBkIdkjFI0AEUmIr0sSidRNx8yhR23E+k0vCxpr6JgnB8
Tkur06r2GXgfCBKPKqaZbe9nXd+EWmLmwYfVzVCPfkcCfRhtNFAEOytT25GN+xie
yu6FOKngC9eiijGXn9hutKOZx5SHP/maqSOTSp92WVlhbOeZL33+BA8i/TPlUogK
tCwIB51YGFMZhWN0P1wRhlR6hNNox9uKDHVGzCE6EdfITBrlVIbWaEqL9hzf51ai
AuzSKFZFgqt2pjtKAxWn
=9/5b
-----END PGP SIGNATURE-----

--Signature=_Wed__9_Nov_2011_08_26_24_+1100_1.vBDq31obDZ23GO--
