From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Tue, 12 May 2015 13:14:35 +1000
Message-ID: <20150512131435.1bcb828a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/odZWh1sIIdA+J_0VmGq8NoX"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42793 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752235AbbELDOo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 May 2015 23:14:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Sperl <kernel@martin.sperl.org>, Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>

--Sig_/odZWh1sIIdA+J_0VmGq8NoX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

After merging the spi tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/spi/spi-bcm2835.c: In function 'bcm2835_spi_can_dma':
drivers/spi/spi-bcm2835.c:381:7: warning: cast from pointer to integer of d=
ifferent size [-Wpointer-to-int-cast]
  if (((u32)tfr->tx_buf % 4 =3D=3D 0) && ((u32)tfr->tx_buf % 4 =3D=3D 0))
       ^
drivers/spi/spi-bcm2835.c:381:38: warning: cast from pointer to integer of =
different size [-Wpointer-to-int-cast]
  if (((u32)tfr->tx_buf % 4 =3D=3D 0) && ((u32)tfr->tx_buf % 4 =3D=3D 0))
                                      ^
drivers/spi/spi-bcm2835.c:387:7: warning: cast from pointer to integer of d=
ifferent size [-Wpointer-to-int-cast]
  if (((u32)tfr->tx_buf % SZ_4K) + tfr->len > SZ_4K) {
       ^
drivers/spi/spi-bcm2835.c:387:26: error: 'SZ_4K' undeclared (first use in t=
his function)
  if (((u32)tfr->tx_buf % SZ_4K) + tfr->len > SZ_4K) {
                          ^
drivers/spi/spi-bcm2835.c:387:26: note: each undeclared identifier is repor=
ted only once for each function it appears in
drivers/spi/spi-bcm2835.c:392:7: warning: cast from pointer to integer of d=
ifferent size [-Wpointer-to-int-cast]
  if (((u32)tfr->rx_buf % SZ_4K) + tfr->len > SZ_4K) {
       ^

Caused by commit 3ecd37edaa2a ("spi: bcm2835: enable dma modes for
transfers meeting certain conditions").

I have used the spi tree from next-20150511 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/odZWh1sIIdA+J_0VmGq8NoX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUXAgAAoJEMDTa8Ir7ZwVPN8P/RYjyl7COdPWJ79pRJs6Knri
hHb9Utx/qJPDGelxTKjO23+SkgEDY3IHSuewG1Uvh2Mcb/t83EEiJUT6AaMrddsr
VUAL3asP5I7zqN29H2zn1eh65/8behsXvx/RKk/ydaACnin79XJYVA8KMZGVnbB9
dms2m4s4bBtpfGgZ5EFkGwUx1gH05Ayu6IFbSOu5oEccRuQJ+IPEcLW2hFVE21kZ
9FC1zi1/L9/n2QwX+F9+sJt7r5uwyLDj2ErcgzHk6A2sSFO48srO9wcMooxtYfA8
lAKa1ocvvgJqN+M7rNW2b9+wqhN5NkRZ2t3oxgiONe+nGVsVGaQ8rt94jxWNh8mK
pAcsP6Hx6P0fKxpJpS8vbXCdkWetcvD4EFservcwhtpJDh75oo7TVn4H/jpm3dEE
mC1TyQyH3AEjttBZIrChbFK4gRzhUDerGI/dop8Vv3NbBk3l2eH8HRVHkG/Euyiq
ITBZqm2NmEGsg4TVh5xukOcKmc31F+o2nw3ZlzwWuXTvMXwO1YmhYtnjp8ASSb42
FfaZ0JVXcqv2Tqyo3oGiFf/1MdQtcZFrqKEJ36c25OxGBOT7oiWDZYh/EUmWWaeN
Xn8TPyotosyyvNEYT0lBnmktCY1DfJ2eT31LWbuhzdQzohZu5B5a8u9nkUJ/xMkI
UNFSx9NMBGU3rRRexdTB
=LR5f
-----END PGP SIGNATURE-----

--Sig_/odZWh1sIIdA+J_0VmGq8NoX--
