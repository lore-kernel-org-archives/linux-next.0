From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kernel-doc tree
Date: Tue, 14 Oct 2008 18:11:14 +1100
Message-ID: <20081014181114.c069b145.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_18_11_14_+1100_Kdsa8Td_342dnsW4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34147 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760252AbYJNH3w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 03:29:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, Kiyoshi Ueda <k-ueda@ct.jp.nec.com>

--Signature=_Tue__14_Oct_2008_18_11_14_+1100_Kdsa8Td_342dnsW4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

Today's linux-next merge of the kernel-doc tree got a conflict in
block/blk-core.c between commit d00e29fd99dd63d1c51917604e35dee824ed567f
("block: remove end_{queued|dequeued}_request()") from Linus' tree and
commit bcbfb613cdca2d5c4c3f67ed428d7464abe7fb2f ("kerndoc-block-add")
from the kernel-doc tree.

The former removed what the latter was modifying, so I just removed the
code.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_18_11_14_+1100_Kdsa8Td_342dnsW4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0RhIACgkQjjKRsyhoI8zW3gCcCjnYndHAxXLki5RDVfUGh+sA
jcIAoIXHsXtBYz8ypNePtdZla7TGGlZZ
=iPUB
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_18_11_14_+1100_Kdsa8Td_342dnsW4--
