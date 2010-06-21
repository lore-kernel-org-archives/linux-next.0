From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the i2c tree
Date: Mon, 21 Jun 2010 12:03:31 +1000
Message-ID: <20100621120331.1c6c1754.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__21_Jun_2010_12_03_31_+1000__ImrcpGHLYvXnzHj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50732 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757544Ab0FUCDj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 20 Jun 2010 22:03:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__21_Jun_2010_12_03_31_+1000__ImrcpGHLYvXnzHj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

After merging the i2c tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/i2c/i2c-core.c: In function 'i2c_detect':
drivers/i2c/i2c-core.c:1460: error: 'adap' undeclared (first use in this fu=
nction)

Caused by commit b741e61eb906816f78acbf361797fd408abdc715 ("i2c: Fix
probability check").  The typo in this patch is probably why the later
patch that I dropped would not apply ...

I have used the i2c tree form next-20100618 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__21_Jun_2010_12_03_31_+1000__ImrcpGHLYvXnzHj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkweyHMACgkQjjKRsyhoI8xUpACdEm/jubUvjRjKAByj01sCJ1dU
g58An04H4MrGtcTU/jf5Lnad8/Y7Q5e6
=RiFY
-----END PGP SIGNATURE-----

--Signature=_Mon__21_Jun_2010_12_03_31_+1000__ImrcpGHLYvXnzHj--
