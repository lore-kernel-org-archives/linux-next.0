From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the spi tree with the sound-asoc tree
Date: Wed, 6 Feb 2013 15:08:18 +1100
Message-ID: <20130206150818.26d50907120110d160e0e236@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__6_Feb_2013_15_08_18_+1100_qz6XEgoTyekzeU/N"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__6_Feb_2013_15_08_18_+1100_qz6XEgoTyekzeU/N
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

Today's linux-next merge of the spi tree got a conflict in
drivers/spi/spi-s3c64xx.c between commit b5be04d35dbb ("spi: s3c64xx:
Modify SPI driver to use generic DMA DT support") from the sound-asoc tree =
and
commit 75bf33611041 ("spi/s3c64xx: fix checkpatch warnings and error")
from the spi tree.

I fixed it up (the former removed a function modified by the latter) and
can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__6_Feb_2013_15_08_18_+1100_qz6XEgoTyekzeU/N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJREdcyAAoJEECxmPOUX5FEfmkQAJSDsGfF1+0v7erlk80DOxHV
BfsMJPXool1ns5868vFZkQEwHU5qL2Ni5PMzpYvuUQqASJoqT+wyHeFKFiiiArGs
tp44VZkXmfGbZet17TnY0Ie6mLKQ3zhjNWMZGvWKlOoldTInoE/eGTmjer2GE1+o
fx31c13xBrVdVoa2xFnA0xSSKPo/5NAT0NeDyj2M5rNY6z7YC83xkPauo7TYr36a
NMY7DNzxcjW2hhzpiFz3vQshvOX/LSJdPZneN7hBS9zAahKanIE8Xam/cBVUWs0M
tFzcV0a3GPwRRm6m14q789S3dUw+h1vBNOus/EMgFvczkk03Si/RXrHHBxyGqUnE
zX6jy6N/SXdNmtaKRS2ajElhQCMEwAP19zAme3vFILRo4JC8bxSDQMnY7p/F9N11
EOw6Z5CqbjDLCIHEwQLFm6XSapExsEeB28gfee+Pm/1/qs38leJ5HO6KjkkJ2J8a
HXpkwVMIwLBQ0/0x8pPCAPCmNPDDP/8S+9LMJb+Q8SQscEnpjv6EbaqIyBjZZxWX
MmjMiWzNzaq6iPXZbqsllU2hvX3xFgRpUzwfQ/cdBKiDquxaCX8PNHZikNL6b7x5
TgDoEbqXVhDDFaXI3GjyopigvY14JLsQ9IyNAFb4/GwpqBGgiBn7RvnUC+reSfzj
Jo3oN589hIM0tMzYtEBc
=/96E
-----END PGP SIGNATURE-----

--Signature=_Wed__6_Feb_2013_15_08_18_+1100_qz6XEgoTyekzeU/N--
