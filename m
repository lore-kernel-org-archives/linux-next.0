From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-removal tree
Date: Mon, 16 Jun 2008 16:50:51 +1000
Message-ID: <20080616165051.7dcada58.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Jun_2008_16_50_51_+1000_spS.hifUXXLdq26z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53080 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751219AbYFPGu5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 02:50:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rjw@sisk.pl>

--Signature=_Mon__16_Jun_2008_16_50_51_+1000_spS.hifUXXLdq26z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Today's linux-next merge of the bkl-removal tree got conflicts in
kernel/power/user.c between commit
56ca8b0af290931c647e23876b75f9fd78cbaa82 ("snapshot: Use pm_mutex for
mutual exclusion") from the acpi tree and commit
478dfeabc7e4499fa1c5b009537433f75ef939d8 ("power-user: BKL pushdown")
from the blk-removal tree.

I used the version from the acpi tree.  So it looks like the latter is no
longer needed.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Jun_2008_16_50_51_+1000_spS.hifUXXLdq26z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhWDUsACgkQTgG2atn1QN+nYwCfal0q9LvYHkkkNCrT6A1g7N+k
GgMAnjZLlkEYpkBTnRQhTvKfV46YQ/Sf
=ODBI
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Jun_2008_16_50_51_+1000_spS.hifUXXLdq26z--
