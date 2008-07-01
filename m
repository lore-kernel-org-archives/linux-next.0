From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 22:35:25 +1000
Message-ID: <20080701223525.8a425506.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_22_35_25_+1000_aauQi6zbxdTBeVed"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41425 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753705AbYGAMfa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 08:35:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

--Signature=_Tue__1_Jul_2008_22_35_25_+1000_aauQi6zbxdTBeVed
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/keyspan.c between commit
722051ff031346b1afd9008455d0b7eacfaa7c36 ("keyspan: use request_firmware
()") from the firmware tree and commit
ce8194a09dee5b7e101467aba6b7cd5617b1cd0f ("23-usb-serial-api-change")
from the ttydev tree.

The only real conflict was with the includes.  For the rest, I put the
firmware changes in over the tidyups.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_22_35_25_+1000_aauQi6zbxdTBeVed
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqJI0ACgkQjjKRsyhoI8wT6ACgjENBQyXCXcDJ63f5UAafOnD+
YLgAnRaYVDRMHNLFOEd3KXyyn+jy76sm
=jxh1
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_22_35_25_+1000_aauQi6zbxdTBeVed--
