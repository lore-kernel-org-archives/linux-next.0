From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the vfs tree
Date: Fri, 13 Mar 2015 16:27:27 +1100
Message-ID: <20150313162727.1d6b9c94@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_s53OF=+pq1nOrr+WNXfD/8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Alexander Kuleshov <kuleshovmail@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/_s53OF=+pq1nOrr+WNXfD/8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
fs/fat/inode.c between commit 3737c63e1fb0 ("fs: move struct kiocb to
fs.h") from the vfs tree and commit be33247df543 ("fs/fat: remove
unnecessary includes") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/fat/inode.c
index 8521207de229,8ea7fec6716d..000000000000
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@@ -11,20 -11,12 +11,11 @@@
   */
 =20
  #include <linux/module.h>
- #include <linux/init.h>
- #include <linux/time.h>
- #include <linux/slab.h>
- #include <linux/seq_file.h>
  #include <linux/pagemap.h>
  #include <linux/mpage.h>
- #include <linux/buffer_head.h>
- #include <linux/mount.h>
 -#include <linux/aio.h>
  #include <linux/vfs.h>
+ #include <linux/seq_file.h>
  #include <linux/parser.h>
- #include <linux/uio.h>
- #include <linux/writeback.h>
- #include <linux/log2.h>
- #include <linux/hash.h>
  #include <linux/blkdev.h>
  #include <asm/unaligned.h>
  #include "fat.h"

--Sig_/_s53OF=+pq1nOrr+WNXfD/8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVAnVDAAoJEMDTa8Ir7ZwV1gsP/0p7+SYdybamlbW3idvKWWFv
k0EQrbTZctkjhzl6UHeBGDlIgDXMNklnaDpFXZdXktjdA9K+yNHEe9mq1UTkiC2Q
lLQGMwboFZNQkHnzkTlRQY/zOTwUFEZBTnAKIg6MO8c41Q+fGgUPtG57SGCLv8DQ
9X26VodUFbzczZOFEyvnvKguUo1OzjT8Bx/utdCi8i3pQ5dVmbnv8DY2Jsp0F6k6
/4faQJ/3d62xTgS7Ji0tk9KMZuna0zN9UmMO7kdrob1m7Il4Ply/vcF6j3cPM76z
w3auwOT314Lu8iZYyCL9wWgRpE9PYqlUWTWxiZ8LTjLUbfmD9bWz3htmoZP1X/lM
WzoecN9qUVDA61ZntsrkPtFp5FlYuox6Ld6uT37gXd7CVeiWK8iuXGubfGvlsOJt
ZGrmYfcKkEtIelFvmTCou7y01318ODOplN7iGYbwnDDd8nE8uDo4HsQgWziGRoMR
fq8trolLIkoG4wYSsAXwUz1QDkR4PIZYPycmWHY2Uu3qM5o9HboPmwokvUsAHBdk
Nwrxpv+ZFhDA6nyQxCUISCtqYFVlxBi3w8vGehLM9clzMThggzTL8m3pdTq4ufK9
gJa2C9pFNVQ52J5weR6JuBt7n1gF3AnKl+XymYyA6BPvP6ACznKzHxbxy3mjaphV
7ZF/Dssx2MezQ08aencb
=1w/p
-----END PGP SIGNATURE-----

--Sig_/_s53OF=+pq1nOrr+WNXfD/8--
