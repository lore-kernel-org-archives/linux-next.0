From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the block tree
Date: Thu, 16 Sep 2010 13:30:05 +1000
Message-ID: <20100916133005.56baad7e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__16_Sep_2010_13_30_05_+1000_sBzu4CN3R9s/K__Z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34343 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751748Ab0IPDaN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Sep 2010 23:30:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Namhyung Kim <namhyung@gmail.com>

--Signature=_Thu__16_Sep_2010_13_30_05_+1000_sBzu4CN3R9s/K__Z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/scsi/sg.c: In function 'sg_start_req':
drivers/scsi/sg.c:1660: warning: passing argument 2 of 'blk_rq_aligned' mak=
es integer from pointer without a cast
include/linux/blkdev.h:1045: note: expected 'long unsigned int' but argumen=
t is of type 'void *'

Introduced by commit 144177991ca624841ddbd1e7edff958fc0f6d1fe ("block:
fix an address space warning in blk-map.c").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__16_Sep_2010_13_30_05_+1000_sBzu4CN3R9s/K__Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMkY89AAoJEDMEi1NhKgbsQpgIAI+WlfLXjOhAy5KXkIoTeyI7
/cZTYRyqHHwgg0+UO3tcnKnNoNYQR8Lz1rPwV9uLgPEcJIDpnMaAixzT8iUYEJ2i
wYeU4ewsjLIN+xwDVH3XKJkIO6z54b/ZeRHZJnAc1PGFfKyqq4rh0ooxNJbCDxUf
GAm+2oV4PtdcrmHOrUy74pRK2eSD8fD1OnApFFUT8XynaIDnVUwh5zcT9L1A9ZPq
df0+exfh2ttBOhNQrXIRSHbD7R8rv2gI5ZUfhPRHMAtfF81rd7FO51lLB9XbWXEo
+3fQXKOEb8IvOrQ2rcyTB00iPcwhaB9sIkT7P/JQ81CG15zXy1ah2caGuS3ecwo=
=DfEM
-----END PGP SIGNATURE-----

--Signature=_Thu__16_Sep_2010_13_30_05_+1000_sBzu4CN3R9s/K__Z--
