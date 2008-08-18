From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Mon, 18 Aug 2008 16:08:19 +1000
Message-ID: <20080818160819.c2573877.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__18_Aug_2008_16_08_19_+1000__=kRuYxE2WI2_hCx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36770 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750924AbYHRGIi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Aug 2008 02:08:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__18_Aug_2008_16_08_19_+1000__=kRuYxE2WI2_hCx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/char/tty_io.c between commit
8c9a9dd0fa3a269d380eaae2dc1bee39e865fae1 ("tty: remove resize window
special case") from Linus' tree (which appears to also be in the ttydev
tree as "tty-remove-resize-special") and commit
2283faa9cec083b6ddc1fa02a974ce1c797e847f ("tty-fix-pty-termios-race")
from the ttydev tree.

The latter is just further changes, so I took the ttydev tree version.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__18_Aug_2008_16_08_19_+1000__=kRuYxE2WI2_hCx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkipEdMACgkQjjKRsyhoI8wL1ACgofl5iSQwIOUFd46FtXSMS+ab
WPsAoKrKSrvWOSWa0AqaXQ4fHZvo2x9e
=Nbmq
-----END PGP SIGNATURE-----

--Signature=_Mon__18_Aug_2008_16_08_19_+1000__=kRuYxE2WI2_hCx--
