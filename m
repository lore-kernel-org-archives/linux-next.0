From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rtc tree with the mfd tree
Date: Sat, 20 Jun 2015 22:16:17 +1000
Message-ID: <20150620221617.375623f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+sEsHmxwgI8TuB/BXs4Rgc6"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59009 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753558AbbFTMQ0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2015 08:16:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Lee Jones <lee.jones@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/+sEsHmxwgI8TuB/BXs4Rgc6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

Today's linux-next merge of the rtc tree got a conflict in:

  drivers/rtc/Makefile

between commit:

  b5b2bdfc2893 ("rtc: st: Add new driver for ST's LPC RTC")

from the mfd tree and commit:

  766218609678 ("rtc: Properly sort Makefile")

from the rtc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/rtc/Makefile
index ebe2c085d01c,5ea5370f56f2..000000000000
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@@ -135,6 -139,6 +139,7 @@@ obj-$(CONFIG_RTC_DRV_SPEAR)	+=3D rtc-spea
  obj-$(CONFIG_RTC_DRV_STARFIRE)	+=3D rtc-starfire.o
  obj-$(CONFIG_RTC_DRV_STK17TA8)	+=3D rtc-stk17ta8.o
  obj-$(CONFIG_RTC_DRV_STMP)	+=3D rtc-stmp3xxx.o
++obj-$(CONFIG_RTC_DRV_ST_LPC)	+=3D rtc-st-lpc.o
  obj-$(CONFIG_RTC_DRV_SUN4V)	+=3D rtc-sun4v.o
  obj-$(CONFIG_RTC_DRV_SUN6I)	+=3D rtc-sun6i.o
  obj-$(CONFIG_RTC_DRV_SUNXI)	+=3D rtc-sunxi.o

--Sig_/+sEsHmxwgI8TuB/BXs4Rgc6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhVmYAAoJEMDTa8Ir7ZwVrAAQAImiWltbRvoMmGp92Nzf5qwn
CwyLqgwKlmMMlsE5h1K0rRHLgxjiKlWoZzeFovNj8E5v0BMcAKkBxq9e/i57wFeQ
MCrQWNfZAIwNdXph4sAyE5qfm+8khsjviiF+oBXm/VpsNPgPD1bv9clWz2jv9eQF
TLJqANvEyBYUINJxJaBEqfKHrAhpUWHChpzsvny8xP7rIPzSBMPAG0fgsd9rZ0LB
/WrDJ6Tm2V6ql0hkDVuWpDI5i40IcZuzqM8drRhtCq47VOyXKLZ1k6X+1SC7BjJp
oisLe80ker7iXi1AbvL93y5b2g/sJcrUMmg4MvqT3/ZOnLxSaYOY0oR706EAJrRk
HKgYS4435ZA53tnVG4+iNUjdzZVj5eIP8is4k+2SEwdB9Cmn9tKGPZXS2VGagCB4
9Ih0znCa+ShxqW2Hjv4EF0srDbTBoh2XoZYfvgGu5JRgmTvKHNhs91hqhBiAmro+
98G3Il61/DC2IN6P2LFuqsd2l8u9pjZewhPBAorHEbCFz3YyAZy36ktdnADnCDzQ
ui+bXqyJHS3a4fkBRg5ZBWY9iV6xhG9C7s5K/AuY0DYyruoyp5ptTJbq4WgRwu2G
gLamT3gm8YbTqdRGLdztHUrdG7+8QtrXs7DUu03sRn+81k5A8sotU/VlvOI2H463
ZKfwiPdN6RK9mmwX7eSq
=2GDU
-----END PGP SIGNATURE-----

--Sig_/+sEsHmxwgI8TuB/BXs4Rgc6--
