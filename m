From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the thermal-soc tree
Date: Wed, 4 Mar 2015 18:06:36 +1100
Message-ID: <20150304180636.78c66f79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/y.SIc=IqMUYvTXglX3yRWis"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Javi Merino <javi.merino@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/y.SIc=IqMUYvTXglX3yRWis
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eduardo,

After merging the thermal-soc tree, today's linux-next build (arm
cm_x2xx_defconfig (at least)) failed like this:

include/linux/thermal.h:408:38: error: parameter name omitted
include/linux/thermal.h:413:1: error: expected identifier or '(' before '{'=
 token

Caused by commit ddd4dd8ddf78 ("thermal: extend the cooling device API
to include power information").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/y.SIc=IqMUYvTXglX3yRWis
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAEBCAAGBQJU9q8BAAoJEMDTa8Ir7ZwVJdwP+NqhuRCiTvP5YDHD2N+/FEVr
PYC73gHx4Lrw1Q4Kczq3Lu+SJSthG3fGZ4Ek2+GTvCU4ytFxhnWWondZYmGzHdTe
no784rR++g4esuHezthAPYfGgGEwhObHpAOcxl2TUUSdOI2+iJJVYGZCrO+l2dZS
Qro1ywNTV4M0Mkjh3KnQh1RR8GxsuItv4pQNFoNzbGnRtLrUxWwUT1f5FrPITpMH
bgKa570qy+txD8A8dm0JEJkxxGv/2iFMqR49JPreS+FShS7LK4f45AHBugwBMAx3
U4tpgmY210lL9yJV6S3e5+0O6NG30XyWOfIeFFR8esOiuNwaQDwZ9nB2auYtF8X7
6sYhhzRmukyhxYmiyk/YUSZdS9GhSSw9eOeokF90L3GIFf9bJh/gt0bcmTDFW2++
nB3tL1z4ahUKpcnROvjbo2ugBv0iQMzqH8K/ZbLL71G8rh8C74qJaIzmCRwDxjba
tsFgCMHSBqFmFqPjwXLhMpDMJxoErn0KShux8rHA+SugnPBxHcqEtgEUdqLCAsYN
hcHaXCuziBI6ixwml5GwbxDXmliycqBqay0q5qOCclMc53P8zjEwM2uFpSD6siwx
Vr5PULm93v4MLv+K/d94L0XrxG7hFm1NsqqUgvxRNrg1jZmxuf1PE56lOTTPVS8W
WlfIbMrRwjTHnPRiDaI=
=tiHE
-----END PGP SIGNATURE-----

--Sig_/y.SIc=IqMUYvTXglX3yRWis--
