From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the final tree (akpm and
 block tree related)
Date: Tue, 26 Mar 2013 17:05:54 +1100
Message-ID: <20130326170554.f9f113fa24a1e5ec6d5d1ee6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__26_Mar_2013_17_05_54_+1100_S_jLZcvMZC2Xl0xm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:55039 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756178Ab3CZGGF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Mar 2013 02:06:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kent Overstreet <koverstreet@google.com>

--Signature=_Tue__26_Mar_2013_17_05_54_+1100_S_jLZcvMZC2Xl0xm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build
produced this warning:

fs/bio.c: In function 'submit_bio_wait':
fs/bio.c:786:17: warning: assignment from incompatible pointer type [enable=
d by default]

This is due to an interaction between commit 9e882242c ("block: Add
submit_bio_wait(), remove from md") from the block tree and commit
"block: prep work for batch completion" from the akpm tree.

In fact we are getting several more warnings due to that patch in the
akpm tree:

drivers/md/bcache/writeback.c: In function 'write_dirty':
drivers/md/bcache/writeback.c:276:20: warning: assignment from incompatible=
 pointer type [enabled by default]
drivers/md/bcache/writeback.c: In function 'read_dirty':
drivers/md/bcache/writeback.c:350:21: warning: assignment from incompatible=
 pointer type [enabled by default]
drivers/md/bcache/movinggc.c: In function 'read_moving':
drivers/md/bcache/movinggc.c:160:18: warning: assignment from incompatible =
pointer type [enabled by default]
drivers/md/bcache/request.c: In function 'bch_insert_data_loop':
drivers/md/bcache/request.c:518:16: warning: assignment from incompatible p=
ointer type [enabled by default]
drivers/md/bcache/request.c: In function 'do_bio_hook':
drivers/md/bcache/request.c:684:18: warning: assignment from incompatible p=
ointer type [enabled by default]
drivers/md/bcache/request.c: In function 'cached_dev_cache_miss':
drivers/md/bcache/request.c:926:19: warning: assignment from incompatible p=
ointer type [enabled by default]
drivers/md/bcache/request.c:957:29: warning: assignment from incompatible p=
ointer type [enabled by default]
drivers/md/bcache/debug.c: In function 'bch_data_verify':
drivers/md/bcache/debug.c:208:19: warning: assignment from incompatible poi=
nter type [enabled by default]
drivers/md/bcache/super.c: In function 'bch_write_bdev_super':
drivers/md/bcache/super.c:257:17: warning: assignment from incompatible poi=
nter type [enabled by default]
drivers/md/bcache/super.c: In function 'bcache_write_super':
drivers/md/bcache/super.c:295:18: warning: assignment from incompatible poi=
nter type [enabled by default]
drivers/md/bcache/super.c: In function 'uuid_io':
drivers/md/bcache/super.c:333:18: warning: assignment from incompatible poi=
nter type [enabled by default]
drivers/md/bcache/super.c: In function 'prio_io':
drivers/md/bcache/super.c:492:17: warning: assignment from incompatible poi=
nter type [enabled by default]

There are probably more ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__26_Mar_2013_17_05_54_+1100_S_jLZcvMZC2Xl0xm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRUTrCAAoJEECxmPOUX5FE3roP/3iARvISuEaXh47P+5zZwV2V
FmcgZM9IzEWppx3rW9HU94mW0PL21mPQC0OFs1n3MaDldxC8nFn30N0GqGuDmzDL
pqwJSkDYFDusYgJfGs1Zg8iSQbs/JIAVSE/B/S8vNOsaOpCgHFw8tdFGgCjK6+dl
W9HyvzF+9DW+wmP0xpB5qirkuGvz0v7KBqDSAnabV30PabBOsfZd2BeIf273pssS
zjsQvpvGYkpyEkSSB5+Lvni9BnlMMqY2hLs672g8jQqYXkPPUkPD9ig1t5+dc0GF
1tuNtWUx1MQf8wtAWw2s8J34d3cJCrD3OEu58T7ZLKwLz5hP6uNiXRyfHbd0d61y
+UHeO0/64Mcznp9a2CvaesaGk4dxpcdiQoA5pkrmolF8bIjzkUo3NvL7j8BLDTjj
ufh8/SC4LuwC+KRM3WXs5yM/Hqqr9Vpgd3SKJruIWqVwkgTwdT9iYkwI2hIguuwJ
CbXVV1W4mIxaF62SFc9t4iLKceD4is+nHsNOH3A4+tc+G3dgUoJgKXtrngJoE7pL
/X1H1YJAbrZOLmRBmIZD9GUzGMWzfntI5MiFvAiPH/iDmh76tRiFS/gopEfyaiXl
C87iaIkgxJk7Krxf+V6xtoxJkEAqnc8jWb1Sza+p4vATM9LyRZ/3Oy9C1QCY3gkV
P5JE5fRDIndRVmLgDEej
=rVwO
-----END PGP SIGNATURE-----

--Signature=_Tue__26_Mar_2013_17_05_54_+1100_S_jLZcvMZC2Xl0xm--
