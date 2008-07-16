From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sparc tree
Date: Wed, 16 Jul 2008 17:39:13 +1000
Message-ID: <20080716173913.3b4050ff.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_17_39_13_+1000_XkiRDGNe2VXyxNqU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48292 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752948AbYGPHjT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 03:39:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Wed__16_Jul_2008_17_39_13_+1000_XkiRDGNe2VXyxNqU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the sparc tree got conflicts in
include/asm-sparc64/mmu.h, include/asm-sparc64/page.h and
include/asm-sparc64/pgtable.h between commit
5cd012990ab37dbef7d84cc74feb70ef5f792a12 ("sparc64: Remove 4MB and 512K
base page size options") from the sparc-current tree and commit
0d4b5053275562b4ff7a9a98942936c9eb9b5c18 ("sparc: join the remaining
header files") from the sparc tree.

I applied the appropriate parts of the sparc-current commit to
include/asm-sparc/{mmu,page,pgtable}_64.h.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_17_39_13_+1000_XkiRDGNe2VXyxNqU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9paEACgkQjjKRsyhoI8y86ACfTHkkmGIQRw3UOt0VkFas2NFF
aYUAn0DLehcr7Udw2UebnbpVsI3NVduo
=Dzbl
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_17_39_13_+1000_XkiRDGNe2VXyxNqU--
