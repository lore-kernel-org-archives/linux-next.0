From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Mon, 25 Aug 2008 18:33:41 +1000
Message-ID: <20080825183341.c986d52b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__25_Aug_2008_18_33_41_+1000_H.JOfvKmUbl9zJcJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54598 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752004AbYHYIdt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 04:33:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

--Signature=_Mon__25_Aug_2008_18_33_41_+1000_H.JOfvKmUbl9zJcJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/char/tty_io.c between commit
e9b4b8816d7516318a3472f600ad9734e300c7bc ("device create: char: convert
device_create_drvdata to device_create") from the driver-core tree and
commit ee32c06e38600122f51aca2de893d1027251719a
("tty-move-special-cases") from the ttydev tree.

The latter moved some code that the former modified
(device_create_drvdata -> device_create changes).

I basically just used the version from the ttydev tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__25_Aug_2008_18_33_41_+1000_H.JOfvKmUbl9zJcJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiybmUACgkQjjKRsyhoI8xQDwCZAQxXLZvG80dZYVHlkH2jUlEN
NH0An0siJsNYIAJxhMiSFZOtOQd3quo6
=Uoml
-----END PGP SIGNATURE-----

--Signature=_Mon__25_Aug_2008_18_33_41_+1000_H.JOfvKmUbl9zJcJ--
