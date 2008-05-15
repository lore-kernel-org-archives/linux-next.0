From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb.current merge conflict
Date: Thu, 15 May 2008 11:12:44 +1000
Message-ID: <20080515111244.25b945ea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__15_May_2008_11_12_44_+1000_B2B67Z9l83+/uFA3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34238 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752247AbYEOBM6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 May 2008 21:12:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__15_May_2008_11_12_44_+1000_B2B67Z9l83+/uFA3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb.current tree got a trivial conflict
in drivers/usb/gadget/serial.c.  It looks like someone fixed up the
spacing around some ','s before the "USB: serial gadget: cleanup/reorg"
patch went into Linus' tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_May_2008_11_12_44_+1000_B2B67Z9l83+/uFA3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIK44YTgG2atn1QN8RAq4kAJ4w+AiYl8bHU2RXL9inH7cnnF8r6QCgimVo
cF6iRt/B6+JrGYFP1Ps4XG8=
=NDUA
-----END PGP SIGNATURE-----

--Signature=_Thu__15_May_2008_11_12_44_+1000_B2B67Z9l83+/uFA3--
