From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 12 Aug 2008 16:55:20 +1000
Message-ID: <20080812165520.968f53ed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Aug_2008_16_55_20_+1000__ltYrzQixq_0b1mM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33684 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750988AbYHLGzd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 02:55:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>

--Signature=_Tue__12_Aug_2008_16_55_20_+1000__ltYrzQixq_0b1mM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/char/tty_io.c between commit
000b9151d7851cc1e490b2a76d0206e524f43cca ("Fix race/oops in tty layer
after BKL pushdown") from Linus' tree and commit
b3cfb0b9b2a6ca9d0bf8708688328ed65ce1ba99 ("tty-kref-get-current-tty")
from the ttydev tree.

It is just a contextual conflict (the former moved a line next to a
comment removed by the latter).  I fixed it up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Aug_2008_16_55_20_+1000__ltYrzQixq_0b1mM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkihM9gACgkQjjKRsyhoI8yOmwCfeIwXzYcjvcFdp1rd7g2QUcgf
DFQAoIccQOsTEWsTNTnDF8bSK+IcWdpP
=8dPr
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Aug_2008_16_55_20_+1000__ltYrzQixq_0b1mM--
