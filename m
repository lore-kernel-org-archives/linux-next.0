From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: s390 build failure
Date: Mon, 12 May 2008 18:03:35 +1000
Message-ID: <20080512180335.6a2e8474.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__12_May_2008_18_03_35_+1000_g0xuPTLmA361.2UA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43417 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751266AbYELIDq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 May 2008 04:03:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

--Signature=_Mon__12_May_2008_18_03_35_+1000_g0xuPTLmA361.2UA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (s390 defconfig) fails like this:

drivers/s390/cio/device_fsm.c:53: error: syntax error before ';' token
drivers/s390/cio/device_fsm.c:54: error: syntax error before ';' token

Caused by commit 67da378c80848bb778ee8caecadcdf17e1e310e0 ("driver-core:
prepare for removal of 20 char limit from struct device") from the
driver-core tree. Missing close parentheses on added dev_name() calls.

A touch more care, please.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__12_May_2008_18_03_35_+1000_g0xuPTLmA361.2UA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIJ/nfTgG2atn1QN8RAq6XAJ9RAY2XAz2gSyMWAgCFXkm2EZQBfgCbBTEX
T0ScWi87SzQTuzY0HiMP17w=
=LAHN
-----END PGP SIGNATURE-----

--Signature=_Mon__12_May_2008_18_03_35_+1000_g0xuPTLmA361.2UA--
