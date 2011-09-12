From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Mon, 12 Sep 2011 12:05:18 +1000
Message-ID: <20110912120518.617c67e4abb1a1e92b5c327d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__12_Sep_2011_12_05_18_+1000_61Tt=A7TC6D5o+4B"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Nico Erfurth <ne@erfurth.eu>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__12_Sep_2011_12_05_18_+1000_61Tt=A7TC6D5o+4B
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

Today's linux-next merge of the arm-soc tree got a conflict in
arch/arm/mach-at91/board-usb-a9260.c between commit 2f8163baada3 ("ARM:
gpio: convert includes of mach/gpio.h and asm/gpio.h to linux/gpio.h")
from the arm tree and commit 6939fd49787e ("at91: merge board USB-A9260
and USB-A9263 together") from the arm-soc tree.

The latter removes this file, so I did that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__12_Sep_2011_12_05_18_+1000_61Tt=A7TC6D5o+4B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJObWjeAAoJEDMEi1NhKgbsTwYH/Rg2qIi9/m0vqGQLvQVNkqpj
T8SwL4Kte1ZXshJFpfCFFcHDJr6CWhvYu7jEWjxh65QmcUay808fY/e26R9exBuB
go3KDSiKkPVU3QFmUVgbPwfn3yzzrTk5SWVl9xjRUmJAk618qMTqu/OtxFtCcsVQ
41NGJdtQ52K+iJi3ovWgL7rTzVOTQ70q9lHAAyD5rwuvaCS0ES6xO1YEgzEIFedQ
aiunUyQLx/AFtBgmdJqzl9rLFB8qr+ddDj8bF6dNk2LDT6XBbe2VJ7OUEIrdqjTZ
g+lTzKYQeCCzdo9NHY3mnjPIROfYgP6bmF1wvZLuPmjccKuocRILmCR7xNCUqkU=
=OuT3
-----END PGP SIGNATURE-----

--Signature=_Mon__12_Sep_2011_12_05_18_+1000_61Tt=A7TC6D5o+4B--
