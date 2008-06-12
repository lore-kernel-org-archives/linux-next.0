From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: mtd/avr32 merge conflict
Date: Thu, 12 Jun 2008 14:55:38 +1000
Message-ID: <20080612145538.0835c0b8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Jun_2008_14_55_38_+1000_aXB6GMXs3oBlCIUf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52646 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751404AbYFLEzr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 00:55:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, =?UTF-8?B?IkjDpXZhcmQgU2tpbm5lbW9lbiI=?= <haavard.skinnemoen@atmel.com>, Hans-Christian Egtvedt <hcegtvedt@atmel.com>

--Signature=_Thu__12_Jun_2008_14_55_38_+1000_aXB6GMXs3oBlCIUf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the mtd tree got a trivial conflict in
include/asm-avr32/arch-at32ap/board.h between commit
f01fb51fc0e2b77c8bbf4d41adfd74c367173b02 ("avr32: Add PSIF platform
devices") from the avr32 tree and commit
62090a08aba579e6c69319fac4d4a1f806f26400 ("[MTD] [NAND] avr32: atmel_nand
platform code for AT32AP700x") from the mtd tree.

It was just a case of overlapping additions.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Jun_2008_14_55_38_+1000_aXB6GMXs3oBlCIUf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhQrEoACgkQTgG2atn1QN+LvwCcDeOiiIpol7S6+THz/2WhDau5
7CAAoJPaSgQ9JP+eh0fde6FBCP2j8sU5
=1Xa3
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Jun_2008_14_55_38_+1000_aXB6GMXs3oBlCIUf--
