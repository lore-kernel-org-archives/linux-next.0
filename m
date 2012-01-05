From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext3 tree
Date: Thu, 5 Jan 2012 13:06:09 +1100
Message-ID: <20120105130609.2e4915ff183727456b527477@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__5_Jan_2012_13_06_09_+1100_/BeyiupTGiCM7.T0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mikulas Patocka <mpatocka@redhat.com>, Jan Kara <jack@suse.cz>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__5_Jan_2012_13_06_09_+1100_/BeyiupTGiCM7.T0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
include/linux/fs.h between commit 4789fd4495a4 ("quota: Fix deadlock with
suspend and quotas") from the ext3 tree and commit cf31e70d6cf9 ("vfs:
new helper - vfs_ustat()") from the vfs tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/fs.h
index 3aba12c,7aacf31..0000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -2531,8 -2489,6 +2489,7 @@@ extern void put_filesystem(struct file_
  extern struct file_system_type *get_fs_type(const char *name);
  extern struct super_block *get_super(struct block_device *);
  extern struct super_block *get_active_super(struct block_device *bdev);
- extern struct super_block *user_get_super(dev_t);
 +extern void put_super(struct super_block *sb);
  extern void drop_super(struct super_block *sb);
  extern void iterate_supers(void (*)(struct super_block *, void *), void *=
);
  extern void iterate_supers_type(struct file_system_type *,

--Signature=_Thu__5_Jan_2012_13_06_09_+1100_/BeyiupTGiCM7.T0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPBQWRAAoJEECxmPOUX5FEKlMP/i5BTMBYAa87ymBgDkoIGBzE
n8I586Rd9cEGRwLZ4LuYoJoVibNxEu1SxweFcw0RciGnTo73QrQRbzlF43sWoAB2
Is1R9bVQrPSoScktQaB0rjiWLfOe4m4xUs/eXeWZUqKOCtuSY/CTk1awPD+YPWso
1UuLzhlEr64+Gq1Iok0EciEtJEjW3vofSRib7cJSiILDIy3rCimZwFWzwulfS7PM
xxIoRtI1mfyIjiRdVVZDhKz5XWWIRi8KDSp0wG2zZj6stBcdTygev8Dm8MAhGscH
C1XmvahVeqIkg56t21DTQh56ssbeyQtlixcxGxaggTS2u+36RRrkuW+2jnoVm/p1
YM/R7m3IB7OlKilAPOjRn1n3ZDgJ8GmuVmIeL4q2uj1ZU+2sotHtAL55HeE15/9A
7RS19pyZgQxmnoAYQIq/gmsKbAbi1121ipkb967zybQ3M8DJaRzFuRBhV7fM9B4N
CK3VTfTMHzVz/bh35MJS5MNg1rEbd8GVSJA4gctpuGJOnKAELVBDjgdLMF5F+zbs
9dcYWFcIF2S1ivPQK4SiYnSrkVmS9LDUU4r6QvmgQXBB2KkJR4fwjY6aLblD53RB
ZuaNlDR72vQU+E9my81kn5LjE/+0E+8jC6slQXIFUzroLzHmadq7lbGPFH46TE2n
84DjsmT8SY15GvMkFXiZ
=PkCl
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Jan_2012_13_06_09_+1100_/BeyiupTGiCM7.T0--
