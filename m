From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree
Date: Fri, 11 Jul 2008 16:02:45 +1000
Message-ID: <20080711160245.3ea0c85e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__11_Jul_2008_16_02_45_+1000_1RIh8=IiqHJPSQ5o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55750 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751596AbYGKGCx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jul 2008 02:02:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Greg KH <greg@kroah.com>, Jaswinder Singh <jaswinder@infradead.org>

--Signature=_Fri__11_Jul_2008_16_02_45_+1000_1RIh8=IiqHJPSQ5o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the firmware tree got conflicts in
drivers/usb/serial/io_ti.c and drivers/usb/serial/io_fw_down3.h between
commit 933485161580b837dd84d46fb1fca7ea775f30c1 ("USB: io_ti: FIrst cut
at a big clean up") from the usb tree and commit
19aeeb5b95d53d0865ae811fc4dcc66639d661cf ("edgeport-ti: use
request_firmware()") from the firmware tree.

I just reverted the firmware tree commit for now as the fixup is quite
extensive.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__11_Jul_2008_16_02_45_+1000_1RIh8=IiqHJPSQ5o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh294UACgkQjjKRsyhoI8zPYQCeJYpDzL7q5rYK8wq8NkBdJ4f8
NKYAn3fQ7ahiTFmP8EPxM4EvsOjIrqOI
=Udb3
-----END PGP SIGNATURE-----

--Signature=_Fri__11_Jul_2008_16_02_45_+1000_1RIh8=IiqHJPSQ5o--
