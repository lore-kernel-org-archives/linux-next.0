From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 21:17:12 +1000
Message-ID: <20080701211712.0cfac5d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_21_17_12_+1000_f4uH3FlS=lfW1R.C"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52979 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752627AbYGALRS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 07:17:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, Greg KH <greg@kroah.com>

--Signature=_Tue__1_Jul_2008_21_17_12_+1000_f4uH3FlS=lfW1R.C
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/cp2101.c between commit
d79161478cea51d1ea3c470c26c9999e228761f2 ("USB: cp2101.c fix sparse
signedness mismatch warnings") from the usb tree and commit ce8194a09dee5b7=
e101467aba6b7cd5617b1cd0f ("23-usb-serial-api-change") from
the ttydev tree.

I have used the version of this file from the ttydev tree with the
addition of the signedness changes from the usb tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_21_17_12_+1000_f4uH3FlS=lfW1R.C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqEjgACgkQjjKRsyhoI8x6KACglYrOXT9ZZDDPob/tFirdHoh+
bIEAn14AzF6+7ToFNdpO0eWVS/jTzwO3
=89/b
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_21_17_12_+1000_f4uH3FlS=lfW1R.C--
