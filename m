From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the crypto tree
Date: Tue, 21 May 2013 11:45:48 +1000
Message-ID: <20130521114548.a7bc47b2247f39ec40c44e33@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__21_May_2013_11_45_48_+1000_+qQAf10O4cmk4y2G"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:34634 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755340Ab3EUBp6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 May 2013 21:45:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>

--Signature=_Tue__21_May_2013_11_45_48_+1000_+qQAf10O4cmk4y2G
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

After merging the crypto tree, today's linux-next build (x86_64
allmodconfig) failed like this:

arch/x86/crypto/crct10dif-pclmul_glue.c: In function 'crct10dif_intel_mod_i=
nit':
arch/x86/crypto/crct10dif-pclmul_glue.c:140:3: error: implicit declaration =
of function 'crc_t10dif_update_lib' [-Werror=3Dimplicit-function-declaratio=
n]
   crc_t10dif_update_lib();
   ^
cc1: some warnings being treated as errors

Caused by commit b85ed9f056ee ("crypto: crct10dif - Glue code to cast
accelerated CRCT10DIF assembly as a crypto transform").

I have used the version of the crypto tree from next-20130520 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__21_May_2013_11_45_48_+1000_+qQAf10O4cmk4y2G
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRmtHMAAoJEECxmPOUX5FEuigP/jDuxsCokWu9Cyay5SDezQus
RANy6gqwXWFjvkbdvr6huSwBUNcVF0EhUK92mj+i4D4aK+fL067b6CvbcyyXGXkt
v6vcP5uMNZY3rRyNk5kRc5/pvcQSK1Gakz9GHyOBokVluDObyaeomFPeovmxvGUR
A2SXi+b3/4jLf2KbAivn60+ttlBETzEAPeigsrOrHr/eG8RA9oDRcQpTCH0TbQ+k
Il9Rb1cbz6Szf7kZ92IEvtsND3El89KEdMS2re6IbIh0zKyXQibfAZP1eb6UhR/B
cTShtSGKdEygctxu2fj6wkrUk5GM7i63FKLDFFZYERU4Bp7wbJeKkEao2/AcCuLr
zjOFBoVk5XtIIyGdUaZsYCfOmYxJn4BoY183SOZxfReHExzO4uELHDjbIbEDNF2J
WT5rjq9CEH+gRpG3gMi8NQqACaxH/GduT2Z2ToBZ7MCiKpVjpZJa/zI/7dNItS2+
B1CRY3Z6MhrO+zOZUSijbUyUCXB7E2QI881pkJF8hrWKkgi+KtA3LiAOM25tKq+E
bke32ncQYxFRD36Pdj7zfIhkJd1eZtHjHJwoVA49YdO8Dfv221ydtpb9Ui2g2Aej
xDQuwNuQnSJV4F0mdUuZ6Zxn9/0Ka9dt+HIPFNnWqnc7Zz2QWXgrKvZbtRargrll
4chSmM/sW9pi5BU/OLIV
=jrgF
-----END PGP SIGNATURE-----

--Signature=_Tue__21_May_2013_11_45_48_+1000_+qQAf10O4cmk4y2G--
