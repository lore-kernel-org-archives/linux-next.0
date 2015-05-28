From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the extcon tree with the mfd tree
Date: Thu, 28 May 2015 19:06:11 +1000
Message-ID: <20150528190611.3e8bfa7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+49opCsQdcpDC40yCfV3ca5"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35895 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751332AbbE1JGR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 May 2015 05:06:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Inha Song <ideal.song@samsung.com>

--Sig_/+49opCsQdcpDC40yCfV3ca5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chanwoo,

Today's linux-next merge of the extcon tree got a conflict in
include/dt-bindings/mfd/arizona.h between commit 8dc296794d4b ("mfd:
arizona: Add convience defines for micd_rate/micd_bias_starttime") from
the mfd tree and commit 9e86b2ad4c11 ("extcon: arizona: Add support for
select accessory detect mode when headphone detection") from the extcon
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/dt-bindings/mfd/arizona.h
index 555609910acb,fee48e624036..000000000000
--- a/include/dt-bindings/mfd/arizona.h
+++ b/include/dt-bindings/mfd/arizona.h
@@@ -90,18 -90,8 +90,22 @@@
  #define ARIZONA_INMODE_SE   1
  #define ARIZONA_INMODE_DMIC 2
 =20
 +#define ARIZONA_MICD_TIME_CONTINUOUS                 0
 +#define ARIZONA_MICD_TIME_250US                      1
 +#define ARIZONA_MICD_TIME_500US                      2
 +#define ARIZONA_MICD_TIME_1MS                        3
 +#define ARIZONA_MICD_TIME_2MS                        4
 +#define ARIZONA_MICD_TIME_4MS                        5
 +#define ARIZONA_MICD_TIME_8MS                        6
 +#define ARIZONA_MICD_TIME_16MS                       7
 +#define ARIZONA_MICD_TIME_32MS                       8
 +#define ARIZONA_MICD_TIME_64MS                       9
 +#define ARIZONA_MICD_TIME_128MS                      10
 +#define ARIZONA_MICD_TIME_256MS                      11
 +#define ARIZONA_MICD_TIME_512MS                      12
 +
+ #define ARIZONA_ACCDET_MODE_MIC 0
+ #define ARIZONA_ACCDET_MODE_HPL 1
+ #define ARIZONA_ACCDET_MODE_HPR 2
+=20
  #endif

--Sig_/+49opCsQdcpDC40yCfV3ca5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZtqHAAoJEMDTa8Ir7ZwV2HYP/joFD68iL9B9H4VX4ygT7qeH
JCZzAT39FZ3oJfirVXavHHEKfIuuKjTbqjjkVZUXHi/eTdX4VCVhOSPR+1PaxEDr
kQeKSKc5rMLnaIUgBxDo/Q1u0nfi0c3PVkoStrvU6RzjCO10eekFmSCXsoEIg5r4
AQ0XNQ8S//UZaKfeunJVWYB2HtQz8s3Ha7Z9ZXthFR2UJtVccpE62pR4MJ/+UF1O
ZkoYG3T0tjf0YxbZK4IS4YhOoCF8gM9aPrZgm6jjszjZQCzYR/7ADy40sscLCdTa
1mfBaG1NoJnFUcxL5NcOeqpwks9cVeyWay6OZPiQT1LDH0aDgvqzNx68jCvgSzbu
BUmXH70z37e0wkj1cIKBk5TlBG1xMR3aS7MSVQPBHFvI0JzQFQFld2554oD3+zTy
J+UONKtGduOQexR200vPqaQi9bvgwaa7Kq46BLT3a8dKM5Lc8KwisfgFEcvR0hCv
DNQ7CU5PwU8vC/TreajlbAmFNfIP42JtlJKO4Vi1cgQX/0YxGGqQ2o/N36kYqfOx
kFooEAlLFGvbjz1oSER3AW3dwTgVeLW96WVxrLPlRdvCFdhRFkbDMnl4TDpnO+IS
BFOwDAVQ2ysbK3CSj8qfXhX8Fq9JC7ewwlay1p6catj6jWVG+LDahyzjN2ugYSpj
+qGB1BweE0rqMVprEfdp
=9FSw
-----END PGP SIGNATURE-----

--Sig_/+49opCsQdcpDC40yCfV3ca5--
