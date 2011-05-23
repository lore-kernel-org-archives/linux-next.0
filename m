From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sparc tree with the fixes tree
Date: Mon, 23 May 2011 12:21:16 +1000
Message-ID: <20110523122116.a1fa2aca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_May_2011_12_21_16_+1000_5T++CkKVDg5wwnDM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37720 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755211Ab1EWCVT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 May 2011 22:21:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Daniel Hellstrom <daniel@gaisler.com>

--Signature=_Mon__23_May_2011_12_21_16_+1000_5T++CkKVDg5wwnDM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the sparc tree got conflicts in
arch/sparc/include/asm/smp_32.h and arch/sparc/kernel/smp_32.c between
commit 951d04e4ef43 ("sparc32: fix build, move inline function to .c
file") from the fixes tree and commit d6d048192b1d ("sparc32: implement
SMP IPIs using the generic functions") from the sparc tree.

The latter seems to supercede to former, so I used the latter.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_May_2011_12_21_16_+1000_5T++CkKVDg5wwnDM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN2cScAAoJEDMEi1NhKgbscDkH/3n/jPX97RJ0pFPiwUvBw7xp
6sWW0zCclRzmnDPn45YPy4PJo6R8D2DVXAVuBuHN39Crrxl8Zs/w8PGuaHxk7g6I
usoBPRWohcSwvKel6PsunhWXNFN3+En+b1VFqAM0a2qfvENUxn+1lNiNv4ervA0G
h6NGeaCvSX8dK+mCgwS6jdAVAYXb4xpnOqAtJ/KoMMEkQ30G6rrq4E+U0J1Bplpx
E6ZbjyA5iaXlhfNp23s4dFqp/K5gH8/r4sqXtEUdDQRfIVpK1/mEMEBL+zEyefhr
tg16UbahJiANhHA3WcZB8gXtMqxbeuL2Kz8BTr+j6N18Qv/dyiX4pb/P1qSnyrQ=
=A1av
-----END PGP SIGNATURE-----

--Signature=_Mon__23_May_2011_12_21_16_+1000_5T++CkKVDg5wwnDM--
