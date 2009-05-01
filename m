From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless tree build warning
Date: Fri, 1 May 2009 13:35:39 +1000
Message-ID: <20090501133539.5fc53f8a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__1_May_2009_13_35_39_+1000_ogILbaijKc7rr70Q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57634 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753924AbZEADfq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 23:35:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Kalle Valo <kalle.valo@nokia.com>, Bob Copeland <me@bobcopeland.com>

--Signature=_Fri__1_May_2009_13_35_39_+1000_ogILbaijKc7rr70Q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

drivers/net/wireless/wl12xx/wl1251.c: In function 'wl1251_upload_firmware':
drivers/net/wireless/wl12xx/wl1251.c:94: warning: format '%d' expects type =
'int', but argument 2 has type 'size_t'
drivers/net/wireless/wl12xx/wl1251.c:141: warning: format '%d' expects type=
 'int', but argument 2 has type 'size_t'

Introduced by commit b62712eafdf2fc332bf328b1fe29dbc5113bab64 ("wl12xx:
add driver").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__1_May_2009_13_35_39_+1000_ogILbaijKc7rr70Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn6bgsACgkQjjKRsyhoI8yPsQCffhroXGegqktOWTRXP+08D4u4
nrAAoI4G4I07+TFoO7nuKYdS9rgDLomC
=bTWr
-----END PGP SIGNATURE-----

--Signature=_Fri__1_May_2009_13_35_39_+1000_ogILbaijKc7rr70Q--
