From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 23:56:54 +1000
Message-ID: <20080701235654.e6ed42d4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_23_56_54_+1000_2NHPb3LCi5xqxQf="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56041 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752791AbYGAN45 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 09:56:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Kay Sievers <kay.sievers@vrfy.org>, Oliver Neukum <oliver@neukum.org>

--Signature=_Tue__1_Jul_2008_23_56_54_+1000_2NHPb3LCi5xqxQf=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Just added some cc's]

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/usb-serial.c between commits
0eb943841bdeb2210058e899cef11f6084bedf82 ("USB: usb dev_name() instead of
dev->bus_id"), c19b07f9e5990423131d0435b303e572dc3132d0 ("USB: usb
dev_set_name() instead of dev->bus_id") and
26a8abb358ae6110b8c46afc40a85e6f47bc8eeb ("USB: fix usb serial pm counter
decrement for disconnected interfaces") from the usb tree and commit
ce8194a09dee5b7e101467aba6b7cd5617b1cd0f ("23-usb-serial-api-change") and
ca66d73b800beb3bd391d9109ee13612755305cf ("44-tty-tidy-usb-serial")from
the ttydev tree.

The fixups were fairy obvious.  I can carry them.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/


--Signature=_Tue__1_Jul_2008_23_56_54_+1000_2NHPb3LCi5xqxQf=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqN6YACgkQjjKRsyhoI8zcaACffbG28FqU+dwi0kY+Bn8ky8jJ
J9gAniqirUa8+lEOwkyT3YHiE1iQtlzS
=VnMS
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_23_56_54_+1000_2NHPb3LCi5xqxQf=--
