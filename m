From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 21:33:10 +1000
Message-ID: <20080701213310.3fcdeb8c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_21_33_10_+1000__kwY3VWAdtP2rWHp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33178 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752859AbYGALdS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 07:33:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Nick Andrew <nick@nick-andrew.net>, Jesper Juhl <jesper.juhl@gmail.com>

--Signature=_Tue__1_Jul_2008_21_33_10_+1000__kwY3VWAdtP2rWHp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/ftdi_sio.c between commit
0bb08241ce68aaa70b7b804b4d6319d8bad3ae24 ("Tighten up the use of loose")
from the trivial tree and commit ce8194a09dee5b7e101467aba6b7cd5617b1cd0f
("23-usb-serial-api-change") from the ttydev tree.

The conflict is just in a comment.  I have applied the spelling
correction from the former to the version of the file from the ttydev
tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_21_33_10_+1000__kwY3VWAdtP2rWHp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqFfYACgkQjjKRsyhoI8wN9ACgv/gezJRmvgtCmiK8BEMF99Fq
/bsAnj4Iv+FflBKSMJ8n4do1LbXceh7n
=CfxD
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_21_33_10_+1000__kwY3VWAdtP2rWHp--
