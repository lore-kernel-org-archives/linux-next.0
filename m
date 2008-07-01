From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Wed, 2 Jul 2008 00:17:40 +1000
Message-ID: <20080702001740.9bbea0df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__2_Jul_2008_00_17_40_+1000_rZzeQPtX04+ZmGL3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40347 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754989AbYGAORn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 10:17:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__2_Jul_2008_00_17_40_+1000_rZzeQPtX04+ZmGL3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

After all the merging, today's linux-next build (powerpc ppc64_defconfig)
failed like this:

make[3]: *** No rule to make target `drivers/char/tty_ldisc.o', needed by `=
drivers/char/built-in.o'.  Stop.
drivers/serial/serial_txx9.c: In function 'receive_chars':
drivers/serial/serial_txx9.c:275: error: 'struct uart_info' has no member n=
amed 'tty'
drivers/serial/icom.c: In function 'recv_interrupt':
drivers/serial/icom.c:733: error: 'struct uart_info' has no member named 't=
ty'

It could easily (probably) have been the merge.

I have reverted the ttydev tree for now.  I am not sure quite where we go
from here.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Jul_2008_00_17_40_+1000_rZzeQPtX04+ZmGL3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqPIQACgkQjjKRsyhoI8z/yQCgme+AoKm6pTeokra/YDyMzqri
oNgAn3M/HwJeYNsXYVsYSOgcGNyBqSkG
=ykoL
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Jul_2008_00_17_40_+1000_rZzeQPtX04+ZmGL3--
