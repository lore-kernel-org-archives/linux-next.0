From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: device-mapper tree build warnings
Date: Wed, 17 Jun 2009 13:08:06 +1000
Message-ID: <20090617130806.c17ec577.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Jun_2009_13_08_06_+1000_nx4i9LSgNHtBOy6W"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54244 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932438AbZFQDIN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2009 23:08:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>

--Signature=_Wed__17_Jun_2009_13_08_06_+1000_nx4i9LSgNHtBOy6W
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alasdair,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

drivers/md/dm-delay.c: In function 'delay_iterate_devices':
drivers/md/dm-delay.c:327: warning: passing argument 1 of 'fn' from incompa=
tible pointer type
drivers/md/dm-delay.c:327: note: expected 'struct dm_target *' but argument=
 is of type 'struct delay_c *'
drivers/md/dm-delay.c:332: warning: passing argument 1 of 'fn' from incompa=
tible pointer type
drivers/md/dm-delay.c:332: note: expected 'struct dm_target *' but argument=
 is of type 'struct delay_c *'

Introduced by commit ac2152571c038de73be920db171fb438d32bb744
("dm-targets-introduce-iterate-devices-fn").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Jun_2009_13_08_06_+1000_nx4i9LSgNHtBOy6W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko4XhYACgkQjjKRsyhoI8xMTwCgtZLk7fnjuRvQr064p+OFGVvt
yKkAnAg1Pyt9VNMHgBFOWVRJV5wt2VNp
=qs4J
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Jun_2009_13_08_06_+1000_nx4i9LSgNHtBOy6W--
