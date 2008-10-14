From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree
Date: Tue, 14 Oct 2008 14:53:23 +1100
Message-ID: <20081014145323.54b0f2c9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_14_53_23_+1100_14zXiU1RPOTcw+S/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59333 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756533AbYJNEmG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 00:42:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@redhat.com>

--Signature=_Tue__14_Oct_2008_14_53_23_+1100_14zXiU1RPOTcw+S/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/usb/serial/ftdi_sio.c between commit
43b11d33f2c20c33fcf197780edb2e5d8a1b6a67 ("ftdi: A few errors are err()
that should be debug which causes much spewage") from Linus' tree and
commit 1e5778f3c11989c36ca25e60dc3ecf14af3a4c99 ("USB: remove use of err
() in drivers/usb/serial") from the usb tree.

I used the versions from Linus tree for now.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_14_53_23_+1100_14zXiU1RPOTcw+S/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0F7MACgkQjjKRsyhoI8x87wCeIrvwhbhSRn0uJB9Ou4ihKPXj
064AoKlApdftecFDzKU3qM2H+al1h0Wg
=GUW2
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_14_53_23_+1100_14zXiU1RPOTcw+S/--
