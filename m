From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Wed, 13 May 2015 16:55:16 +1000
Message-ID: <20150513165516.66a0dbbb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Zw/Nq9y50//.K2+T0kkj.TX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Zw/Nq9y50//.K2+T0kkj.TX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpio/gpio-dln2.c: In function 'dln2_gpio_probe':
drivers/gpio/gpio-dln2.c:469:12: error: 'struct gpio_chip' has no member na=
med 'exported'
  dln2->gpio.exported =3D true;
            ^

Caused by commit 6a4b6b0a3b55 ("gpio: sysfs: clean up chip class-device
handling").

I have used the gpio tree from next-20150512 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Zw/Nq9y50//.K2+T0kkj.TX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUvVYAAoJEMDTa8Ir7ZwVyJsP/1b3HpRGoCa0b90vPJQOHe/N
2dsslRYSkrr4hnTAne6JDJk1msAZlj+agWOlh79OjL9rdY1S3Y3XQrs/FBsIi0mG
BwAodcDLI9axCGX/Kys7VFNxkWOhcgrtdM4LwMMX/qTC1QVJmECvQFLgLENaXz0e
Fg3Acrf6AHCsJRsTnePZheCehdz/3d882UCvoWEh4b1NXmqZzY6JZELl8PA1sl3M
SjDCTXEFAkwUWPiq9aCOYbq5UgZBdA0fNUGJDwJhhpdA/XFRUua/hZ1pB8TdM2PM
nM9y2P6qj2c3Qltp1GXwh0D2GUguDYnrZdbOz/o2E3mT9FHV4zD2Co5SmesX5qOH
LBkIR2+1JoFkJmeqVS3uPdGE7WpzznIrT7LN3bQLV5ZJMO+fZqosPE9P3FiTVI6z
3vItQEDv/s+cMIGn/g1uySSxDKNQGUmKnO0zwDIxNqMRKXbH3b7qef3kvTlhwUib
oCr+pKKouYXFDZ8qxtNV+jRrSyFY5PqngYve19vmWWogJxEpHZCGQdOQyhXP5msE
/R4DF/6sS2NKPI2QNs2FbBTTLR/oeiRvDsXLtjZtVeXbFfIZ3VGQoTPV5Xb6O2DJ
j8o1QKOdKskW7dtMAdNowuXLcHLRP+Y0BhA/H/NoMcUdcV3QeiyVNtWqD21F8XiV
ETAjnmHPlxQaHl1b2igP
=dClc
-----END PGP SIGNATURE-----

--Sig_/Zw/Nq9y50//.K2+T0kkj.TX--
