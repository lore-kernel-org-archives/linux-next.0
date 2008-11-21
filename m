From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Fri, 21 Nov 2008 13:33:47 +1100
Message-ID: <20081121133347.a51c5d2e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__21_Nov_2008_13_33_47_+1100_R=HM7GTCPCzb73J7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44542 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752007AbYKUCeA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 21:34:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>

--Signature=_Fri__21_Nov_2008_13_33_47_+1100_R=HM7GTCPCzb73J7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
net/phonet/af_phonet.c between commit
566521d63720ab47576afb85147e5652993bf1e6 ("phonet: fix compilation with
gcc-3.4") from the net-current tree and commit
5c7f0333584128c745fbda845abbe3a32c22d467 ("phonet: sparse annotations of
protocol, remove forward declaration") from the net tree.

I fixed it up (by adding the extra bits from the net-current change) and
assume you will do something similar.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__21_Nov_2008_13_33_47_+1100_R=HM7GTCPCzb73J7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkmHgsACgkQjjKRsyhoI8w4ywCdHt5nUy7ZGfb7N9N9i9x+pdeV
pXcAn2AlIo6NT2+Chic6K58/nFuGueCC
=Zdr1
-----END PGP SIGNATURE-----

--Signature=_Fri__21_Nov_2008_13_33_47_+1100_R=HM7GTCPCzb73J7--
