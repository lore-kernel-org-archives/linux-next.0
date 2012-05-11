From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (akpm tree
 related)
Date: Fri, 11 May 2012 16:20:43 +1000
Message-ID: <20120511162043.1c6faab3b83848c0b99b7d6d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__11_May_2012_16_20_43_+1000_WSPL.YL_dXU_k7zt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:53244 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753922Ab2EKGUw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 May 2012 02:20:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sasha Levin <levinsasha928@gmail.com>

--Signature=_Fri__11_May_2012_16_20_43_+1000_WSPL.YL_dXU_k7zt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/isdn/i4l/isdn_common.c: In function 'isdn_init':
drivers/isdn/i4l/isdn_common.c:2365:9: error: 'KERN_CONG' undeclared (first=
 use in this function)
drivers/isdn/i4l/isdn_common.c:2365:9: note: each undeclared identifier is =
reported only once for each function it appears in
drivers/isdn/i4l/isdn_common.c:2365:19: error: expected ')' before string c=
onstant

Caused by commit 87577ec95e0c ("ISDN: add missing KERN_CONT").  Please
build test this stuff.  :-(

I reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__11_May_2012_16_20_43_+1000_WSPL.YL_dXU_k7zt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPrK+7AAoJEECxmPOUX5FEN04P/3g/+nLL3gHrtIzGGVadKV9t
UaqQ6H8+PreqNl2+XQyI6q5oZLDBVvBs+G64Iaa+eBL2bqXrGG56PJ6zR22Z6fgn
3QJw9d1dJeYhBR9IvHwsumMWBDQ/V3RxJJRnWsAAPlPPtUQ8Trc5zh9Cv+5oUqR2
2MMEsUbWRpqXBMlx4hAkystDNKwZpYWK/J3Ar0oeLXNv1ocp7PvHiEaMLjrPprQM
45HI06loit1CGptiV4hPp7sTDXp0fF9Vtk2GDWssSvNk5Ua4FX3or9XVB1kYlaBE
tlCSGu8Gx1j/MFHILwfeXQHqy02KDBGbnS/5PyM/3V3T0sBJoWd7DaI3BuQ+uhY9
WQ8r1lbF9WP2taEwg7PO5lpvgWFCkKtBvGOJYtmk5ebsIurowkBgkkCoqfEXJMqJ
BHuF0FRaVEBFPHjIWZaT07KmGP/cTQq89JucCUTihd/LnIzWv+pA312g+2/b46pK
UMcrd2JVQvhzQiaAWgMcWJUo1h7Cb+ZhrmfHi7VzksI5Yu69cI7ATfa3Brcks3zr
Xa3bz0sPPo6VLxERXXeLsL5mZzDNafP+8/VgXYbM6elQSAUaMVImXdMwIE5nBc2D
tMXAS3E5fTsGfnp6UnS7FeQ8CGfV8pp84FPJvuvBzUnAu7fLyKfFdsfRRFNFkkBg
hB9v6tcfHCcPKT31k9i/
=5gOt
-----END PGP SIGNATURE-----

--Signature=_Fri__11_May_2012_16_20_43_+1000_WSPL.YL_dXU_k7zt--
