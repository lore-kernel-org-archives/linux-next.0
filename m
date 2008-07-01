From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 22:43:00 +1000
Message-ID: <20080701224300.cf259ebd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_22_43_00_+1000_b+C72lFWr2JN7I0z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41007 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752910AbYGAMnF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 08:43:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

--Signature=_Tue__1_Jul_2008_22_43_00_+1000_b+C72lFWr2JN7I0z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/keyspan_pda.c between commit
c81a074df394cba95767e7a8c2bf50c0ba1efd0e ("keyspan_pda: use
request_firmware()") from the firmware tree and commit
657f03fb0d6fa2ceb2c7d5417e7fd8a66df6e028 ("52-tty-tidy-usb-keyspan-pda")
from the ttydev tree.

Same as for keyspan.c.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_22_43_00_+1000_b+C72lFWr2JN7I0z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqJlQACgkQjjKRsyhoI8w/qACfT7/u8VmygLPvNn+aFqf72VIy
WN0AnjfKpKLg1Jo+gCp8j1FzxD6qMpRi
=Rkk9
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_22_43_00_+1000_b+C72lFWr2JN7I0z--
