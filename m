From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree with the usb.current
 tree
Date: Thu, 12 Mar 2009 15:04:55 +1100
Message-ID: <20090312150455.e5ab0a56.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Mar_2009_15_04_55_+1100_ek2Zpm=EkfL3dicq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54308 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750949AbZCLEFI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 00:05:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Axel Wachtler <axel.wachtler@atmel.com>, Michael Hennerich <michael.hennerich@analog.com>

--Signature=_Thu__12_Mar_2009_15_04_55_+1100_ek2Zpm=EkfL3dicq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan, Greg,

Today's linux-next merge of the ttydev tree got conflicts in
drivers/usb/serial/ftdi_sio.c and drivers/usb/serial/ftdi_sio.h.  It
looks like the same two patches have been applied to the ttydev
(tty-ftdi-gnice, tty-ftdi-dresdenelec) and the usb.current (USB: serial:
add FTDI USB/Serial converter devices, USB: serial: ftdi: enable UART
detection on gnICE JTAG adaptors blacklist interface0) trees but in a
different order.

I fixed it up (by using the usb.current tree's versions).  I suspect one
of you will get these patches into Linus's tree and hopefully the other
will drop them.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Mar_2009_15_04_55_+1100_ek2Zpm=EkfL3dicq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm4iecACgkQjjKRsyhoI8w3bgCeNpw/rxVefogsCsGFhTKP5Gxh
biEAoIZakPEUlWxWbGSeRE2H4Em+6WDL
=Li/E
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Mar_2009_15_04_55_+1100_ek2Zpm=EkfL3dicq--
