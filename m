From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the usb tree
Date: Tue, 18 May 2010 17:42:53 +1000
Message-ID: <20100518174253.37e38d66.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__18_May_2010_17_42_53_+1000_QB+2=DaVusPG5Hx6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35507 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755740Ab0ERHm7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 May 2010 03:42:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

--Signature=_Tue__18_May_2010_17_42_53_+1000_QB+2=DaVusPG5Hx6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the usb tree, today's linux-next build (powerpc
ppc6xx_defconfig) failed like this:

drivers/usb/host/ehci-fsl.c:316: error: 'ehci' undeclared (first use in thi=
s function)

Caused by commit d19f8cd047971b43844d61d995be736dacb4826a ("USB: EHCI:
fix controller wakeup flag settings during suspend").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__18_May_2010_17_42_53_+1000_QB+2=DaVusPG5Hx6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvyRP0ACgkQjjKRsyhoI8yqmQCfSax5/btQjxdCJoNeEjb/dkNp
FBAAmwdnoY4eUng/E2+I5SG7UHk/rGDc
=1Yrr
-----END PGP SIGNATURE-----

--Signature=_Tue__18_May_2010_17_42_53_+1000_QB+2=DaVusPG5Hx6--
