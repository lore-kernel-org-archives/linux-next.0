From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless merge conflict
Date: Thu, 29 May 2008 15:19:18 +1000
Message-ID: <20080529151918.d2054d45.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__29_May_2008_15_19_18_+1000_8fFMiY8osNlVxEN_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52802 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751293AbYE2FT1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 May 2008 01:19:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Ivo van Doorn <IvDoorn@gmail.com>

--Signature=_Thu__29_May_2008_15_19_18_+1000_8fFMiY8osNlVxEN_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next merge of the wireless tree got a conflict in
drivers/net/wireless/rt2x00/rt2x00dev.c between commit
2088d4174e4292aef892bb7095fc3c3ea5bd117c ("rt2x00: Don't count retries as
failure") from the wireless-current tree and commit
fb55f4d1fa252ba1e479284b79da1049d658c371 ("rt2x00: Fix TX status
reporting") from the wireless tree.

I fixed it up as you did in your merge-test-2 branch.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__29_May_2008_15_19_18_+1000_8fFMiY8osNlVxEN_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIPjzaTgG2atn1QN8RAgdhAJ4s3TNvu5gP7TQ4xMMD3eYiu8y0+wCfZNJE
+SsqbXlxEPecN4R6AVt5dMk=
=3+jx
-----END PGP SIGNATURE-----

--Signature=_Thu__29_May_2008_15_19_18_+1000_8fFMiY8osNlVxEN_--
