From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree
Date: Wed, 23 Jul 2008 11:31:35 +1000
Message-ID: <20080723113135.5e22bf4d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Jul_2008_11_31_35_+1000_2SQtQ221rxQt8WVJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56401 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751431AbYGWBbq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 21:31:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Howells <dhowells@redhat.com>

--Signature=_Wed__23_Jul_2008_11_31_35_+1000_2SQtQ221rxQt8WVJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got conflicts in 58
files due to the partial merge into Linus' tree of the driver-core tree.
The conflicts were all caused by the renamed of device_create_drvdata()
to device_create() so I took the driver-core versions of almost all those
files.  The exceptions were drivers/char/tty_io.c,
drivers/char/istallion.c, drivers/char/stallion.c and
drivers/isdn/capi/capi.c which required a manual merge (I applied the
rename by hand on top of the upstream version of the file in each case).
Someone might like to check that I have it all right when I publish the
tree.

Hopefully this will be fixed up soon.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Jul_2008_11_31_35_+1000_2SQtQ221rxQt8WVJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiGifcACgkQjjKRsyhoI8yw3gCeN5sFDhsWn5hSpF4AN5YM2UuO
41sAoL5SXnDESahUAzdgK85SJslpU5qQ
=yA9N
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Jul_2008_11_31_35_+1000_2SQtQ221rxQt8WVJ--
