From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of pcmcia tree
Date: Mon, 16 Jun 2008 17:51:26 +1000
Message-ID: <20080616175126.e461b22b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Jun_2008_17_51_26_+1000_iKkJ/hVD4bmEmOdS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52795 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751219AbYFPHvi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 03:51:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jonathan Corbet <corbet@lwn.net>

--Signature=_Mon__16_Jun_2008_17_51_26_+1000_iKkJ/hVD4bmEmOdS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dominik,

Today's linux-next merge of the pcmcia tree got a conflict in
drivers/char/pcmcia/cm4000_cs.c between commit
d30f1f9e1f5391a649a4e2ad442c0b76f4e44c32 ("cm40x0: cdev lock_kernel()
pushdown") from the bkl-removal tree and commit
5316046340ca74e0d327a88aa719fa0b2481a7ff ("pcmcia: switch cm4000_cs.c to
unlocked_ioctl") from the pcmcia tree.

It was just overlapping replacement of includes, so I did the obvious
fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Jun_2008_17_51_26_+1000_iKkJ/hVD4bmEmOdS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhWG34ACgkQTgG2atn1QN9g/ACgi40XddU+kKTZBr8tPi/rtIii
4wQAnRj39XckdlTkVTFW2diB0FxWEQy+
=7D+l
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Jun_2008_17_51_26_+1000_iKkJ/hVD4bmEmOdS--
