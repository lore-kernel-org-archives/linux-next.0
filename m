From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Wed, 16 Jul 2008 18:15:45 +1000
Message-ID: <20080716181545.807eeb57.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_18_15_45_+1000_3JJ=z+CO+p1i6qM7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40994 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756691AbYGPIPy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 04:15:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Max Krasnyansky <maxk@qualcomm.com>, David Miller <davem@davemloft.net>

--Signature=_Wed__16_Jul_2008_18_15_45_+1000_3JJ=z+CO+p1i6qM7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got conflicts in
drivers/net/tun.c and include/linux/if_tun.h between commits
07240fd0902c872f044f523893364a1a24c9f278 ("tun: Interface to query
tun/tap features"), 5228ddc98fa49b3cedab4024e269d62410a0d806 ("tun:
TUNSETFEATURES to set gso features") and
f271b2cc78f09c93ccd00a2056d3237134bf994c ("tun: Fix/rewrite packet
filtering logic") from the net tree and commit
10c9db38e381599da1491d7d5e71f13573d39144 ("misc:tun-gso-csum-features")
from the rr tree.

These are essentially the same changes in both trees (but with some
additions in the net tree.  I fixed it up as best I could.  It is
probably worth a look once the tree is published.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_18_15_45_+1000_3JJ=z+CO+p1i6qM7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9rjEACgkQjjKRsyhoI8zt3QCgjM4x2RaOXNL6URZRcezDroae
+BcAmgKqQXnn/SdrbAQ5cU/LhoCGZPeS
=Ylga
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_18_15_45_+1000_3JJ=z+CO+p1i6qM7--
