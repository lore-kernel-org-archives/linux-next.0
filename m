From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the f2fs tree
Date: Wed, 3 Oct 2018 10:12:07 +1000
Message-ID: <20181003101207.2553ca7c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ST5DDRH7T+QUIB5ojyL6Ihm"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Daniel Rosenberg <drosen@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ST5DDRH7T+QUIB5ojyL6Ihm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/f2fs/super.c

between commit:

  f80f781514ef ("f2fs: checkpoint disabling")

from the f2fs tree and commit:

  307c6e5241b4 ("vfs: Require specification of size of mount data for inter=
nal mounts")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/f2fs/super.c
index 952a67b3184a,89970dd81b0e..000000000000
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@@ -1449,53 -1419,8 +1449,54 @@@ static void default_options(struct f2fs
  #ifdef CONFIG_QUOTA
  static int f2fs_enable_quotas(struct super_block *sb);
  #endif
 +
 +static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 +{
 +	struct cp_control cpc;
 +	int err;
 +
 +	sbi->sb->s_flags |=3D SB_ACTIVE;
 +
 +	mutex_lock(&sbi->gc_mutex);
 +	for (; dirty_segments(sbi) > 2 * NR_CURSEG_TYPE;) {
 +		err =3D f2fs_gc(sbi, true, false, NULL_SEGNO);
 +		if (err =3D=3D -ENODATA)
 +			break;
 +		if (err && err !=3D -EAGAIN) {
 +			mutex_unlock(&sbi->gc_mutex);
 +			return err;
 +		}
 +	}
 +	mutex_unlock(&sbi->gc_mutex);
 +
 +	err =3D sync_filesystem(sbi->sb);
 +	if (err)
 +		return err;
 +
 +	mutex_lock(&sbi->gc_mutex);
 +	cpc.reason =3D CP_PAUSE;
 +	set_sbi_flag(sbi, SBI_CP_DISABLED);
 +	f2fs_write_checkpoint(sbi, &cpc);
 +
 +	sbi->unusable_block_count =3D 0;
 +	mutex_unlock(&sbi->gc_mutex);
 +	return 0;
 +}
 +
 +static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 +{
 +	mutex_lock(&sbi->gc_mutex);
 +	f2fs_dirty_to_prefree(sbi);
 +
 +	clear_sbi_flag(sbi, SBI_CP_DISABLED);
 +	set_sbi_flag(sbi, SBI_IS_DIRTY);
 +	mutex_unlock(&sbi->gc_mutex);
 +
 +	f2fs_sync_fs(sbi->sb, 1);
 +}
 +
- static int f2fs_remount(struct super_block *sb, int *flags, char *data)
+ static int f2fs_remount(struct super_block *sb, int *flags,
+ 			char *data, size_t data_size)
  {
  	struct f2fs_sb_info *sbi =3D F2FS_SB(sb);
  	struct f2fs_mount_info org_mount_opt;

--Sig_/ST5DDRH7T+QUIB5ojyL6Ihm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu0CVcACgkQAVBC80lX
0GxmdAgAkYuaezPMu/Nttte9vH5MqBuJLbJQIEq+jHka9gUQoaLbyvvHK6ALklB5
jOxvoHELYKgrZt6EBzdemYedSYpOPXmIphi0dn+FXm8U/3TmTEGPgqX3X3kEnWR7
F15cqtBTVH8zTNdWI/w563/+aepJsMbrQTiqGURQK3rH8OMm9ZRIdhHfBGq+BiaM
UGj6n2Zkj4JFiJJj/H6fXGYXwv/OgRfWg05F5gtOtRW2wPOxnDK83to0FEg9MCCD
PlN529/5OAjBMAF/PM01fRntvlo1OS9keyVjkJ5sl2Y88n3vbFTvVEPwaqOvmzNz
qeIRK+HdJZx7UKGgtNiH3xYU2/626Q==
=G058
-----END PGP SIGNATURE-----

--Sig_/ST5DDRH7T+QUIB5ojyL6Ihm--
