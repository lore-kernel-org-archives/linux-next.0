From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (battery
 tree related)
Date: Fri, 22 Apr 2011 08:05:55 +1000
Message-ID: <20110422080555.c7cd0e0b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__22_Apr_2011_08_05_55_+1000_QSJ_P8FOT2lN9w3V"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41445 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752428Ab1DUWGD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Apr 2011 18:06:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

--Signature=_Fri__22_Apr_2011_08_05_55_+1000_QSJ_P8FOT2lN9w3V
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Anton,

After merging the final tree, today's linux-next build (s390 allyesconfig)
failed like this:

drivers/built-in.o: In function `max8903_remove':
drivers/power/max8903_charger.c:355: undefined reference to `free_irq'
drivers/power/max8903_charger.c:357: undefined reference to `free_irq'
drivers/power/max8903_charger.c:359: undefined reference to `free_irq'

Caused by commit b14a9ccc1ddd ("power_supply: Add driver for MAX8903
charger").  This driver needs some Kconfig dependency.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__22_Apr_2011_08_05_55_+1000_QSJ_P8FOT2lN9w3V
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNsKpDAAoJEDMEi1NhKgbs610IAJ63lwrw/uveOChjCo8lBp5v
qkVu2qmvea51zsKx4iLq9SC5OcKyEjF37nQ9lBttxK6vbebgwVtfl67l7IKef4mz
AkFQwwlpvFkteFpZbhqJBtxFxz+4lN1fM949dAFTkfi4xbaNZI/ADzNwKeRZQTno
uGCb3GwSsUEm7C4DRDMqGMjXfV48wqA0PhWDcLnBI+syTIjdgXlqj4dS/egLJ3l9
njoHBiTA5T1sPatQnlGT+puDC5w918h1ndLCYb91VPb1WxqvZqoOw2ncWocssfDc
B7wUL8TzKZcFikY8Ao5/V2PImcRpRWOGO6PsqIWZhzx378NiXseAPhk64+sTLDg=
=5Kp/
-----END PGP SIGNATURE-----

--Signature=_Fri__22_Apr_2011_08_05_55_+1000_QSJ_P8FOT2lN9w3V--
