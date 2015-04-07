From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Tue, 7 Apr 2015 14:00:35 +1000
Message-ID: <20150407140035.60d2053d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kdiwsePN5A9Mk0BNxVwHnad"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49557 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750731AbbDGEAq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2015 00:00:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sheng Yong <shengyong1@huawei.com>, Christoph Hellwig <hch@lst.de>, Theodore Ts'o <tytso@mit.edu>

--Sig_/kdiwsePN5A9Mk0BNxVwHnad
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in fs/ext4/inode.c =
between commit 72b8e0f9fa8a ("ext4: remove unused header files") from the e=
xt4 tree and commit e2e40f2c1ed4 ("fs: move struct kiocb to fs.h") from the=
 vfs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ext4/inode.c
index 7eb70b7a5c19,42c942a950e1..000000000000
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@@ -35,12 -36,10 +35,11 @@@
  #include <linux/kernel.h>
  #include <linux/printk.h>
  #include <linux/slab.h>
- #include <linux/aio.h>
 -#include <linux/ratelimit.h>
  #include <linux/bitops.h>
 +#include <linux/prefetch.h>
 =20
  #include "ext4_jbd2.h"
 +#include "ext4_crypto.h"
  #include "xattr.h"
  #include "acl.h"
  #include "truncate.h"
@@@ -3136,14 -3033,11 +3135,14 @@@ static ssize_t ext4_ext_direct_IO(struc
  		get_block_func =3D ext4_get_block_write;
  		dio_flags =3D DIO_LOCKING;
  	}
 +#ifdef CONFIG_EXT4_FS_ENCRYPTION
 +	BUG_ON(ext4_encrypted_inode(inode) && S_ISREG(inode->i_mode));
 +#endif
  	if (IS_DAX(inode))
- 		ret =3D dax_do_io(rw, iocb, inode, iter, offset, get_block_func,
+ 		ret =3D dax_do_io(iocb, inode, iter, offset, get_block_func,
  				ext4_end_io_dio, dio_flags);
  	else
- 		ret =3D __blockdev_direct_IO(rw, iocb, inode,
+ 		ret =3D __blockdev_direct_IO(iocb, inode,
  					   inode->i_sb->s_bdev, iter, offset,
  					   get_block_func,
  					   ext4_end_io_dio, NULL, dio_flags);

--Sig_/kdiwsePN5A9Mk0BNxVwHnad
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI1ZsAAoJEMDTa8Ir7ZwV+98QAI/laV9FOlc05kIA0dNN3kcN
wLd4SprOfjlJoV5PaMlubDXGpwCG54vXwtjPb9F8zkDQSmPUqO2OBKpFPg4888Er
x7F608YXIcF7so7gprGqwPsJvbhv5oPu2TMyLrl0HMCpbnQDyKbOV+aZXhKZ2zDp
TK6Ab8XS6VzlShnQ4Hzgp3iTqQ2w0Zrr6ofzsdHNwBrz624sv+Aq/0pdJA5XYI/8
1Ec3+td1sOEOr88zcwhszrKQbFFPJicXO7kfR5N8grGaQqWO95ELjVAcz0zj+dL4
cJqfiRu6W01Vh94oVy4bddqKm6XVsItxZbRrFXWNdtVN+vqy2rysyEv8H7Z/hwWD
WXR+iVlQInLg+UNYl6O6kbNitNBFyMd+KDez9g/EL6fV+AfvFd2tNH9bFCDGRmYl
p55EMVTyXjOTer4cO8pgdZfIU5xUGxzLLCRb0A28HeMQh/awjnO1Xs0aQVFPSoMX
RzA9Pbeoo09sEb8iKv+vgrHmlTMr3K8QlhAJJDmGiZxYE2a7pkjVm09V+MU8Vn/c
znOC7qy5Mdq6NtGZX+yHbWSEXa/n1ecWEzNwkBV9huxQ/suos0foGXdK4ZsvRlmu
GcPrmW0F+s24rQ+2vJgbXVMR0i/uqXdDYrvkmcTGxPgn1aLNtN7gVwAJzOcmNjOy
raDlBxsYr9Qd/B2B68ws
=LKWd
-----END PGP SIGNATURE-----

--Sig_/kdiwsePN5A9Mk0BNxVwHnad--
