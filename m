From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the iommu tree
Date: Tue, 6 Jan 2009 16:57:30 +1100
Message-ID: <20090106165730.6c8c80f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__6_Jan_2009_16_57_30_+1100_LXv=DoEwlYFB+FN_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52312 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751013AbZAFF5p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 00:57:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Jesper Juhl <jj@chaosbits.net>, Becky Bruce <beckyb@kernel.crashing.org>, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>

--Signature=_Tue__6_Jan_2009_16_57_30_+1100_LXv=DoEwlYFB+FN_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

Today's linux-next merge of the iommu tree got a conflict in
lib/swiotlb.c between commit 52942b6b16c6ebb25f4dd4df0208d840ba0cbc5c
("swiotlb: Don't include linux/swiotlb.h twice in lib/swiotlb.c") from
the tip-core tree and commit fb05a37929e0cd99016b4f5e5a5ef077fb10a947
("swiotlb: add support for systems with highmem") from the iommu tree.

Just trivial overlapping add/removal of header includes.  I fixed it up
and can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__6_Jan_2009_16_57_30_+1100_LXv=DoEwlYFB+FN_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkli8soACgkQjjKRsyhoI8xVkACaA4Wb/Qr55f6jLs4LIU0YYjy0
APQAoKs5L7U1zYB7BI7xPs8HCTO/AmDU
=o49i
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Jan_2009_16_57_30_+1100_LXv=DoEwlYFB+FN_--
