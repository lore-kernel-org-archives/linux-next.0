From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: s390/driver-core merge conflict
Date: Thu, 29 May 2008 13:58:39 +1000
Message-ID: <20080529135839.aa17b44f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__29_May_2008_13_58_39_+1000_As7PEBIV2hXA+fTj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:32847 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752784AbYE2D6r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 May 2008 23:58:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Peter Oberparleiter <peter.oberparleiter@de.ibm.com>

--Signature=_Thu__29_May_2008_13_58_39_+1000_As7PEBIV2hXA+fTj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Today's linux-next merge of the s390 tree got conflicts in
drivers/s390/block/dasd.c, drivers/s390/block/dasd_eckd.c,
drivers/s390/block/dasd_fba.c, drivers/s390/char/tape_core.c,
drivers/s390/cio/device_fsm.c, drivers/s390/net/claw.c,
drivers/s390/net/ctcm_main.c and drivers/s390/net/lcs.c between commit
bd24b944eb93549b1ca5becbf27c7373504f7eed ("driver-core: prepare for
removal of 20 char limit from struct device") from the driver-core tree
and commits 17ae2c0d4d27d73fb264e204e385bf5436349f36 ("[S390] cio:
introduce fcx enabled scsw format") and
8e4dac6f0f36686984ed3f01b977259e3127433b ("[S390] cio: provide functions
for fcx enabled I/O") from the s390 tree.

I merged all the dev_name changes from driver-core into the s390 changes.
Someone might like to check it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__29_May_2008_13_58_39_+1000_As7PEBIV2hXA+fTj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIPin0TgG2atn1QN8RAhskAJ4sCqrrbCgJ+zKaYt/J/Y2pctQ5lACeLwnE
caDz2FuLHi6Ma1GG+7FQHTo=
=qkgq
-----END PGP SIGNATURE-----

--Signature=_Thu__29_May_2008_13_58_39_+1000_As7PEBIV2hXA+fTj--
