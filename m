From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 21:23:53 +1000
Message-ID: <20080701212353.87ee406c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_21_23_53_+1000_sRDda4xZRqm2o04V"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35552 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751815AbYGALYA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 07:24:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Adrian Bunk <bunk@kernel.org>, Greg KH <greg@kroah.com>

--Signature=_Tue__1_Jul_2008_21_23_53_+1000_sRDda4xZRqm2o04V
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/digi_acceleport.c between commit
6eccba01fa8ba0cfacca64297fc15f7d4077386e ("USB: remove CVS keywords")
from the usb tree and commit 44234195121820158769cdc2cc92e080dd94d8fe
("34-tty-tidy-usb-digi-acceleport") from the ttydev tree.

The former just removes the CVS annotation in the header comments which
are reformatted in the latter and also removes the CVS annotation.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_21_23_53_+1000_sRDda4xZRqm2o04V
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqE8kACgkQjjKRsyhoI8xQOACgtqXvkGg73E/xIhCffWFWiAeM
j3sAoJe6rgVU9zJ3XQa1Ivpa61y9GbII
=1e4D
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_21_23_53_+1000_sRDda4xZRqm2o04V--
