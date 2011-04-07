From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the fbdev tree
Date: Thu, 7 Apr 2011 12:48:41 +1000
Message-ID: <20110407124841.d37bf9fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__7_Apr_2011_12_48_41_+1000_F2KDPyGT30O=96sF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59188 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754936Ab1DGCsy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Apr 2011 22:48:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ondrej Zary <linux@rainbow-software.org>

--Signature=_Thu__7_Apr_2011_12_48_41_+1000_F2KDPyGT30O=96sF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

After merging the fbdev tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/video/s3fb.c:29:26: error: linux/i2c-id.h: No such file or directory

Caused by commit f4d186dc6a28 ("s3fb: add DDC support").

I have used the version of the fbdev tree from next-20110406 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__7_Apr_2011_12_48_41_+1000_F2KDPyGT30O=96sF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNnSYJAAoJEDMEi1NhKgbsz2UH/jNwaj3NbvgEc2MPF7pP0o/e
sEhI1m1dZbkBMDkCgWpsA2SYJVbXmLqw9n4DZ6nq4AsAIg4onGbS1GwqlGQ6WjuZ
SrBe0hAwmOtJxTvoBXNe87L2U2Tq17emwaG8K5hHcnavX1fE5PuVw6XBQxkGzC/4
nNnK/3jUNTs8NymPNLcWuS3lLzF+/EFiHVWkX0MXwtEyzst4MjSvABiEDLmy3WWR
TbEhXRdrOGdjnKSW2ejMpac3Z/PUmWw46ZcXgXDF99VswDIyqzkLfjyraNx7DTG0
3ZkmHQOOfhXKwACysEl6NaFU2cFehTj/Pbpy9FH1pnPxioTUk5md/OHGcXab/M8=
=xePn
-----END PGP SIGNATURE-----

--Signature=_Thu__7_Apr_2011_12_48_41_+1000_F2KDPyGT30O=96sF--
