From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the init tree with the mips tree
Date: Thu, 4 Jun 2015 21:35:29 +1000
Message-ID: <20150604213529.78c4a7f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HHKwKJZZVOiWbAKDQzX1U4l"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/HHKwKJZZVOiWbAKDQzX1U4l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the init tree got a conflict in
arch/mips/loongson64/common/serial.c between commit d4d269403794
("mips: make loongsoon serial driver explicitly modular") from the mips
tree and commit 3a283d1794f5 ("mips: make loongsoon serial driver
explicitly modular") from the init tree.

I fixed it up (I used the init tree version) and can carry the fix as
necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/HHKwKJZZVOiWbAKDQzX1U4l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVcDgGAAoJEMDTa8Ir7ZwVw4MQAItBcaONpKlGSGmp7fBzutuw
JeZV6hXd1w1a+PNnEb1H1LIeTZJqDNq0s3iadwtuS+MdA1JEWsc6qDS6xbfwYAAH
wZqN+m/gDRV20vtqCDZ/cyAK3n0b2ZrkKvAFha617UHoN9u9MGvUpGKbKQTqgcPI
qVs+zkY17BH5+dwfOgAjkfmsB+ScZ8xrXywi7SVKWwSZ7bIrxGWdYxdMFmZzTq9N
nTD5LZSOjL7+Smw847FCA5v066mNWfqf4/Eh0i6OKWKKgmws9sf5+PtCDX7M2JRr
/cn8Hg+m28i2BzeFkkli1CdSz9gEviAC4EXrS8oBtwgcE79AKH1OyguOZhx9ls/S
v44i6pYJ3ObtOWomLxI0N9lbWhoRrLIhYn+kM1CoHsIh7bCllWTTCk4Dwd7NVqUH
BzybRwnyqI4kWAKcnGZf7v5ajEF8RCz0sO8IsoOqALmDxn3jmShLTsQ9QfbTMVjR
g73DRTlFZYUwtnqupf5Od8BrGhAfJQFUJylOXlSxLm10tErDZHtyZW7EhELarsTe
vVSkHDbZcgCf9rBlG1iOv27nloIQHl+s9NMyBSuiVtspfKW5+3kyuxTM/7DNJk8o
Gd//khxnBjTHIHNSNRsOWwoRCeprIJx4OeLAIpSdAVuQB3Zi1W9kR0LoqYyhIEGx
rtlMkicOfJS+8NhLth+3
=0GmY
-----END PGP SIGNATURE-----

--Sig_/HHKwKJZZVOiWbAKDQzX1U4l--
