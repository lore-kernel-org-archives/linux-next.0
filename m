From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core tree build failure
Date: Mon, 4 May 2009 16:25:42 +1000
Message-ID: <20090504162542.41b1cb57.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__4_May_2009_16_25_42_+1000_q8MQ9tD89jc6NSMi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49445 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751860AbZEDGZs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 May 2009 02:25:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Mon__4_May_2009_16_25_42_+1000_q8MQ9tD89jc6NSMi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/hid/usbhid/hiddev.c:965: error: unknown field 'nodename' specified =
in initializer
drivers/hid/usbhid/hiddev.c:965: warning: initialization from incompatible =
pointer type

Caused by commit 5b1e3a40a98ad5a822cb527439cd57dc60a41db9 ("Driver Core:
devtmpfs - driver core maintained /dev tmpfs").  As far as I can see the
version of this patch in your quilt series currently has never been
posted anywhere public ... The diff summaries for the previous and
current version of this patch are:

- 18 files changed, 484 insertions(+), 5 deletions(-)
+ 38 files changed, 599 insertions(+), 11 deletions(-)

Which is a pretty big change for something in linux-next.  So, can we
please remove this patch until it has proper review, been tested and has
settled down a bit.

I have reverted that patch for today (anything else was harder).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__4_May_2009_16_25_42_+1000_q8MQ9tD89jc6NSMi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn+imcACgkQjjKRsyhoI8zV5QCgoRpL757aW8FjR48jfe5maXnV
t10AnjS49Tr3fu34rJ+7YGeT/6zQts5/
=OeKQ
-----END PGP SIGNATURE-----

--Signature=_Mon__4_May_2009_16_25_42_+1000_q8MQ9tD89jc6NSMi--
