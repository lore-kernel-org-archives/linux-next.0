From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tty tree
Date: Mon, 11 May 2015 15:16:26 +1000
Message-ID: <20150511151626.5550750b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9uJTwUWGQNDVpkSywUYQm0W"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54245 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751870AbbEKFQc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 May 2015 01:16:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Martin <Dave.Martin@arm.com>, Jakub Kicinski <kubakici@wp.pl>

--Sig_/9uJTwUWGQNDVpkSywUYQm0W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the tty tree, today's linux-next build (arm multi_v7_defconfi=
g)
failed like this:

drivers/tty/serial/amba-pl011.c: In function 'pl011_startup':
drivers/tty/serial/amba-pl011.c:1582:5: error: 'struct uart_amba_port' has =
no member named 'tx_irq_seen'
  uap->tx_irq_seen =3D 0;
     ^

Caused by a mismerge between patch "Revert "serial/amba-pl011: Leave
the TX IRQ alone when the UART is not open" (that appears in Linus' tree
and the tty tree) and commit 1e84d22322ce ("serial/amba-pl011: Refactor
and simplify TX FIFO handling") from the tty tree.

I applied this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 May 2015 15:12:50 +1000
Subject: [PATCH] serial/amba-pl011: fix mismerge

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/tty/serial/amba-pl011.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl01=
1.c
index 6fabc059efed..f5bd8426fd75 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -1578,9 +1578,6 @@ static int pl011_startup(struct uart_port *port)
=20
 	writew(uap->vendor->ifls, uap->port.membase + UART011_IFLS);
=20
-	/* Assume that TX IRQ doesn't work until we see one: */
-	uap->tx_irq_seen =3D 0;
-
 	spin_lock_irq(&uap->port.lock);
=20
 	/* restore RTS and DTR */
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/9uJTwUWGQNDVpkSywUYQm0W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUDsuAAoJEMDTa8Ir7ZwVBkgP/1Rq6KKW+oDLpUBprpYE9q//
2G+JXFyzW9d/r/tcV+MeBQtPJRI+htK70in/Oy3DjYsuwAcNvB+aBRYQyzRLcwIm
+DARjI+RxxuYzdJQabaEBggIn/5oY8Mv13Nvk7mPUrgrTQqCyq8Yz06lx4NYeq0Q
dWhH+LzEPzd4OtZmMLQ5EIRDr24UnSJI3+70yaOofQlzt7J801apfSdA3Mq5lK5c
LUdrhsuYfjb2zX3RPe4kkA976b1VjltvHu+MHNliDensypUQbxvaM4oj0wFlfJhe
9oGV6U9ZO4ui6vpmNPps7Brz9dpwELbMS5IHeGz2pwxDhMIK4fhn9K5FQDI32ljJ
BFbnA8/9HhA8A+gbGeGM3vkUmVLi5+TPxd3FqVqs5oXcIoDqJMZB9jHbA5pJrfOn
r/kB3NpFRvsSns2W52chIucD7jYnqGvIuJRd10AVk1l+Ar1cHCrtZ+5iEorM9bBd
oiTYXv73PvFipEHRahg9Hu37iLi9L2ksnKF33nwUuymfAjYfs6WZfakfbp2PTlb6
QLj80HHblopGLGvuT2R0Qt/uzx4czo/pcIz1JFAzRP7y1j9LoZcmEgB7EajJf+dE
5jlE885i4y44mFWn2cY8tjtUovIygUIknY0d8rMsMjZk5oyEdhlmi7ioIZ/hGBNQ
xnD56aUsVkWcIA8q/WCt
=57UM
-----END PGP SIGNATURE-----

--Sig_/9uJTwUWGQNDVpkSywUYQm0W--
