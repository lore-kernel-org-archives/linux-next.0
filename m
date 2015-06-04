From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Date: Thu, 4 Jun 2015 18:13:08 +1000
Message-ID: <20150604181308.16fbe6cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kBJGKUa6K/1+cx5w69libcM"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33808 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752039AbbFDINQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Jun 2015 04:13:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/kBJGKUa6K/1+cx5w69libcM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Darren,

After merging the drivers-x86 tree, today's linux-next build (x86_64 allmod=
config)
failed like this:

ERROR: "acpi_bus_get_status_handle" [drivers/platform/x86/pvpanic.ko] undef=
ined!

Caused by commit b8f8cf6b02b6 ("pvpanic: handle missing _STA correctly").

I have used the drivers-x86 tree from next-20150603 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/kBJGKUa6K/1+cx5w69libcM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVcAiZAAoJEMDTa8Ir7ZwVRSAP/isr5G53mWigw9j6KHFdV/z/
Wn3GPa1SIitlT2FxDFslgYMx1yijABloKK5Qxlpl7nQyW3gWf0SEKMllu52MzdzE
QiEH7tv9U25rdomZrR+P5liXnyGJ9MNsnAqTGHD28aZzePW2sTSFFX0CSGHNd6Cz
1CaG20LCxKALR4YdA1hiHDNcSSfZgScsu/oV5FV7UO9zbNU+mkAozO9c26vQg3Mb
47+5Zt1aoEr/xFCZKRLrf68XUN6W8tE0Waamhn0BgDpELRtcjigayed1LeAtkvDD
7AEQtyFaxMpHc2DOSV4NckozJFeEM+OW52563mcNqIVT7a53uNnCL/VG3CQgSpI7
eqf2DY9v35y3ffXUmclgr92GY1CWPtkIObqWn/P1CXJmRrbmB+Poh+25t+OSJErX
2EHHr9Jz7BjiDkebug+FDib6L+9SBB1OOzaXnZjnNygmz8egAPaxwIGd4hSyd4ha
O5d43yMhhQy9yRrHBUczyo7zmJwxNIV79LtvOCI3q23N3kL+zNi1uAquJ5HIK/K8
rIXHfgRiV6x1P4P0uqHBG9v915Gq0nUTxoICayCsGKSMgS8/dOvecq/DA/quMeEg
njKULQ/nM9kbEO03RZTzUDKh5yJxYORpPEMlWP3v8jEPmwA6Lvn3sEX9fbYBS5U7
Ne88x7vLauIIxtYbb08I
=w7pE
-----END PGP SIGNATURE-----

--Sig_/kBJGKUa6K/1+cx5w69libcM--
