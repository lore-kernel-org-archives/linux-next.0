From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Thu, 25 Jun 2015 18:00:03 +1000
Message-ID: <20150625180003.0ce72be8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GfdEYCAbo0tS0d5ldMcWzrP"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57623 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751652AbbFYIAL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Jun 2015 04:00:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>

--Sig_/GfdEYCAbo0tS0d5ldMcWzrP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/nsfs.c: In function 'nsfs_show_path':
fs/nsfs.c:145:2: error: void value not ignored as it ought to be
  return seq_printf(seq, "%s:[%lu]", ns_ops->name, inode->i_ino);
  ^
fs/nsfs.c:146:1: warning: control reaches end of non-void function [-Wretur=
n-type]
 }
 ^

Caused by patch

  "fs/seq_file: convert int seq_vprint/seq_printf/etc... returns to void"

interacting with commit

  ed2ffc74eee8 ("nsfs: Add a show_path method to fix mountinfo")

from the userns tree.

I added this patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 25 Jun 2015 17:41:14 +1000
Subject: [PATCH] nsfs: fix for seq_printf() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/nsfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/nsfs.c b/fs/nsfs.c
index e4905fbf3396..8f20d6016e20 100644
--- a/fs/nsfs.c
+++ b/fs/nsfs.c
@@ -142,7 +142,8 @@ static int nsfs_show_path(struct seq_file *seq, struct =
dentry *dentry)
 	struct inode *inode =3D d_inode(dentry);
 	const struct proc_ns_operations *ns_ops =3D dentry->d_fsdata;
=20
-	return seq_printf(seq, "%s:[%lu]", ns_ops->name, inode->i_ino);
+	seq_printf(seq, "%s:[%lu]", ns_ops->name, inode->i_ino);
+	return 0;
 }
=20
 static const struct super_operations nsfs_ops =3D {
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Sig_/GfdEYCAbo0tS0d5ldMcWzrP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVi7UJAAoJEMDTa8Ir7ZwVOBcP/3mIg5371n/s3NjoVjLZXOi+
sy0170W6fpCs0FLy0cCyEJ4GDSUYuMC2Uyyvx4mEmv9lzJll74wFCtjmAzUJiwrG
sT5pdu6bq7PjBmRpfxtA1DbXlfqAhVqp51Lehl8UiN3DLgGfwjpxA8h2a8Cnj95x
YKzwL7fzFByZkZPrT/0i9snHjScG12lbweSn5wTjh8xgQHPVXFmiSXQOvsIWUDBu
gIkWhSFLla7diGlM7Ep+z5qr5zZqPWPPFpykGCPDpGYvbjdQagk4abFXS+ej6lqa
yJ1G5iBRjYWFMgli5mh3XVkr2ZJFSBoIM6Bmp5vAww/szFZVm34pJCMo3Gn/2eJj
qOY/qYQsvtSOq7njl8PN7txH+ZE0nGUmkosi59UVXODzWp6AjFeWvGf9RIYatjXN
6Hp/W6ElnZjA52h2eG6p1nEhu+QucHYBYSmAr29ZgUmGkEb4Vzz8tvioPL6OWDd7
RlXTtPIioJMAKvMX0ZJv0iGfR9rb+qHIU9MnCPQHjAIbBdVMfevEWM/2kK5WfDa6
WP+L7tI5DRFr5R6xJgT/Raa7fuGn2ZYzl/DSeXffulQIa7DhCpMuadCaXXGlgblR
utOi/HgoqJLNo92DKsDJdnWnag1+3ZpBA1gCk0ybWQhPQFW6yoaAJQItrtpbhPsX
vZWepPnhomFiKUlayl/1
=iinG
-----END PGP SIGNATURE-----

--Sig_/GfdEYCAbo0tS0d5ldMcWzrP--
