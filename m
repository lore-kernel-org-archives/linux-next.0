From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Mon, 30 Jul 2018 16:16:22 +1000
Message-ID: <20180730161622.3837cb15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5n94owRThEz7nT8UOMe.cta"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Gao Xiang <gaoxiang25@huawei.com>, Miao Xie <miaoxie@huawei.com>, Chao Yu <yuchao0@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/5n94owRThEz7nT8UOMe.cta
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/erofs/super.c: In function 'erofs_read_super':
drivers/staging/erofs/super.c:343:17: error: 'MS_RDONLY' undeclared (first =
use in this function); did you mean 'IS_RDONLY'?
  sb->s_flags |=3D MS_RDONLY | MS_NOATIME;
                 ^~~~~~~~~
                 IS_RDONLY
drivers/staging/erofs/super.c:343:17: note: each undeclared identifier is r=
eported only once for each function it appears in
drivers/staging/erofs/super.c:343:29: error: 'MS_NOATIME' undeclared (first=
 use in this function); did you mean 'S_NOATIME'?
  sb->s_flags |=3D MS_RDONLY | MS_NOATIME;
                             ^~~~~~~~~~
                             S_NOATIME
drivers/staging/erofs/super.c: In function 'erofs_mount':
drivers/staging/erofs/super.c:501:10: warning: passing argument 5 of 'mount=
_bdev' makes integer from pointer without a cast [-Wint-conversion]
   &priv, erofs_fill_super);
          ^~~~~~~~~~~~~~~~
In file included from include/linux/buffer_head.h:12:0,
                 from drivers/staging/erofs/super.c:14:
include/linux/fs.h:2151:23: note: expected 'size_t {aka long unsigned int}'=
 but argument is of type 'int (*)(struct super_block *, void *, int)'
 extern struct dentry *mount_bdev(struct file_system_type *fs_type,
                       ^~~~~~~~~~
drivers/staging/erofs/super.c:500:9: error: too few arguments to function '=
mount_bdev'
  return mount_bdev(fs_type, flags, dev_name,
         ^~~~~~~~~~
In file included from include/linux/buffer_head.h:12:0,
                 from drivers/staging/erofs/super.c:14:
include/linux/fs.h:2151:23: note: declared here
 extern struct dentry *mount_bdev(struct file_system_type *fs_type,
                       ^~~~~~~~~~
drivers/staging/erofs/super.c: At top level:
drivers/staging/erofs/super.c:518:20: error: initialization from incompatib=
le pointer type [-Werror=3Dincompatible-pointer-types]
  .mount          =3D erofs_mount,
                    ^~~~~~~~~~~
drivers/staging/erofs/super.c:518:20: note: (near initialization for 'erofs=
_fs_type.mount')
drivers/staging/erofs/super.c: In function 'erofs_remount':
drivers/staging/erofs/super.c:630:12: error: 'MS_RDONLY' undeclared (first =
use in this function); did you mean 'IS_RDONLY'?
  *flags |=3D MS_RDONLY;
            ^~~~~~~~~
            IS_RDONLY
drivers/staging/erofs/super.c: At top level:
drivers/staging/erofs/super.c:640:16: error: initialization from incompatib=
le pointer type [-Werror=3Dincompatible-pointer-types]
  .remount_fs =3D erofs_remount,
                ^~~~~~~~~~~~~

Caused by various commits creating erofs in the staging tree interacting
with various commits redoing the mount infrastructure in the vfs tree.

I have disabed CONFIG_EROFS_FS for now:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 30 Jul 2018 16:10:57 +1000
Subject: [PATCH] disable erofs for now

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/erofs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/erofs/Kconfig b/drivers/staging/erofs/Kconfig
index 663b755bf2fb..b37d994aa687 100644
--- a/drivers/staging/erofs/Kconfig
+++ b/drivers/staging/erofs/Kconfig
@@ -3,6 +3,7 @@
 config EROFS_FS
 	tristate "EROFS filesystem support"
 	depends on BLOCK
+	depends on BROKEN
 	help
 	  EROFS(Enhanced Read-Only File System) is a lightweight
 	  read-only file system with modern designs (eg. page-sized
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/5n94owRThEz7nT8UOMe.cta
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlterTYACgkQAVBC80lX
0GxQzwf+JC+z/NHuK14NwbLp0qXCrTRMFs2GxQG7Hvh37VoJfYuPMmHJU83geggn
G6QxXuTsXABXhDFTrKVcH81fKcbbOTwK1qP6nsf2SMbUHYNvP9a91FZao826zzK7
Sc/bLchg7roxlSZ2PK2dbM61kVoCGYMCakqAhLIwWXCm8GleTSeo29tC2xZqdTVV
bh3laUZcv+jY0YB/gDPBvdS2tgsvkc7FLHWOmo49A47KoUsAR8UmDP6/J9wdxRNn
kQ94T9ljavixr37mi7Zw7pxvfI9mBIhDY0Hv7C4CffAsNCsFxwekZxPQfpRTveT+
70XZddCKsMW7lBMUnayCp42xUc86pQ==
=01Me
-----END PGP SIGNATURE-----

--Sig_/5n94owRThEz7nT8UOMe.cta--
