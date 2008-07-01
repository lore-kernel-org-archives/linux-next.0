From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 21:44:03 +1000
Message-ID: <20080701214403.9d1e9cbf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_21_44_03_+1000_TqeW07g3iRlQYKjR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49623 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753106AbYGALoI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 07:44:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

--Signature=_Tue__1_Jul_2008_21_44_03_+1000_TqeW07g3iRlQYKjR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/io_ti.c between commit
47794b33055da7b52e6718bc97258c95cba8cd67 ("USB: io_ti: FIrst cut at a big
clean up") from the usb tree (the equivalent of which appears to be in
the ttydev tee as well) and commit
ce8194a09dee5b7e101467aba6b7cd5617b1cd0f ("23-usb-serial-api-change")
from the ttydev tree.

There were many conflicts, so I just use the version from the ttydev tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_21_44_03_+1000_TqeW07g3iRlQYKjR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqGIMACgkQjjKRsyhoI8whygCfbQ5Ku9P6jiT4WK+x06QTHenm
e6gAnRK+AmLVY6ldzMI/4BiH6eMxIaEm
=4HAM
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_21_44_03_+1000_TqeW07g3iRlQYKjR--
