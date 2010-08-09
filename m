From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Mon, 9 Aug 2010 11:28:31 +1000
Message-ID: <20100809112831.0dc41e76.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__9_Aug_2010_11_28_31_+1000_q7UUZdYMaK=Qjt5K"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46393 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755132Ab0HIB2k (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Aug 2010 21:28:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Stodden <daniel.stodden@citrix.com>, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>

--Signature=_Mon__9_Aug_2010_11_28_31_+1000_q7UUZdYMaK=Qjt5K
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/block/xen-blkfront.c: In function 'blkif_release':
drivers/block/xen-blkfront.c:1238: error: label 'out' used but not defined

Caused by commit acfca3c622a009fb62b566604452ab9fb3a11019 ("blkfront:
Remove obsolete info->users").  I assume something went wrong in the
rebase ...

I have used the block tree from next-20100807 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__9_Aug_2010_11_28_31_+1000_q7UUZdYMaK=Qjt5K
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMX1m/AAoJEDMEi1NhKgbsHO0H/07xb0+oQO2PabLb4KyLV5Lr
hIn/mH5OK++Vber//bhcuX/j/DkGn/8Y80qXmir2w1OnfjTAJvxPLKUwx3gb2rMk
jE6e2hL69J6zDAMD6DEpdeU+mj/Fon/YmXykhg9Gd9jzyJd5M9M/Q3SYuX/41+VO
RJj/cNFMHCDqfhU2EmO4cTbPbiVwSZja6zABMppKJsBthA2CsgEAQRKYlpfmKFKa
2yoIRfdPCCsxqyyxj9teJmnTUIdzHjFZzqyXijj/GosU30OeJUCKtz8BU+gQaLrF
DcYgIninAYKcZYhQGkxNt44ZU94u1cn+5o2OOZIL4VQREZ2y1Dll4h6dtFrND7Y=
=Rgwh
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Aug_2010_11_28_31_+1000_q7UUZdYMaK=Qjt5K--
