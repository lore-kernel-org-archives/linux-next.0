From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the usb tree
Date: Mon, 17 May 2010 16:16:03 +1000
Message-ID: <20100517161603.f83a98d8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__17_May_2010_16_16_03_+1000_Y6itJAAk=1RqcfPn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40942 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753276Ab0EQGQK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 May 2010 02:16:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Youn <John.Youn@synopsys.com>, Sarah Sharp <sarah.a.sharp@linux.intel.com>

--Signature=_Mon__17_May_2010_16_16_03_+1000_Y6itJAAk=1RqcfPn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the usb tree, today's linux-next build (powerpc allyesconfig)
produced this warning:

drivers/usb/host/xhci-ring.c: In function 'prepare_ring':
drivers/usb/host/xhci-ring.c:1729: warning: unused variable 'addr'

Introduced by commit a2fbb0e4784f6d1b3be0779918e84dd3c0c73f04 ("USB:
xhci: Transfer ring link TRB activation change").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__17_May_2010_16_16_03_+1000_Y6itJAAk=1RqcfPn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvw3yMACgkQjjKRsyhoI8xi6gCfTIUfYbAey+GPJKKS1lIc41ul
quwAn33uNOXFLGbGph5yxIitHLu4T0Et
=Fuc/
-----END PGP SIGNATURE-----

--Signature=_Mon__17_May_2010_16_16_03_+1000_Y6itJAAk=1RqcfPn--
