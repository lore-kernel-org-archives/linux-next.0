From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree with Linus' tree
Date: Mon, 9 Feb 2009 11:38:55 +1100
Message-ID: <20090209113855.180c03cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__9_Feb_2009_11_38_55_+1100_dcTyUuT1KRzD_Zkl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34870 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752772AbZBIAjD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Feb 2009 19:39:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Chris Mason <chris.mason@oracle.com>

--Signature=_Mon__9_Feb_2009_11_38_55_+1100_dcTyUuT1KRzD_Zkl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip-core tree got a conflict in
fs/btrfs/locking.c between commit
b4ce94de9b4d64e8ab3cf155d13653c666e22b9b ("Btrfs: Change btree locking to
use explicit blocking points") from Linus' tree and commit
cf47b8f3d96b0b8b10b557444a28b3ca4024ff82 ("Btrfs: stop spinning on
mutex_trylock and let the adaptive code spin for us") from the tip-core
tree.

Resolved as in tip/master by taking the version from Linus' tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__9_Feb_2009_11_38_55_+1100_dcTyUuT1KRzD_Zkl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmPex8ACgkQjjKRsyhoI8z6dwCfRQKLAkZccVV1OaQ6TRQ+8AlL
ASkAmQGYGxEoIC0gasx86UZcrHoUXNkK
=LTqC
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Feb_2009_11_38_55_+1100_dcTyUuT1KRzD_Zkl--
