From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pxa tree
Date: Fri, 19 Sep 2008 04:46:26 +1000
Message-ID: <20080919044626.bdec6d1a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__19_Sep_2008_04_46_26_+1000_lrXvdR.5TMOCx8v2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57954 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754501AbYIRSqi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Sep 2008 14:46:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Miao <eric.y.miao@gmail.com>
Cc: linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

--Signature=_Fri__19_Sep_2008_04_46_26_+1000_lrXvdR.5TMOCx8v2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next merge of the pxa tree got a lot of conflicts against
the arm tree.  Unfortunately, I don't have time today to resolve them, so
you should probably rebase your tree on the arm tree (or merge the arm
tree into yours) and resolve the conflicts.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__19_Sep_2008_04_46_26_+1000_lrXvdR.5TMOCx8v2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjSogIACgkQjjKRsyhoI8yyaQCgnMfnKfOt9xP/S7ld+d36BUCQ
0NUAoLzs0WMdanoCrRJAdHwXmtCRTn86
=+odh
-----END PGP SIGNATURE-----

--Signature=_Fri__19_Sep_2008_04_46_26_+1000_lrXvdR.5TMOCx8v2--
