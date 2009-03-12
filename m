From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the ttydev tree with the
 usb.current tree
Date: Thu, 12 Mar 2009 22:02:34 +1100
Message-ID: <20090312220234.e709c243.sfr@canb.auug.org.au>
References: <20090312150455.e5ab0a56.sfr@canb.auug.org.au>
	<20090312094434.4caaa695@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Mar_2009_22_02_34_+1100_pBs9NU95R6EVFcjy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59337 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752710AbZCLLCn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 07:02:43 -0400
In-Reply-To: <20090312094434.4caaa695@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Axel Wachtler <axel.wachtler@atmel.com>, Michael Hennerich <michael.hennerich@analog.com>

--Signature=_Thu__12_Mar_2009_22_02_34_+1100_pBs9NU95R6EVFcjy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

On Thu, 12 Mar 2009 09:44:34 +0000 Alan Cox <alan@lxorguk.ukuu.org.uk> wrot=
e:
>
> > Today's linux-next merge of the ttydev tree got conflicts in
> > drivers/usb/serial/ftdi_sio.c and drivers/usb/serial/ftdi_sio.h.  It
> > looks like the same two patches have been applied to the ttydev
> > (tty-ftdi-gnice, tty-ftdi-dresdenelec) and the usb.current (USB: serial:
>=20
> These are USB identifier updates to a USB driver that's also a tty
> driver. I'll drop them in favour of GregKH's tree carring them.

OK, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Mar_2009_22_02_34_+1100_pBs9NU95R6EVFcjy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm468oACgkQjjKRsyhoI8wJWwCfeuKVgrvFRCbkfqQHGbFQ+9LN
TW8An2JZOkERNq8GreOOSONLfiQGEEdd
=h063
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Mar_2009_22_02_34_+1100_pBs9NU95R6EVFcjy--
