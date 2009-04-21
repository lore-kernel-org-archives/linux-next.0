From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the  tree
Date: Tue, 21 Apr 2009 11:06:12 +1000
Message-ID: <20090421110612.9cf9b6a6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__21_Apr_2009_11_06_12_+1000_aiIIQjnnj8WvZF4N"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45826 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752690AbZDUBGT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Apr 2009 21:06:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Ben Hutchings <bhutchings@solarflare.com>, Herbert Xu <herbert@gondor.apana.org.au>

--Signature=_Tue__21_Apr_2009_11_06_12_+1000_aiIIQjnnj8WvZF4N
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the net tree got a conflict in net/core/dev.c
between commit 5db8765a86a4cbaf45adaf8c231cf9a6ca2dcfaf ("net: Fix GRO
for multiple page fragments") from the net-current tree and commit
76620aafd66f0004829764940c5466144969cffc ("gro: New frags interface to
avoid copying shinfo") from the net tree.

I used the version from the net tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__21_Apr_2009_11_06_12_+1000_aiIIQjnnj8WvZF4N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkntHAQACgkQjjKRsyhoI8xDTwCfTzY59TiRM5VuEYPYzlnvwU9R
Eh4An1U3CioudeLdNlDEmYer8UDdz+jf
=XGjp
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Apr_2009_11_06_12_+1000_aiIIQjnnj8WvZF4N--
