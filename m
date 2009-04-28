From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: voltage tree build failure
Date: Tue, 28 Apr 2009 16:24:44 +1000
Message-ID: <20090428162444.f7ee93f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Apr_2009_16_24_44_+1000_xeq9L7R7+mxD7SQa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56100 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750963AbZD1GYw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Apr 2009 02:24:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, Mike Rapoport <mike@compulab.co.il>

--Signature=_Tue__28_Apr_2009_16_24_44_+1000_xeq9L7R7+mxD7SQa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Liam,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/regulator/userspace-consumer.c:43: error: conflicting types for 'sh=
ow_state'
include/linux/sched.h:273: note: previous definition of 'show_state' was he=
re

Caused by commit 5defa2bce704ca4151cfe24e4297aa7797cafd22 ("regulator:
add userspace-consumer driver") which I have reverted for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Apr_2009_16_24_44_+1000_xeq9L7R7+mxD7SQa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn2oSwACgkQjjKRsyhoI8yacQCfaoW5CZW9H0Dgx1NNgCLZsX0j
vpMAoIu+igepW3cvHAzjScJb12X5Uvhj
=9eVS
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Apr_2009_16_24_44_+1000_xeq9L7R7+mxD7SQa--
