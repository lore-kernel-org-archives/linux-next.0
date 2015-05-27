From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the backlight tree
Date: Wed, 27 May 2015 13:11:18 +1000
Message-ID: <20150527131118.6e3ef667@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D2MbEb_pg.pRiOYpjurw1Tx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: linux-next.vger.kernel.org

--Sig_/D2MbEb_pg.pRiOYpjurw1Tx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

After merging the backlight tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/video/backlight/backlight.c: In function 'of_find_backlight_by_node=
':
drivers/video/backlight/backlight.c:563:2: error: implicit declaration of f=
unction 'of_platform_device_ensure' [-Werror=3Dimplicit-function-declaratio=
n]
  of_platform_device_ensure(node);
  ^

Caused by commit 67a6b10546ea ("backlight: Probe backlight devices on
demand").

I have used the backlight tree from next-20150526 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/D2MbEb_pg.pRiOYpjurw1Tx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZTXbAAoJEMDTa8Ir7ZwVwjcP/Rw6FdIIcHRToB+JliAG3qT2
dr3yI9U8hRuuSPAeBmy/0uMncvvys0JxGhtGCgTU0lKJKkNJIPLHmAddW9m+zoU0
QRlll4Smve2G4jz+hoIgM+gNuZGeMFZu+yYQMlj1zwCTfqpDfJPPZw/N9bcK8Frd
sy+pI0Ne/EZzi3sfIY7VyL1JouHpcpf0VWB/m3QeIPh/79AVttFP+DnJRgh4wk35
fDc/Cp9isLkp4rYkHB1bDgosi1Wll8QvS7hJfWi+xPQPJJO07sfPVqLeKo1hQ4c2
VnL481X/6TSMGYeUMBBxqIh6WGXnpHdIQfgcgzq3fV48NkJFWe4jxRUCOrmRrvIR
EYVA4kJ68WusuH5SIy/ip5UUctBiGP5gTgoBBNKmINU4WZ9PgBmQfSlFX4nTNAsf
lVyIBLSivuW02Rgc0V2LcbDUutiOXdyLcAZC+TIRm0nMp0ImCZwbC0QkJIEGa640
W8E3K4E7H+V7plnP7+uQEHrPmOu23523Dio2+nnJPLDluxWiBsw78DaICdFdUqdi
6R3Xk5XAsJvrlDEYy1k8mpYDbW9upYnybd9HK46poOGoKe34QMl7nYr6fpeJi1Hz
bl1cl1sJ5FD1LJrg3QcuoieNNyKSe0wa+ySyQKCEbiFskZDDzvs6caGxOZ1oJcWK
OggkGSpCAhIjf20aIKnM
=joL1
-----END PGP SIGNATURE-----

--Sig_/D2MbEb_pg.pRiOYpjurw1Tx--
