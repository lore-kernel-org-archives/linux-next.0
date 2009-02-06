From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ide tree build failure
Date: Fri, 6 Feb 2009 14:35:31 +1100
Message-ID: <20090206143531.bd0c748b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Feb_2009_14_35_31_+1100_JySEsPHEuq1jkf6S"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50010 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752231AbZBFDfh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 22:35:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__6_Feb_2009_14_35_31_+1100_JySEsPHEuq1jkf6S
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/ide/scc_pata.c: In function 'scc_tf_load':
drivers/ide/scc_pata.c:675: error: 'IDE_TFLAG_FLAGGED' undeclared (first us=
e in this function)

Caused by commit 0b6008f9f765b9988b3f86c5fe74cd9873d34c61 ("ide: add
"flagged" taskfile flags to struct ide_taskfile").

I have dropped the ide tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Feb_2009_14_35_31_+1100_JySEsPHEuq1jkf6S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmLsAMACgkQjjKRsyhoI8z+IACeO8qwex2Wy7Vn+hFRVTV63g30
wdUAnRccpYSLyHDykExuOj/psnQ9+6+f
=3X79
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Feb_2009_14_35_31_+1100_JySEsPHEuq1jkf6S--
