From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s390 tree
Date: Tue, 1 Jul 2008 14:43:04 +1000
Message-ID: <20080701144304.c5e1c7b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_14_43_04_+1000_bFRkh+ZB5etlZgmc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36001 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750802AbYGAEnN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 00:43:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Ursula Braun <braunu@de.ibm.com>, Greg KH <greg@kroah.com>

--Signature=_Tue__1_Jul_2008_14_43_04_+1000_bFRkh+ZB5etlZgmc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Today's linux-next merge of the s390 tree got a conflict in
drivers/s390/net/netiucv.c between commit
b11b60b796cc45f9f34c9149b1becde0db9bcdde ("s390: bus_id -> dev_name
conversions") from the driver-core tree and commit
9b6fd7ada6c3e068120fa230a760c6238c1ec427 ("[S390] Cleanup netiucv printk
messages") from the s390 tree.

The latter removes some code that the former changes.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_14_43_04_+1000_bFRkh+ZB5etlZgmc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhptdgACgkQjjKRsyhoI8ytwQCfTKNWvgdhwXwcZThm8sh4Yw4q
2r0An24glyPGcw7jaa+yznpIi3Bm7iMp
=k35x
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_14_43_04_+1000_bFRkh+ZB5etlZgmc--
