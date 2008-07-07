From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree
Date: Tue, 8 Jul 2008 02:02:16 +1000
Message-ID: <20080708020216.204c2d64.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_02_02_16_+1000_4O2mYT4QR7KEd41N"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50432 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753356AbYGGQC3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 12:02:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>

--Signature=_Tue__8_Jul_2008_02_02_16_+1000_4O2mYT4QR7KEd41N
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the firmware tree got a conflict in
include/linux/firmware.h between commit
69d44a1835ec8163a82c4ee57367f87ae0f85c2e ("firmware: fix the
request_firmware() dummy") from Linus' tree and commit
81d4e79acbda3c3f8cbdcc7284b643083314e9c8 ("firmware: allow firmware files
to be built into kernel image") from the firmware tree.

It was just contextual.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_02_02_16_+1000_4O2mYT4QR7KEd41N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhyPggACgkQjjKRsyhoI8w3MgCdEGWuf4XQXJnePG04gFiW0MAT
1ewAn02I1ZdjFFa8HPvMDIA5iZV3cNJk
=T78h
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_02_02_16_+1000_4O2mYT4QR7KEd41N--
