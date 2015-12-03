From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the  tree
Date: Thu, 3 Dec 2015 00:23:07 +0000
Message-ID: <20151203002307.d8c111a934be800886ebf5b7@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__3_Dec_2015_00_23_07_+0000_BZ5VYnj4KxjSf2n_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58333 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755873AbbLCAXN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 19:23:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__3_Dec_2015_00_23_07_+0000_BZ5VYnj4KxjSf2n_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
arch/x86/mm/pgtable.c between commit d6ccc3ec95251d8d327 ("x86/paravirt:
Remove paravirt ops pmd_update[_defer] and pte_update_defer") from the tip =
tree
and commit cc5bc0810343b ("x86, thp: remove infrastructure for handling
splitting PMDs") from the akpm-current tree.

I fixed it up by removing pmdp_splitting_flush and can carry the fix as=20
necessary (no action is required). No diff seems to have been generated whi=
ch
is confusing me a bit.

--Signature=_Thu__3_Dec_2015_00_23_07_+0000_BZ5VYnj4KxjSf2n_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWX4trAAoJECTWi3JdVIfQQugH+wZjP/HGSOuwhy74c+2sdGVk
Z8cM1ztuLrxe2PjY2AY4fplxP/HcU2MyP9gGNI1Uga/bvqqzL8EitDKK3dMHUIIi
SwHpkQrX89cMB00hUGdTS1yhW+w85XMLI4BQzErr4Giecri2//OGu4UvScTP5I0T
wCcvw+O2fJpPwMeS30MgHOn+7kgnSH0dj43o8/GIiUTSKUgaR708ukZpce5rjzxz
Wwj+ejECN7Ln2YvBc44oCmg69q8MK2KLNQckI//UsAMLOSw2BjS1TcbuDJWlF3ie
4w2J5imq2gZGvbdLjscDvKMqH5o5XfI7BcwcDleS0IB2OWN00qTDpaig4mSs5Og=
=VkmY
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Dec_2015_00_23_07_+0000_BZ5VYnj4KxjSf2n_--
