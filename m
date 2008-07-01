From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 21:10:03 +1000
Message-ID: <20080701211003.8ecd7d3b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_21_10_03_+1000_ObX1XrTvzpwBz5Mc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35040 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751127AbYGALKJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 07:10:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg KH <greg@kroah.com>

--Signature=_Tue__1_Jul_2008_21_10_03_+1000_ObX1XrTvzpwBz5Mc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/gadget/serial.c between commit
d4013f65e6b7be39e93845c280482e3f1d7894f0 ("usb gadget: use new serial
core") from the usb tree and commit
e806c01e6c8cacf955620105398902698ec3d933 ("79-tty-break-errorhandler")
from the ttydev tree.

The former patch removes the code modified by the latter.  I have used
the version from the usb tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_21_10_03_+1000_ObX1XrTvzpwBz5Mc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqEIsACgkQjjKRsyhoI8zQ0QCfTErpOfVM/0ZRvzfK+MNi1upj
XBQAoKP6/y8GJxSXS1cDhxXwPuOJBp7v
=qBn/
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_21_10_03_+1000_ObX1XrTvzpwBz5Mc--
