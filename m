From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Fri, 18 Jul 2008 18:41:17 +1000
Message-ID: <20080718184117.dc8af642.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_18_41_17_+1000_nEKt6YSni6MK1RXC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48834 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750975AbYGRIlY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 04:41:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Felipe Balbi <me@felipebalbi.com>, Greg KH <greg@kroah.com>

--Signature=_Fri__18_Jul_2008_18_41_17_+1000_nEKt6YSni6MK1RXC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/ir-usb.c between commit
0da89a4824f8d59efea82f84e197cc7d6f218cbf ("usb: irda: cleanup on ir-usb
module") from the usb tree and commit
255ba432f804717e8a2d6096aa2d92e970f61c3d ("usb-serial-api-change") from
the ttydev tree.

I used the ttydev version.  Worth a check to see if I got it right after
I publish the tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_18_41_17_+1000_nEKt6YSni6MK1RXC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAVy0ACgkQjjKRsyhoI8xVGwCgh4DU1c+iDuZFxvUrJNqTT3EI
rQ0AoIR1T00IWkOL870xoHob7UcBQyKW
=gj4V
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_18_41_17_+1000_nEKt6YSni6MK1RXC--
