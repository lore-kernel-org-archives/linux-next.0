From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net-current/net merge conflict
Date: Mon, 26 May 2008 13:32:34 +1000
Message-ID: <20080526133234.d6ae478e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__26_May_2008_13_32_34_+1000_eEMEo152munqZ_Xl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39262 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751668AbYEZDc6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 25 May 2008 23:32:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Jeff Garzik <jgarzik@redhat.com>

--Signature=_Mon__26_May_2008_13_32_34_+1000_eEMEo152munqZ_Xl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Jeff,

Today's linux-next merge of the net tree got a trivial conflict in
drivers/net/cpmac.c between commit
f917d58031fce6dfd7cea71259ea6a2b663ec813 ("cpmac bugfixes and
enhancements") from the net-current tree and commit
7d2e3cb7000b883a8e489485ac249be572fe17b1 ("[netdrvr] Trim trailing
whitespace for several drivers") from the net tree. The former removed a
comment that the latter made a whitespace fix to.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__26_May_2008_13_32_34_+1000_eEMEo152munqZ_Xl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIOi9bTgG2atn1QN8RAj9dAJ46qphZNVK74lfYOIgD0EYOYkrVtgCbBFXC
Iv5KN8q6MX3dA/EFO816nAI=
=V7pG
-----END PGP SIGNATURE-----

--Signature=_Mon__26_May_2008_13_32_34_+1000_eEMEo152munqZ_Xl--
