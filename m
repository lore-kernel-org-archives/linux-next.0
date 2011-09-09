From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the at91 tree with the arm tree
Date: Fri, 9 Sep 2011 11:20:42 +1000
Message-ID: <20110909112042.0949282e1e38b8c68bb00b9b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__9_Sep_2011_11_20_42_+1000_S6=upm1JFxNRWJ9n"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:42634 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757289Ab1IIBUz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Sep 2011 21:20:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

--Signature=_Fri__9_Sep_2011_11_20_42_+1000_S6=upm1JFxNRWJ9n
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the at91 tree got a conflict in
arch/arm/mach-at91/board-usb-a9260.c between commit 2f8163baada3 ("ARM:
gpio: convert includes of mach/gpio.h and asm/gpio.h to linux/gpio.h")
from the arm tree and commit 6939fd49787e ("at91: merge board USB-A9260
and USB-A9263 together") from the at91 tree.

The latter removes the file modified by the former, so I did thet.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__9_Sep_2011_11_20_42_+1000_S6=upm1JFxNRWJ9n
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOaWnqAAoJEDMEi1NhKgbsf0MIAJ3aPqkEj1DZHogeWaMlJCMX
o77DKSf6+Y67ztx7VocYXJBQKeJzcNlgVnnOwO1Pbw0ujkmYWKQzpGh904pGPcJz
rPG1VpvxJRMksqS+gO3nM8omtWsBS9F12bBDfYsynxSMoWDjOK17qUjhGe7QiSAE
WZ6GE3Mbg65Wpgh2j/rK46yaJZqX0oslTdlXocjLpVlMTgF+4dRIco/SuTmV4ed0
7aIK9t4OUkCPbA2rIhFd2KueiKs48KOrLP8jm/SJ2wKRDQgJw7iiRV8PvTpKX8J2
uC2lg7M714BfPPraIOk+mOrDr6M+QVRIZVF5i0y1LjJJRNjwEmtqW+OAU4B09CU=
=3U28
-----END PGP SIGNATURE-----

--Signature=_Fri__9_Sep_2011_11_20_42_+1000_S6=upm1JFxNRWJ9n--
