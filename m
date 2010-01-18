From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the mips tree
Date: Mon, 18 Jan 2010 18:53:51 +1100
Message-ID: <20100118185351.3c6b719f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__18_Jan_2010_18_53_51_+1100_RZIkvNnVavPhF_BX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42921 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932091Ab0ARHx5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jan 2010 02:53:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wu Zhangjin <wuzhangjin@gmail.com>, Ralf Baechle <ralf@linux-mips.org>

--Signature=_Mon__18_Jan_2010_18_53_51_+1100_RZIkvNnVavPhF_BX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/sm7xx/smtc2d.c drivers/staging/sm7xx/smtc2d.h between
commit 8cdfa0e5f204ee97d27f742ebd207f4de8ca2984 ("Loongson: Change the
Email address of Wu Zhangjin") from the mips tree and commit
1467bbc532da8c044e57706db232efe616ae5b00 ("staging: sm7xx: remove the
buggy 2D acceleration support") from the staging tree.

I just removed the 2 files (as was done in the staging tree).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__18_Jan_2010_18_53_51_+1100_RZIkvNnVavPhF_BX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktUE48ACgkQjjKRsyhoI8zTpwCfee+B7xviNLUnSIpON67Ofl8Y
nPIAoJLx0RFLaOQFIOa2o93qOp388bEe
=+fmK
-----END PGP SIGNATURE-----

--Signature=_Mon__18_Jan_2010_18_53_51_+1100_RZIkvNnVavPhF_BX--
