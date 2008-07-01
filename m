From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 21:57:13 +1000
Message-ID: <20080701215713.8796c966.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_21_57_13_+1000_q1Kv=nUNScfrCJZa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44370 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753532AbYGAL5V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 07:57:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Felipe Balbi <me@felipebalbi.com>, Greg KH <greg@kroah.com>

--Signature=_Tue__1_Jul_2008_21_57_13_+1000_q1Kv=nUNScfrCJZa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/ir-usb.c between commit
3128101cf92692e300fdb8bf66a9e8f286cbaa7f ("usb: irda: cleanup on ir-usb
module") from the usb tree and commits
ce8194a09dee5b7e101467aba6b7cd5617b1cd0f ("23-usb-serial-api-change") and
ad58854921eeeab97a09600260ea03fa097394e4 ("48-tty-tidy-usb-ir-usb") from
the ttydev tree.

I didn't even know where to start :-(, so I used the version from the
ttydev tree (since the other is just a cleanup).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_21_57_13_+1000_q1Kv=nUNScfrCJZa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqG5kACgkQjjKRsyhoI8x/MACfeAnXNctdfqvaD706brsH91Pi
rOEAniPj6ryR/NRY2rXBYUrBKtUAT7Vn
=LU2z
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_21_57_13_+1000_q1Kv=nUNScfrCJZa--
