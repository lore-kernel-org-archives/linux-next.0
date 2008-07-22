From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 22 Jul 2008 16:37:54 +1000
Message-ID: <20080722163754.715cf9cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__22_Jul_2008_16_37_54_+1000_t7G3cQAQLFCwHshz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33785 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750718AbYGVGiE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 02:38:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__22_Jul_2008_16_37_54_+1000_t7G3cQAQLFCwHshz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got conflicts in
drivers/char/istallion.c, drivers/char/mxser.c, drivers/char/specialix.c,
drivers/char/synclink_gt.c, drivers/char/tty_io.c,
drivers/usb/gadget/serial.c, drivers/usb/serial/cp2101.c,
drivers/usb/serial/io_ti.c, drivers/usb/serial/ir-usb.c,
drivers/usb/serial/usb-serial.c, include/linux/tty.h and
net/bluetooth/rfcomm/tty.c mainly against Linus' tree.

This is not unexpected since some of the ttydev tree has been merged, so I
will drop it for today in the hope that things are better tomorrow.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__22_Jul_2008_16_37_54_+1000_t7G3cQAQLFCwHshz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiFgEIACgkQjjKRsyhoI8w43gCfapktegaJ6Z5SgctSL8sflRYJ
zOAAnRW+JElQWZ/OrHOGSA+Nitw4nCBl
=Xzdu
-----END PGP SIGNATURE-----

--Signature=_Tue__22_Jul_2008_16_37_54_+1000_t7G3cQAQLFCwHshz--
