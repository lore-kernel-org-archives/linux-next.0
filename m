From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mtd tree with the pxa tree
Date: Tue, 1 Dec 2009 12:37:38 +1100
Message-ID: <20091201123738.73bd4e4f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Dec_2009_12_37_38_+1100_23sReKEjDeeyQ0Nf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39138 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751017AbZLABhg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Nov 2009 20:37:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Hunter <hunterd42@gmail.com>, Haojian Zhuang <haojian.zhuang@marvell.com>, Eric Miao <eric.y.miao@gmail.com>

--Signature=_Tue__1_Dec_2009_12_37_38_+1100_23sReKEjDeeyQ0Nf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the mtd tree got a conflict in drivers/mtd/nand=
/pxa3xx_nand.c between commit f923cfbd298a3c5d05fe20712765ed73387b4b3c ("px=
a3xx_nand: fix memory out of bound") from the pxa tree and commit 98ecc914d=
0a48dbbcbb5fc866ab5b59a52afbd41 ("mtd: pxa3xx_nand: Fix PIO data transfer")=
 from the mtd tree.

They seem to be doing the same thing but differently.  I just kept the
version from the pxa tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Dec_2009_12_37_38_+1100_23sReKEjDeeyQ0Nf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksUc2IACgkQjjKRsyhoI8zj1wCguULvM4mpuSanQMTWW/wjP5oI
LhkAn3EqEQIfI77E0ZyhM5IDwPwrbdc6
=kC+4
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Dec_2009_12_37_38_+1100_23sReKEjDeeyQ0Nf--
