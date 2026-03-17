Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4403290D2;
	Tue, 17 Mar 2026 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755307; cv=none; b=Th9vMJ/6Qcvz6R7ThoKNkEY6HnmIYMDzRX4wK5cwy2RpArM5w6yS7dTYKfP5E0EZn7XfD2fvFHaqBJP1TjtdZA1863iKJtbizdy5ytmvklvg3lwFpsRWTvEvYFDdc/CvobVJ2xDzfX8smlrOxmqyXvMbNO3b+YL+YdTzrJPBWVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755307; c=relaxed/simple;
	bh=KAdwf0yIRx6r0uKeXQ5p0L4qovIIKYzbhEcgEvSeIl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aXxMd3IhymjGS/XCOdrUauVEnXrv+4WSNZz8XGNi0zEADzTokwNBkL9GFphdzJmZ4Z/1nX99BQsMei0cMiiAQdyiF7IV+n1AjFp+vjscaJK3/k5Qqn23Pl9+kq0n1MN97hw3nifGoeiw1vwkw9om0vzmo8TC/8nuAC4vdZy8pBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqafIE8B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqafIE8B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F352C4CEF7;
	Tue, 17 Mar 2026 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773755306;
	bh=KAdwf0yIRx6r0uKeXQ5p0L4qovIIKYzbhEcgEvSeIl8=;
	h=Date:From:To:Cc:Subject:From;
	b=EqafIE8BUORVDYqZRjnsGwhoonKcy9r52WMpygPPBdWlRyVizVW8W20V74dDWNwTy
	 CynSt+pCl9dyclltdyeYWhMqVmqRwh+FxFnW4Sc8EX4JFqkrifgcizaP2Y+c+669Bg
	 6tSF5PjbOq8tAX9EEEGRvCht2ZeL2uJql45Q39KQA7uNpaG06ASwQ0/n4MlnKfyx/a
	 yN6hAkpqcbjSAFxmtchA3K3j6MZZc5ZCremBV3E+KF83fFPiGyK+rLyjvaS2Omqkfw
	 vI3ba/lYMGW+XnfNMq4L59z79iWPZwoK6bFdNvia3xzR/WWphxg5JfA+mmq+ivW2Nr
	 RZaCx99wRp4gA==
Date: Tue, 17 Mar 2026 13:48:22 +0000
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Filipe Manana <fdmanana@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the btrfs tree with the btrfs-fixes tree
Message-ID: <ablbpijj6320hWVQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="my7knnTzq3QvUCrW"
Content-Disposition: inline


--my7knnTzq3QvUCrW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/disk-io.c

between commit:

  50242828700f0 ("btrfs: check for NULL root after calls to btrfs_extent_ro=
ot()")

=66rom the btrfs-fixes tree and commits:

  6960a23c3d592 ("btrfs: check for NULL root after calls to btrfs_extent_ro=
ot()")
  a1f82939d6410 ("btrfs: remove max_mirrors argument from write_all_supers(=
)")

=66rom the btrfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/btrfs/disk-io.c
index 01f2dbb698326,45e6dde602744..0000000000000
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@@ -50,7 -50,6 +50,6 @@@
  #include "relocation.h"
  #include "scrub.h"
  #include "super.h"
- #include "delayed-inode.h"
 =20
  #define BTRFS_SUPER_FLAG_SUPP	(BTRFS_HEADER_FLAG_WRITTEN |\
  				 BTRFS_HEADER_FLAG_RELOC |\
@@@ -110,19 -109,26 +109,26 @@@ static void csum_tree_block(struct exte
   * detect blocks that either didn't get written at all or got written
   * in the wrong place.
   */
- int btrfs_buffer_uptodate(struct extent_buffer *eb, u64 parent_transid, b=
ool atomic)
+ int btrfs_buffer_uptodate(struct extent_buffer *eb, u64 parent_transid, b=
ool atomic,
+ 			  const struct btrfs_tree_parent_check *check)
  {
  	if (!extent_buffer_uptodate(eb))
  		return 0;
 =20
- 	if (!parent_transid || btrfs_header_generation(eb) =3D=3D parent_transid)
+ 	if (!parent_transid || btrfs_header_generation(eb) =3D=3D parent_transid=
) {
+ 		/*
+ 		 * On a cache hit, the caller may still need tree parent
+ 		 * verification before reusing the buffer.
+ 		 */
+ 		if (unlikely(check && btrfs_verify_level_key(eb, check)))
+ 			return -EUCLEAN;
  		return 1;
+ 	}
 =20
  	if (atomic)
  		return -EAGAIN;
 =20
- 	if (!extent_buffer_uptodate(eb) ||
- 	    btrfs_header_generation(eb) !=3D parent_transid) {
+ 	if (btrfs_header_generation(eb) !=3D parent_transid) {
  		btrfs_err_rl(eb->fs_info,
  "parent transid verify failed on logical %llu mirror %u wanted %llu found=
 %llu",
  			eb->start, eb->read_mirror,
@@@ -730,7 -736,7 +736,7 @@@ void btrfs_global_root_delete(struct bt
  }
 =20
  struct btrfs_root *btrfs_global_root(struct btrfs_fs_info *fs_info,
- 				     struct btrfs_key *key)
+ 				     const struct btrfs_key *key)
  {
  	struct rb_node *node;
  	struct btrfs_root *root =3D NULL;
@@@ -767,7 -773,7 +773,7 @@@ static u64 btrfs_global_root_id(struct=20
 =20
  struct btrfs_root *btrfs_csum_root(struct btrfs_fs_info *fs_info, u64 byt=
enr)
  {
- 	struct btrfs_key key =3D {
+ 	const struct btrfs_key key =3D {
  		.objectid =3D BTRFS_CSUM_TREE_OBJECTID,
  		.type =3D BTRFS_ROOT_ITEM_KEY,
  		.offset =3D btrfs_global_root_id(fs_info, bytenr),
@@@ -778,7 -784,7 +784,7 @@@
 =20
  struct btrfs_root *btrfs_extent_root(struct btrfs_fs_info *fs_info, u64 b=
ytenr)
  {
- 	struct btrfs_key key =3D {
+ 	const struct btrfs_key key =3D {
  		.objectid =3D BTRFS_EXTENT_TREE_OBJECTID,
  		.type =3D BTRFS_ROOT_ITEM_KEY,
  		.offset =3D btrfs_global_root_id(fs_info, bytenr),
@@@ -994,8 -1000,11 +1000,11 @@@ static struct btrfs_root *read_tree_roo
  		root->node =3D NULL;
  		goto fail;
  	}
- 	if (unlikely(!btrfs_buffer_uptodate(root->node, generation, false))) {
- 		ret =3D -EIO;
+=20
+ 	ret =3D btrfs_buffer_uptodate(root->node, generation, false, &check);
+ 	if (unlikely(ret <=3D 0)) {
+ 		if (ret =3D=3D 0)
+ 			ret =3D -EIO;
  		goto fail;
  	}
 =20
@@@ -2025,11 -2034,6 +2034,6 @@@ static int btrfs_replay_log(struct btrf
  		btrfs_put_root(log_tree_root);
  		return ret;
  	}
- 	if (unlikely(!extent_buffer_uptodate(log_tree_root->node))) {
- 		btrfs_err(fs_info, "failed to read log tree");
- 		btrfs_put_root(log_tree_root);
- 		return -EIO;
- 	}
 =20
  	/* returns with log_tree_root freed on success */
  	ret =3D btrfs_recover_log_trees(log_tree_root);
@@@ -2299,6 -2303,15 +2303,15 @@@ static int validate_sys_chunk_array(con
  		return -EUCLEAN;
  	}
 =20
+ 	/* It must hold at least one key and one chunk. */
+ 	if (unlikely(sys_array_size < sizeof(struct btrfs_disk_key) +
+ 		     sizeof(struct btrfs_chunk))) {
+ 		btrfs_err(fs_info, "system chunk array too small %u < %zu",
+ 			  sys_array_size,
+ 			  sizeof(struct btrfs_disk_key) + sizeof(struct btrfs_chunk));
+ 		return -EUCLEAN;
+ 	}
+=20
  	while (cur < sys_array_size) {
  		struct btrfs_disk_key *disk_key;
  		struct btrfs_chunk *chunk;
@@@ -2365,11 -2378,11 +2378,11 @@@ int btrfs_validate_super(const struct b
  	int ret =3D 0;
  	const bool ignore_flags =3D btrfs_test_opt(fs_info, IGNORESUPERFLAGS);
 =20
- 	if (btrfs_super_magic(sb) !=3D BTRFS_MAGIC) {
+ 	if (unlikely(btrfs_super_magic(sb) !=3D BTRFS_MAGIC)) {
  		btrfs_err(fs_info, "no valid FS found");
  		ret =3D -EINVAL;
  	}
- 	if ((btrfs_super_flags(sb) & ~BTRFS_SUPER_FLAG_SUPP)) {
+ 	if (unlikely(btrfs_super_flags(sb) & ~BTRFS_SUPER_FLAG_SUPP)) {
  		if (!ignore_flags) {
  			btrfs_err(fs_info,
  			"unrecognized or unsupported super flag 0x%llx",
@@@ -2381,17 -2394,17 +2394,17 @@@
  				   btrfs_super_flags(sb) & ~BTRFS_SUPER_FLAG_SUPP);
  		}
  	}
- 	if (btrfs_super_root_level(sb) >=3D BTRFS_MAX_LEVEL) {
+ 	if (unlikely(btrfs_super_root_level(sb) >=3D BTRFS_MAX_LEVEL)) {
  		btrfs_err(fs_info, "tree_root level too big: %d >=3D %d",
  				btrfs_super_root_level(sb), BTRFS_MAX_LEVEL);
  		ret =3D -EINVAL;
  	}
- 	if (btrfs_super_chunk_root_level(sb) >=3D BTRFS_MAX_LEVEL) {
+ 	if (unlikely(btrfs_super_chunk_root_level(sb) >=3D BTRFS_MAX_LEVEL)) {
  		btrfs_err(fs_info, "chunk_root level too big: %d >=3D %d",
  				btrfs_super_chunk_root_level(sb), BTRFS_MAX_LEVEL);
  		ret =3D -EINVAL;
  	}
- 	if (btrfs_super_log_root_level(sb) >=3D BTRFS_MAX_LEVEL) {
+ 	if (unlikely(btrfs_super_log_root_level(sb) >=3D BTRFS_MAX_LEVEL)) {
  		btrfs_err(fs_info, "log_root level too big: %d >=3D %d",
  				btrfs_super_log_root_level(sb), BTRFS_MAX_LEVEL);
  		ret =3D -EINVAL;
@@@ -2401,65 -2414,65 +2414,65 @@@
  	 * Check sectorsize and nodesize first, other check will need it.
  	 * Check all possible sectorsize(4K, 8K, 16K, 32K, 64K) here.
  	 */
- 	if (!is_power_of_2(sectorsize) || sectorsize < BTRFS_MIN_BLOCKSIZE ||
- 	    sectorsize > BTRFS_MAX_METADATA_BLOCKSIZE) {
+ 	if (unlikely(!is_power_of_2(sectorsize) || sectorsize < BTRFS_MIN_BLOCKS=
IZE ||
+ 		     sectorsize > BTRFS_MAX_METADATA_BLOCKSIZE)) {
  		btrfs_err(fs_info, "invalid sectorsize %llu", sectorsize);
  		ret =3D -EINVAL;
  	}
 =20
- 	if (!btrfs_supported_blocksize(sectorsize)) {
+ 	if (unlikely(!btrfs_supported_blocksize(sectorsize))) {
  		btrfs_err(fs_info,
  			"sectorsize %llu not yet supported for page size %lu",
  			sectorsize, PAGE_SIZE);
  		ret =3D -EINVAL;
  	}
 =20
- 	if (!is_power_of_2(nodesize) || nodesize < sectorsize ||
- 	    nodesize > BTRFS_MAX_METADATA_BLOCKSIZE) {
+ 	if (unlikely(!is_power_of_2(nodesize) || nodesize < sectorsize ||
+ 		     nodesize > BTRFS_MAX_METADATA_BLOCKSIZE)) {
  		btrfs_err(fs_info, "invalid nodesize %llu", nodesize);
  		ret =3D -EINVAL;
  	}
- 	if (nodesize !=3D le32_to_cpu(sb->__unused_leafsize)) {
+ 	if (unlikely(nodesize !=3D le32_to_cpu(sb->__unused_leafsize))) {
  		btrfs_err(fs_info, "invalid leafsize %u, should be %llu",
  			  le32_to_cpu(sb->__unused_leafsize), nodesize);
  		ret =3D -EINVAL;
  	}
 =20
  	/* Root alignment check */
- 	if (!IS_ALIGNED(btrfs_super_root(sb), sectorsize)) {
+ 	if (unlikely(!IS_ALIGNED(btrfs_super_root(sb), sectorsize))) {
  		btrfs_err(fs_info, "tree_root block unaligned: %llu",
  			  btrfs_super_root(sb));
  		ret =3D -EINVAL;
  	}
- 	if (!IS_ALIGNED(btrfs_super_chunk_root(sb), sectorsize)) {
+ 	if (unlikely(!IS_ALIGNED(btrfs_super_chunk_root(sb), sectorsize))) {
  		btrfs_err(fs_info, "chunk_root block unaligned: %llu",
  			   btrfs_super_chunk_root(sb));
  		ret =3D -EINVAL;
  	}
- 	if (!IS_ALIGNED(btrfs_super_log_root(sb), sectorsize)) {
+ 	if (unlikely(!IS_ALIGNED(btrfs_super_log_root(sb), sectorsize))) {
  		btrfs_err(fs_info, "log_root block unaligned: %llu",
  			  btrfs_super_log_root(sb));
  		ret =3D -EINVAL;
  	}
 =20
- 	if (!fs_info->fs_devices->temp_fsid &&
- 	    memcmp(fs_info->fs_devices->fsid, sb->fsid, BTRFS_FSID_SIZE) !=3D 0)=
 {
+ 	if (unlikely(!fs_info->fs_devices->temp_fsid &&
+ 		     memcmp(fs_info->fs_devices->fsid, sb->fsid, BTRFS_FSID_SIZE) !=3D =
0)) {
  		btrfs_err(fs_info,
  		"superblock fsid doesn't match fsid of fs_devices: %pU !=3D %pU",
  			  sb->fsid, fs_info->fs_devices->fsid);
  		ret =3D -EINVAL;
  	}
 =20
- 	if (memcmp(fs_info->fs_devices->metadata_uuid, btrfs_sb_fsid_ptr(sb),
- 		   BTRFS_FSID_SIZE) !=3D 0) {
+ 	if (unlikely(memcmp(fs_info->fs_devices->metadata_uuid, btrfs_sb_fsid_pt=
r(sb),
+ 			    BTRFS_FSID_SIZE) !=3D 0)) {
  		btrfs_err(fs_info,
  "superblock metadata_uuid doesn't match metadata uuid of fs_devices: %pU =
!=3D %pU",
  			  btrfs_sb_fsid_ptr(sb), fs_info->fs_devices->metadata_uuid);
  		ret =3D -EINVAL;
  	}
 =20
- 	if (memcmp(fs_info->fs_devices->metadata_uuid, sb->dev_item.fsid,
- 		   BTRFS_FSID_SIZE) !=3D 0) {
+ 	if (unlikely(memcmp(fs_info->fs_devices->metadata_uuid, sb->dev_item.fsi=
d,
+ 			    BTRFS_FSID_SIZE) !=3D 0)) {
  		btrfs_err(fs_info,
  			"dev_item UUID does not match metadata fsid: %pU !=3D %pU",
  			fs_info->fs_devices->metadata_uuid, sb->dev_item.fsid);
@@@ -2470,9 -2483,9 +2483,9 @@@
  	 * Artificial requirement for block-group-tree to force newer features
  	 * (free-space-tree, no-holes) so the test matrix is smaller.
  	 */
- 	if (btrfs_fs_compat_ro(fs_info, BLOCK_GROUP_TREE) &&
- 	    (!btrfs_fs_compat_ro(fs_info, FREE_SPACE_TREE_VALID) ||
- 	     !btrfs_fs_incompat(fs_info, NO_HOLES))) {
+ 	if (unlikely(btrfs_fs_compat_ro(fs_info, BLOCK_GROUP_TREE) &&
+ 		     (!btrfs_fs_compat_ro(fs_info, FREE_SPACE_TREE_VALID) ||
+ 		      !btrfs_fs_incompat(fs_info, NO_HOLES)))) {
  		btrfs_err(fs_info,
  		"block-group-tree feature requires free-space-tree and no-holes");
  		ret =3D -EINVAL;
@@@ -2483,25 -2496,25 +2496,25 @@@
  		 * Reduce test matrix for remap tree by requiring block-group-tree
  		 * and no-holes. Free-space-tree is a hard requirement.
  		 */
- 		if (!btrfs_fs_compat_ro(fs_info, FREE_SPACE_TREE_VALID) ||
- 		    !btrfs_fs_incompat(fs_info, NO_HOLES) ||
- 		    !btrfs_fs_compat_ro(fs_info, BLOCK_GROUP_TREE)) {
+ 		if (unlikely(!btrfs_fs_compat_ro(fs_info, FREE_SPACE_TREE_VALID) ||
+ 			     !btrfs_fs_incompat(fs_info, NO_HOLES) ||
+ 			     !btrfs_fs_compat_ro(fs_info, BLOCK_GROUP_TREE))) {
  			btrfs_err(fs_info,
  "remap-tree feature requires free-space-tree, no-holes, and block-group-t=
ree");
  			ret =3D -EINVAL;
  		}
 =20
- 		if (btrfs_fs_incompat(fs_info, MIXED_GROUPS)) {
+ 		if (unlikely(btrfs_fs_incompat(fs_info, MIXED_GROUPS))) {
  			btrfs_err(fs_info, "remap-tree not supported with mixed-bg");
  			ret =3D -EINVAL;
  		}
 =20
- 		if (btrfs_fs_incompat(fs_info, ZONED)) {
+ 		if (unlikely(btrfs_fs_incompat(fs_info, ZONED))) {
  			btrfs_err(fs_info, "remap-tree not supported with zoned devices");
  			ret =3D -EINVAL;
  		}
 =20
- 		if (sectorsize > PAGE_SIZE) {
+ 		if (unlikely(sectorsize > PAGE_SIZE)) {
  			btrfs_err(fs_info, "remap-tree not supported when block size > page si=
ze");
  			ret =3D -EINVAL;
  		}
@@@ -2511,66 -2524,47 +2524,47 @@@
  	 * Hint to catch really bogus numbers, bitflips or so, more exact checks=
 are
  	 * done later
  	 */
- 	if (btrfs_super_bytes_used(sb) < 6 * btrfs_super_nodesize(sb)) {
+ 	if (unlikely(btrfs_super_bytes_used(sb) < 6 * btrfs_super_nodesize(sb)))=
 {
  		btrfs_err(fs_info, "bytes_used is too small %llu",
  			  btrfs_super_bytes_used(sb));
  		ret =3D -EINVAL;
  	}
- 	if (!is_power_of_2(btrfs_super_stripesize(sb))) {
+ 	if (unlikely(!is_power_of_2(btrfs_super_stripesize(sb)))) {
  		btrfs_err(fs_info, "invalid stripesize %u",
  			  btrfs_super_stripesize(sb));
  		ret =3D -EINVAL;
  	}
- 	if (btrfs_super_num_devices(sb) > (1UL << 31))
+ 	if (unlikely(btrfs_super_num_devices(sb) > (1UL << 31)))
  		btrfs_warn(fs_info, "suspicious number of devices: %llu",
  			   btrfs_super_num_devices(sb));
- 	if (btrfs_super_num_devices(sb) =3D=3D 0) {
+ 	if (unlikely(btrfs_super_num_devices(sb) =3D=3D 0)) {
  		btrfs_err(fs_info, "number of devices is 0");
  		ret =3D -EINVAL;
  	}
 =20
- 	if (mirror_num >=3D 0 &&
- 	    btrfs_super_bytenr(sb) !=3D btrfs_sb_offset(mirror_num)) {
- 		btrfs_err(fs_info, "super offset mismatch %llu !=3D %u",
- 			  btrfs_super_bytenr(sb), BTRFS_SUPER_INFO_OFFSET);
+ 	if (unlikely(mirror_num >=3D 0 &&
+ 		     btrfs_super_bytenr(sb) !=3D btrfs_sb_offset(mirror_num))) {
+ 		btrfs_err(fs_info, "super offset mismatch %llu !=3D %llu",
+ 			  btrfs_super_bytenr(sb), btrfs_sb_offset(mirror_num));
  		ret =3D -EINVAL;
  	}
 =20
- 	if (ret)
+ 	if (unlikely(ret))
  		return ret;
 =20
  	ret =3D validate_sys_chunk_array(fs_info, sb);
 =20
- 	/*
- 	 * Obvious sys_chunk_array corruptions, it must hold at least one key
- 	 * and one chunk
- 	 */
- 	if (btrfs_super_sys_array_size(sb) > BTRFS_SYSTEM_CHUNK_ARRAY_SIZE) {
- 		btrfs_err(fs_info, "system chunk array too big %u > %u",
- 			  btrfs_super_sys_array_size(sb),
- 			  BTRFS_SYSTEM_CHUNK_ARRAY_SIZE);
- 		ret =3D -EINVAL;
- 	}
- 	if (btrfs_super_sys_array_size(sb) < sizeof(struct btrfs_disk_key)
- 			+ sizeof(struct btrfs_chunk)) {
- 		btrfs_err(fs_info, "system chunk array too small %u < %zu",
- 			  btrfs_super_sys_array_size(sb),
- 			  sizeof(struct btrfs_disk_key)
- 			  + sizeof(struct btrfs_chunk));
- 		ret =3D -EINVAL;
- 	}
-=20
  	/*
  	 * The generation is a global counter, we'll trust it more than the othe=
rs
  	 * but it's still possible that it's the one that's wrong.
  	 */
- 	if (btrfs_super_generation(sb) < btrfs_super_chunk_root_generation(sb))
+ 	if (unlikely(btrfs_super_generation(sb) < btrfs_super_chunk_root_generat=
ion(sb)))
  		btrfs_warn(fs_info,
  			"suspicious: generation < chunk_root_generation: %llu < %llu",
  			btrfs_super_generation(sb),
  			btrfs_super_chunk_root_generation(sb));
- 	if (btrfs_super_generation(sb) < btrfs_super_cache_generation(sb)
- 	    && btrfs_super_cache_generation(sb) !=3D (u64)-1)
+ 	if (unlikely(btrfs_super_generation(sb) < btrfs_super_cache_generation(s=
b) &&
+ 		     btrfs_super_cache_generation(sb) !=3D (u64)-1))
  		btrfs_warn(fs_info,
  			"suspicious: generation < cache_generation: %llu < %llu",
  			btrfs_super_generation(sb),
@@@ -2601,7 -2595,7 +2595,7 @@@ static int btrfs_validate_write_super(s
  	int ret;
 =20
  	ret =3D btrfs_validate_super(fs_info, sb, -1);
- 	if (ret < 0)
+ 	if (unlikely(ret < 0))
  		goto out;
  	if (unlikely(!btrfs_supported_super_csum(btrfs_super_csum_type(sb)))) {
  		ret =3D -EUCLEAN;
@@@ -2618,7 -2612,7 +2612,7 @@@
  		goto out;
  	}
  out:
- 	if (ret < 0)
+ 	if (unlikely(ret < 0))
  		btrfs_err(fs_info,
  		"super block corruption detected before writing it to disk");
  	return ret;
@@@ -2639,11 -2633,6 +2633,6 @@@ static int load_super_root(struct btrfs
  		root->node =3D NULL;
  		return ret;
  	}
- 	if (unlikely(!extent_buffer_uptodate(root->node))) {
- 		free_extent_buffer(root->node);
- 		root->node =3D NULL;
- 		return -EIO;
- 	}
 =20
  	btrfs_set_root_node(&root->root_item, root->node);
  	root->commit_root =3D btrfs_root_node(root);
@@@ -3766,8 -3755,7 +3755,7 @@@ static void btrfs_end_super_write(struc
   * Write superblock @sb to the @device. Do not wait for completion, all t=
he
   * folios we use for writing are locked.
   *
-  * Write @max_mirrors copies of the superblock, where 0 means default tha=
t fit
-  * the expected device size at commit time. Note that max_mirrors must be
+  * Write @max_mirrors copies of the superblock. Note that max_mirrors mus=
t be
   * same for write and wait phases.
   *
   * Return number of errors when folio is not found or submission fails.
@@@ -3783,9 -3771,6 +3771,6 @@@ static int write_dev_supers(struct btrf
 =20
  	atomic_set(&device->sb_write_errors, 0);
 =20
- 	if (max_mirrors =3D=3D 0)
- 		max_mirrors =3D BTRFS_SUPER_MIRROR_MAX;
-=20
  	for (i =3D 0; i < max_mirrors; i++) {
  		struct folio *folio;
  		struct bio *bio;
@@@ -3870,16 -3855,13 +3855,13 @@@ static int wait_dev_supers(struct btrfs
  	int ret;
  	u64 bytenr;
 =20
- 	if (max_mirrors =3D=3D 0)
- 		max_mirrors =3D BTRFS_SUPER_MIRROR_MAX;
-=20
  	for (i =3D 0; i < max_mirrors; i++) {
  		struct folio *folio;
 =20
  		ret =3D btrfs_sb_log_location(device, i, READ, &bytenr);
  		if (ret =3D=3D -ENOENT) {
  			break;
- 		} else if (ret < 0) {
+ 		} else if (unlikely(ret < 0)) {
  			errors++;
  			if (i =3D=3D 0)
  				primary_failed =3D true;
@@@ -3901,9 -3883,8 +3883,8 @@@
  	}
 =20
  	errors +=3D atomic_read(&device->sb_write_errors);
- 	if (errors >=3D BTRFS_SUPER_PRIMARY_WRITE_ERROR)
- 		primary_failed =3D true;
- 	if (primary_failed) {
+=20
+ 	if (unlikely(primary_failed || errors >=3D BTRFS_SUPER_PRIMARY_WRITE_ERR=
OR)) {
  		btrfs_err(device->fs_info, "error writing primary super block to device=
 %llu",
  			  device->devid);
  		return -1;
@@@ -3954,7 -3935,7 +3935,7 @@@ static bool wait_dev_flush(struct btrfs
 =20
  	wait_for_completion_io(&device->flush_wait);
 =20
- 	if (bio->bi_status) {
+ 	if (unlikely(bio->bi_status)) {
  		set_bit(BTRFS_DEV_STATE_FLUSH_FAILED, &device->dev_state);
  		btrfs_dev_stat_inc_and_print(device, BTRFS_DEV_STAT_FLUSH_ERRS);
  		return true;
@@@ -3992,7 -3973,7 +3973,7 @@@ static int barrier_all_devices(struct b
  	list_for_each_entry(dev, head, dev_list) {
  		if (test_bit(BTRFS_DEV_STATE_MISSING, &dev->dev_state))
  			continue;
- 		if (!dev->bdev) {
+ 		if (unlikely(!dev->bdev)) {
  			errors_wait++;
  			continue;
  		}
@@@ -4000,7 -3981,7 +3981,7 @@@
  		    !test_bit(BTRFS_DEV_STATE_WRITEABLE, &dev->dev_state))
  			continue;
 =20
- 		if (wait_dev_flush(dev))
+ 		if (unlikely(wait_dev_flush(dev)))
  			errors_wait++;
  	}
 =20
@@@ -4043,26 -4024,27 +4024,27 @@@ int btrfs_get_num_tolerated_disk_barrie
  	return min_tolerated;
  }
 =20
- int write_all_supers(struct btrfs_fs_info *fs_info, int max_mirrors)
+ int write_all_supers(struct btrfs_trans_handle *trans)
  {
+ 	struct btrfs_fs_info *fs_info =3D trans->fs_info;
  	struct list_head *head;
  	struct btrfs_device *dev;
  	struct btrfs_super_block *sb;
  	struct btrfs_dev_item *dev_item;
+ 	int max_mirrors;
  	int ret;
  	int do_barriers;
  	int max_errors;
  	int total_errors =3D 0;
- 	u64 flags;
 =20
  	do_barriers =3D !btrfs_test_opt(fs_info, NOBARRIER);
 =20
- 	/*
- 	 * max_mirrors =3D=3D 0 indicates we're from commit_transaction,
- 	 * not from fsync where the tree roots in fs_info have not
- 	 * been consistent on disk.
- 	 */
- 	if (max_mirrors =3D=3D 0) {
+ 	if (trans->transaction->state < TRANS_STATE_UNBLOCKED) {
+ 		/* We are called from fsync. */
+ 		max_mirrors =3D 1;
+ 	} else {
+ 		/* We are called from transaction commit. */
+ 		max_mirrors =3D BTRFS_SUPER_MIRROR_MAX;
  		ret =3D backup_super_roots(fs_info);
  		if (ret < 0)
  			return ret;
@@@ -4077,17 -4059,19 +4059,19 @@@
 =20
  	if (do_barriers) {
  		ret =3D barrier_all_devices(fs_info);
- 		if (ret) {
+ 		if (unlikely(ret)) {
  			mutex_unlock(
  				&fs_info->fs_devices->device_list_mutex);
- 			btrfs_handle_fs_error(fs_info, ret,
- 					      "errors while submitting device barriers.");
+ 			btrfs_abort_transaction(trans, ret);
+ 			btrfs_err(fs_info, "error while submitting device barriers");
  			return ret;
  		}
  	}
 =20
+ 	btrfs_set_super_flags(sb, btrfs_super_flags(sb) | BTRFS_HEADER_FLAG_WRIT=
TEN);
+=20
  	list_for_each_entry(dev, head, dev_list) {
- 		if (!dev->bdev) {
+ 		if (unlikely(!dev->bdev)) {
  			total_errors++;
  			continue;
  		}
@@@ -4109,19 -4093,17 +4093,17 @@@
  		memcpy(dev_item->fsid, dev->fs_devices->metadata_uuid,
  		       BTRFS_FSID_SIZE);
 =20
- 		flags =3D btrfs_super_flags(sb);
- 		btrfs_set_super_flags(sb, flags | BTRFS_HEADER_FLAG_WRITTEN);
-=20
  		ret =3D btrfs_validate_write_super(fs_info, sb);
  		if (unlikely(ret < 0)) {
  			mutex_unlock(&fs_info->fs_devices->device_list_mutex);
- 			btrfs_handle_fs_error(fs_info, -EUCLEAN,
- 				"unexpected superblock corruption detected");
- 			return -EUCLEAN;
+ 			btrfs_abort_transaction(trans, ret);
+ 			btrfs_err(fs_info,
+ 			  "unexpected superblock corruption before writing it");
+ 			return ret;
  		}
 =20
  		ret =3D write_dev_supers(dev, sb, max_mirrors);
- 		if (ret)
+ 		if (unlikely(ret))
  			total_errors++;
  	}
  	if (unlikely(total_errors > max_errors)) {
@@@ -4130,29 -4112,27 +4112,27 @@@
  		mutex_unlock(&fs_info->fs_devices->device_list_mutex);
 =20
  		/* FUA is masked off if unsupported and can't be the reason */
- 		btrfs_handle_fs_error(fs_info, -EIO,
- 				      "%d errors while writing supers",
- 				      total_errors);
+ 		btrfs_abort_transaction(trans, -EIO);
+ 		btrfs_err(fs_info, "%d errors while writing supers", total_errors);
  		return -EIO;
  	}
 =20
  	total_errors =3D 0;
  	list_for_each_entry(dev, head, dev_list) {
- 		if (!dev->bdev)
+ 		if (unlikely(!dev->bdev))
  			continue;
  		if (!test_bit(BTRFS_DEV_STATE_IN_FS_METADATA, &dev->dev_state) ||
  		    !test_bit(BTRFS_DEV_STATE_WRITEABLE, &dev->dev_state))
  			continue;
 =20
  		ret =3D wait_dev_supers(dev, max_mirrors);
- 		if (ret)
+ 		if (unlikely(ret))
  			total_errors++;
  	}
  	mutex_unlock(&fs_info->fs_devices->device_list_mutex);
  	if (unlikely(total_errors > max_errors)) {
- 		btrfs_handle_fs_error(fs_info, -EIO,
- 				      "%d errors while writing supers",
- 				      total_errors);
+ 		btrfs_abort_transaction(trans, -EIO);
+ 		btrfs_err(fs_info, "%d errors while writing supers", total_errors);
  		return -EIO;
  	}
  	return 0;

--my7knnTzq3QvUCrW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5W6YACgkQJNaLcl1U
h9B8Ggf9Gx9GDqSPJ9Rlf1QPnkLA79kFzK5lsqEFqk7/7qpoEvMWb2wDjXEtDQSO
egPEArbx+LdVxM/YIIDfkMZTg9NIKt8mIfdV3GCQv3QAltddNAK0sy3+4Ep2G3uL
tMxhCcJ2cUB0CPqSgn2F9HDj6K0kilpSFQnVhHq/07zT9kERFo08M6/c4dw8/P4N
TEuvl0bXvUQ8pT1loufyj8K8pUkKYMOwVzBl2oCsQAyEN3a7Zt6jaUEgm9RynPC1
qaoAHZtT9UnWqYW3+llJrrNxG/ujewzKZDSBjJ1T+8IKben9UvAsyZ/tThNJTiS0
G5azF63K+oRloS6bjP8a/5PxQkwhOw==
=l/z+
-----END PGP SIGNATURE-----

--my7knnTzq3QvUCrW--
