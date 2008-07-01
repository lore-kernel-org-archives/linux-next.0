From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Wed, 2 Jul 2008 00:12:34 +1000
Message-ID: <20080702001234.6463753f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__2_Jul_2008_00_12_34_+1000_KB0ZLDa8O/bYEshp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56053 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754383AbYGAOMg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 10:12:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

--Signature=_Wed__2_Jul_2008_00_12_34_+1000_KB0ZLDa8O/bYEshp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/ti_fw_3410.h and drivers/usb/serial/ti_fw_5052.h
between commit 01f845d09b8fdcdd27ee592422567b8dfa5b14d5
("ti_usb_3410_5052: use request_firmware()") from the firmware tree and
commit ce8194a09dee5b7e101467aba6b7cd5617b1cd0f
("23-usb-serial-api-change") from the ttydev tree.

The former removed the files.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Jul_2008_00_12_34_+1000_KB0ZLDa8O/bYEshp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqO1IACgkQjjKRsyhoI8yGYwCfRvgpnmwBEGMPNYWS9fEHhqVx
hBsAn1hxWmPB0tpKHAdyONDiByYr3Y+c
=4k27
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Jul_2008_00_12_34_+1000_KB0ZLDa8O/bYEshp--
