From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the input-current tree
Date: Wed, 18 Jun 2008 10:40:37 +1000
Message-ID: <20080618104037.d1aa6f1a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__18_Jun_2008_10_40_37_+1000_fLa6r8wL3AR9hGD="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44060 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756189AbYFRAkr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 20:40:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, Oliver Neukum <oliver@neukum.org>

--Signature=_Wed__18_Jun_2008_10_40_37_+1000_fLa6r8wL3AR9hGD=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Today's linux-next merge of the input-current tree got a trivial conflict
in drivers/usb/core/quirks.c between commit
598eff6d2f3b8805232edc5f4a6b0c1e698dc482 ("USB: add another scanner
quirk") from Linus' tree and commit
90d95ef617a535a8832bdcb8dee07bf591e5dd82 ("Input: appletouch - implement
reset-resume logic") from the input-current tree.

It was just a matter of overlapping additions, so I took them both.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__18_Jun_2008_10_40_37_+1000_fLa6r8wL3AR9hGD=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhYWYUACgkQTgG2atn1QN8efwCfTsh+181+pbiBG+M3TWHWcFMr
8c8An2LXa+dDxdERO5pOYwk7qdpWrE1F
=CjGN
-----END PGP SIGNATURE-----

--Signature=_Wed__18_Jun_2008_10_40_37_+1000_fLa6r8wL3AR9hGD=--
