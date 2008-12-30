From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi tree build failure
Date: Wed, 31 Dec 2008 03:16:39 +1100
Message-ID: <20081231031639.dc19a03c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__31_Dec_2008_03_16_39_+1100_p6KAUY0KRK99rCxN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50049 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751779AbYL3QRD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Dec 2008 11:17:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jaswinder Singh <jaswinder@infradead.org>

--Signature=_Wed__31_Dec_2008_03_16_39_+1100_p6KAUY0KRK99rCxN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (sparc defconfig) failed like this:

drivers/scsi/qlogicpti.c: In function 'qlogicpti_load_firmware':
drivers/scsi/qlogicpti.c:480: error: 'struct qlogicpti' has no member named=
 'sdev'

An interaction between commit 68175399c8b5ee90960e78c1bb8e3353e71fbf33
("[SCSI] qlogicpti: use request_firmware") from the scsi tree and commit
5dc2536bb8d8adb5fdfbe76cd6fdcdf9de3f40f8 ("qlogicpti: Convert to pure OF
driver") which is in Linus' tree.

The version of the firmware commit that has been in the firmware tree
since Nov 19 has this conflict corrected.

I have left it for today (as it is getting way to late).  Please fix it
up for tomorrow.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__31_Dec_2008_03_16_39_+1100_p6KAUY0KRK99rCxN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklaSWcACgkQjjKRsyhoI8z0oQCgmHSAdH/onAzc9Odko0rFFzGr
ZkwAoJO96cfKLDtr0Php2JeB+KZIkmTm
=BnXq
-----END PGP SIGNATURE-----

--Signature=_Wed__31_Dec_2008_03_16_39_+1100_p6KAUY0KRK99rCxN--
