From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: osd tree build failure
Date: Fri, 14 Nov 2008 17:53:28 +1100
Message-ID: <20081114175328.5120af70.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__14_Nov_2008_17_53_28_+1100_Z/B8qw+v7ZcP.aK8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41798 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750727AbYKNGxn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Nov 2008 01:53:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boaz Harrosh <bharrosh@panasas.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__14_Nov_2008_17_53_28_+1100_Z/B8qw+v7ZcP.aK8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Boaz,

Today's linux-next build (x86_64 allmodconfig) failed like this:

In file included from drivers/scsi/osd/osd_initiator.c:43:
include/scsi/osd_initiator.h: In function 'osd_dev_set_ver':
include/scsi/osd_initiator.h:72: error: 'dev' undeclared (first use in this=
 function)

Caused by commit 1bdb488972f83cccfcbdbf45f7653ebc07f47313 ("libosd: OSD
version 2 Support").  I have dropped the osd tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__14_Nov_2008_17_53_28_+1100_Z/B8qw+v7ZcP.aK8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkdIGgACgkQjjKRsyhoI8wqVgCeINicu87Knhd3Kh/yx0vv+I2G
NwkAoJwX99tzH0NzIYOZEoBMB268PxlI
=EYWp
-----END PGP SIGNATURE-----

--Signature=_Fri__14_Nov_2008_17_53_28_+1100_Z/B8qw+v7ZcP.aK8--
