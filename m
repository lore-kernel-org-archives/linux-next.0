From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Mon, 20 Apr 2009 13:09:17 +1000
Message-ID: <20090420130917.d2b332c8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__20_Apr_2009_13_09_17_+1000_FHv+OmeUYL6AJtdC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54703 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752293AbZDTDJ3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Apr 2009 23:09:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__20_Apr_2009_13_09_17_+1000_FHv+OmeUYL6AJtdC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/usb/serial/digi_acceleport.c: In function 'digi_close':
drivers/usb/serial/digi_acceleport.c:1419: error: 'filp' undeclared (first =
use in this function)
drivers/usb/serial/digi_acceleport.c:1467: error: 'tty' undeclared (first u=
se in this function)

Caused by commit 97c58244361d981d22b3eca818c9a30d4f6fde2e
("tty-usb-use-port").

I have used the ttydev tree from next-20090417.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__20_Apr_2009_13_09_17_+1000_FHv+OmeUYL6AJtdC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknr510ACgkQjjKRsyhoI8yRvwCgnIYu7TIU6/cwQjD32uRG2jvX
ZAMAniJkAuQT7GTxvtyZXPPtlMxEmuww
=o8RU
-----END PGP SIGNATURE-----

--Signature=_Mon__20_Apr_2009_13_09_17_+1000_FHv+OmeUYL6AJtdC--
