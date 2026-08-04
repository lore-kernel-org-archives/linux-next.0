Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B9D4746B0;
	Tue,  4 Aug 2026 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860931; cv=none; b=Ormi5L9R93LRYE3z3QFR64l/DlbvT16AWt7iV/uyDnlcEl1d0e5Y/LqAczYgj2aGHacFl3AEFMn/7Qgr0dLV18jV3g+e79y91iDXoQ8+nwlAOdTw7ymuSpOzrLpJh72KH7ePOljG9+B5JeHBi3njxvx6eaw1OkeGCirSRr+ET2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860931; c=relaxed/simple;
	bh=yXern/VfzfeGAKXBXdG3ePFExDjCrhHZZZShkALw1P4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7kZJmHKDfylj5jI8MIqq6386E7ZMN8m/QEhn1s1GJYSsFbHIxc2kGoDWVNJ7NxYAx1w9tampk1gRcJeQkoVOqujZW4EziK5b2Xo5Ew0azBSOh1O3o0amqi2+qcfkmVz9HIksHRuRu12C+YSX88/6lPnwNU5sqN/b4G3GXU1F9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaAwcAg0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaAwcAg0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C871F000E9;
	Tue,  4 Aug 2026 16:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860929;
	bh=BCDVFfxtNvNyVTCxgR3kjDZMxk+XmUJgrWHKp9Sbs3k=;
	h=Date:From:To:Cc:Subject;
	b=KaAwcAg02ACa3ejIS9bKDksR8kVUkGI9UTdRyqv22W/tFgRwND1uAWgnMCZIeETRf
	 IKGc11eTyy+0ihtYdfNPokWtj0R9HXyxF/bKDOYv9l5CD+7O66whJCyQg1ALuYjzkc
	 TiTfpdbzFKCHHaKqtYGYAUbmm24HU7/lOhLI24ty6CHxEmz8BTgY6Q80thVkqtI3Uv
	 jtOl2hAuOGmEo0qj5Z2Ejed8ZuK+f/nmkPgDJ0NunAqfr4dIYUQGCSwu/vEJsL6+Zw
	 dELAYKOMOh3dMKPCIEG7xPaKl33SSmGEK/GsZtDNg6MZim/kMSLGZkZdSH5bRbHklJ
	 8ZToufNm800pQ==
Date: Tue, 4 Aug 2026 17:28:45 +0100
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: Boris Burkov <boris@bur.io>, David Sterba <dsterba@suse.com>,
	Filipe Manana <fdmanana@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the btrfs tree with the btrfs-fixes tree
Message-ID: <anITPdyvZNNulN1J@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YMh7CvcQ49pyAh8B"
Content-Disposition: inline


--YMh7CvcQ49pyAh8B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/disk-io.c

between commit:

  ae2567b11c3df ("btrfs: flush the fixup workers during close_ctree")

=66rom the btrfs-fixes tree and commits:

  ed2bf9cdb72aa ("btrfs: flush the fixup workers during close_ctree")
  597fed17a1f01 ("btrfs: fix pending delayed iputs when using autodefrag")

=66rom the btrfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/btrfs/disk-io.c
index 2f1666d9544e1,819727460bcf4..0000000000000
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@@ -271,14 -271,15 +271,15 @@@ int btree_csum_one_bio(struct btrfs_bi
  		return -EIO;
 =20
  	/*
- 	 * If an extent_buffer is marked as EXTENT_BUFFER_ZONED_ZEROOUT, don't
- 	 * checksum it but zero-out its content. This is done to preserve
- 	 * ordering of I/O without unnecessarily writing out data.
+ 	 * An extent_buffer marked EXTENT_BUFFER_ZONED_ZEROOUT is written out as
+ 	 * zeros to preserve ordering of I/O without persisting the now
+ 	 * unnecessary block. The bio is fed from the shared zero page (see
+ 	 * write_one_eb()), so there is nothing to checksum here. Crucially, the
+ 	 * buffer's own content is left intact: it may still be referenced, e.g.
+ 	 * btrfs_free_tree_block() reads its header to add a delayed reference.
  	 */
- 	if (test_bit(EXTENT_BUFFER_ZONED_ZEROOUT, &eb->bflags)) {
- 		memzero_extent_buffer(eb, 0, eb->len);
+ 	if (test_bit(EXTENT_BUFFER_ZONED_ZEROOUT, &eb->bflags))
  		return 0;
- 	}
 =20
  	if (WARN_ON_ONCE(found_start !=3D eb->start))
  		return -EIO;
@@@ -590,12 -591,13 +591,13 @@@ static const struct address_space_opera
 =20
  struct extent_buffer *btrfs_find_create_tree_block(
  						struct btrfs_fs_info *fs_info,
+ 						struct btrfs_eb_prealloc *pa,
  						u64 bytenr, u64 owner_root,
  						int level)
  {
  	if (btrfs_is_testing(fs_info))
  		return alloc_test_extent_buffer(fs_info, bytenr);
- 	return alloc_extent_buffer(fs_info, bytenr, owner_root, level);
+ 	return alloc_extent_buffer(fs_info, pa, bytenr, owner_root, level);
  }
 =20
  /*
@@@ -608,12 -610,13 +610,13 @@@
  struct extent_buffer *read_tree_block(struct btrfs_fs_info *fs_info, u64 =
bytenr,
  				      struct btrfs_tree_parent_check *check)
  {
+ 	struct btrfs_eb_prealloc pa =3D { 0 };
  	struct extent_buffer *buf =3D NULL;
  	int ret;
 =20
  	ASSERT(check);
 =20
- 	buf =3D btrfs_find_create_tree_block(fs_info, bytenr, check->owner_root,
+ 	buf =3D btrfs_find_create_tree_block(fs_info, &pa, bytenr, check->owner_=
root,
  					   check->level);
  	if (IS_ERR(buf))
  		return buf;
@@@ -666,10 -669,7 +669,7 @@@ static struct btrfs_root *btrfs_alloc_r
  	init_waitqueue_head(&root->log_commit_wait[1]);
  	INIT_LIST_HEAD(&root->log_ctxs[0]);
  	INIT_LIST_HEAD(&root->log_ctxs[1]);
- 	atomic_set(&root->log_commit[0], 0);
- 	atomic_set(&root->log_commit[1], 0);
  	atomic_set(&root->log_writers, 0);
- 	atomic_set(&root->log_batch, 0);
  	refcount_set(&root->refs, 1);
  	atomic_set(&root->snapshot_force_cow, 0);
  	atomic_set(&root->nr_swapfiles, 0);
@@@ -2052,7 -2052,7 +2052,7 @@@ static int btrfs_replay_log(struct btrf
  	if (IS_ERR(log_tree_root->node)) {
  		ret =3D PTR_ERR(log_tree_root->node);
  		log_tree_root->node =3D NULL;
- 		btrfs_err(fs_info, "failed to read log tree with error: %d", ret);
+ 		btrfs_err(fs_info, "failed to read log tree with error: %pe", ERR_PTR(r=
et));
  		btrfs_put_root(log_tree_root);
  		return ret;
  	}
@@@ -2062,7 -2062,7 +2062,7 @@@
  	btrfs_put_root(log_tree_root);
  	if (unlikely(ret)) {
  		ASSERT(BTRFS_FS_ERROR(fs_info) !=3D 0);
- 		btrfs_err(fs_info, "failed to recover log trees with error: %d", ret);
+ 		btrfs_err(fs_info, "failed to recover log trees with error: %pe", ERR_P=
TR(ret));
  		return ret;
  	}
 =20
@@@ -2303,8 -2303,8 +2303,8 @@@ static int btrfs_read_roots(struct btrf
 =20
  	return 0;
  out:
- 	btrfs_warn(fs_info, "failed to read root (objectid=3D%llu): %d",
- 		   location.objectid, ret);
+ 	btrfs_warn(fs_info, "failed to read root (objectid=3D%llu): %pe",
+ 		   location.objectid, ERR_PTR(ret));
  	return ret;
  }
 =20
@@@ -2395,8 -2395,8 +2395,8 @@@ short_read
  int btrfs_validate_super(const struct btrfs_fs_info *fs_info,
  			 const struct btrfs_super_block *sb, int mirror_num)
  {
- 	u64 nodesize =3D btrfs_super_nodesize(sb);
- 	u64 sectorsize =3D btrfs_super_sectorsize(sb);
+ 	const u32 nodesize =3D btrfs_super_nodesize(sb);
+ 	const u32 sectorsize =3D btrfs_super_sectorsize(sb);
  	int ret =3D 0;
  	const bool ignore_flags =3D btrfs_test_opt(fs_info, IGNORESUPERFLAGS);
 =20
@@@ -2438,24 -2438,24 +2438,24 @@@
  	 */
  	if (unlikely(!is_power_of_2(sectorsize) || sectorsize < BTRFS_MIN_BLOCKS=
IZE ||
  		     sectorsize > BTRFS_MAX_METADATA_BLOCKSIZE)) {
- 		btrfs_err(fs_info, "invalid sectorsize %llu", sectorsize);
+ 		btrfs_err(fs_info, "invalid sectorsize %u", sectorsize);
  		ret =3D -EINVAL;
  	}
 =20
  	if (unlikely(!btrfs_supported_blocksize(sectorsize))) {
  		btrfs_err(fs_info,
- 			"sectorsize %llu not yet supported for page size %lu",
+ 			"sectorsize %u not yet supported for page size %lu",
  			sectorsize, PAGE_SIZE);
  		ret =3D -EINVAL;
  	}
 =20
  	if (unlikely(!is_power_of_2(nodesize) || nodesize < sectorsize ||
  		     nodesize > BTRFS_MAX_METADATA_BLOCKSIZE)) {
- 		btrfs_err(fs_info, "invalid nodesize %llu", nodesize);
+ 		btrfs_err(fs_info, "invalid nodesize %u", nodesize);
  		ret =3D -EINVAL;
  	}
  	if (unlikely(nodesize !=3D le32_to_cpu(sb->__unused_leafsize))) {
- 		btrfs_err(fs_info, "invalid leafsize %u, should be %llu",
+ 		btrfs_err(fs_info, "invalid leafsize %u, should be %u",
  			  le32_to_cpu(sb->__unused_leafsize), nodesize);
  		ret =3D -EINVAL;
  	}
@@@ -2905,7 -2905,6 +2905,6 @@@ void btrfs_init_fs_info(struct btrfs_fs
  	fs_info->nodesize =3D 4096;
  	fs_info->sectorsize =3D 4096;
  	fs_info->sectorsize_bits =3D ilog2(4096);
- 	fs_info->stripesize =3D 4096;
 =20
  	/* Default compress algorithm when user does -o compress */
  	fs_info->compress_type =3D BTRFS_COMPRESS_ZLIB;
@@@ -2979,8 -2978,8 +2978,8 @@@ static int btrfs_uuid_rescan_kthread(vo
  	ret =3D btrfs_uuid_tree_iterate(fs_info);
  	if (ret < 0) {
  		if (ret !=3D -EINTR)
- 			btrfs_warn(fs_info, "iterating uuid_tree failed %d",
- 				   ret);
+ 			btrfs_warn(fs_info, "iterating uuid_tree failed %pe",
+ 				   ERR_PTR(ret));
  		up(&fs_info->uuid_tree_rescan_sem);
  		return ret;
  	}
@@@ -3083,7 -3082,7 +3082,7 @@@ int btrfs_start_pre_rw_mount(struct btr
  		ret =3D btrfs_rebuild_free_space_tree(fs_info);
  		if (ret) {
  			btrfs_warn(fs_info,
- 				   "failed to rebuild free space tree: %d", ret);
+ 				   "failed to rebuild free space tree: %pe", ERR_PTR(ret));
  			return ret;
  		}
  	}
@@@ -3094,7 -3093,7 +3093,7 @@@
  		ret =3D btrfs_delete_free_space_tree(fs_info);
  		if (ret) {
  			btrfs_warn(fs_info,
- 				   "failed to disable free space tree: %d", ret);
+ 				   "failed to disable free space tree: %pe", ERR_PTR(ret));
  			return ret;
  		}
  	}
@@@ -3105,7 -3104,8 +3104,8 @@@
  	 */
  	ret =3D btrfs_delete_orphan_free_space_entries(fs_info);
  	if (ret < 0) {
- 		btrfs_err(fs_info, "failed to delete orphan free space tree entries: %d=
", ret);
+ 		btrfs_err(fs_info, "failed to delete orphan free space tree entries: %p=
e",
+ 			  ERR_PTR(ret));
  		return ret;
  	}
  	/*
@@@ -3139,7 -3139,7 +3139,7 @@@
  	ret =3D btrfs_recover_relocation(fs_info);
  	mutex_unlock(&fs_info->cleaner_mutex);
  	if (ret < 0) {
- 		btrfs_warn(fs_info, "failed to recover relocation: %d", ret);
+ 		btrfs_warn(fs_info, "failed to recover relocation: %pe", ERR_PTR(ret));
  		return ret;
  	}
 =20
@@@ -3149,7 -3149,7 +3149,7 @@@
  		ret =3D btrfs_create_free_space_tree(fs_info);
  		if (ret) {
  			btrfs_warn(fs_info,
- 				"failed to create free space tree: %d", ret);
+ 				"failed to create free space tree: %pe", ERR_PTR(ret));
  			return ret;
  		}
  	}
@@@ -3177,7 -3177,7 +3177,7 @@@
  		ret =3D btrfs_create_uuid_tree(fs_info);
  		if (ret) {
  			btrfs_warn(fs_info,
- 				   "failed to create the UUID tree %d", ret);
+ 				   "failed to create the UUID tree %pe", ERR_PTR(ret));
  			return ret;
  		}
  	}
@@@ -3314,6 -3314,8 +3314,8 @@@ static void invalidate_and_check_btree_
  	 */
  	rcu_read_lock();
  	xa_for_each(&fs_info->buffer_tree, index, eb) {
+ 		unsigned int refs;
+=20
  		/* Increase the ref so that the eb won't disappear. */
  		if (!refcount_inc_not_zero(&eb->refs))
  			continue;
@@@ -3323,17 -3325,27 +3325,27 @@@
  		if (test_bit(EXTENT_BUFFER_READING, &eb->bflags))
  			wait_on_bit_io(&eb->bflags, EXTENT_BUFFER_READING,
  				       TASK_UNINTERRUPTIBLE);
+ 		/*
+ 		 * We hold the spinlock to make sure above
+ 		 * EXTENT_BUFFER_READING flag is cleared with the held
+ 		 * ref dropped.
+ 		 * Or we can hit a race window and lead to false alerts.
+ 		 */
+ 		spin_lock(&eb->refs_lock);
+ 		refs =3D refcount_read(&eb->refs);
+ 		spin_unlock(&eb->refs_lock);
+=20
  		/*
  		 * The refs threshold is 2, one held by us at the beginning
  		 * of the loop, one for the ownership in the buffer tree.
  		 */
- 		if (unlikely(refcount_read(&eb->refs) > 2 || extent_buffer_under_io(eb)=
)) {
+ 		if (unlikely(refs > 2 || extent_buffer_under_io(eb))) {
  			WARN_ON_ONCE(IS_ENABLED(CONFIG_BTRFS_DEBUG));
  			btrfs_warn(fs_info,
  			"unable to release extent buffer %llu owner %llu gen %llu refs %u flag=
s 0x%lx",
  				   eb->start, btrfs_header_owner(eb),
  				   btrfs_header_generation(eb),
- 				   refcount_read(&eb->refs), eb->bflags);
+ 				   refs, eb->bflags);
  		}
  		free_extent_buffer(eb);
  		rcu_read_lock();
@@@ -3355,7 -3367,6 +3367,6 @@@ int __cold open_ctree(struct super_bloc
  {
  	u32 sectorsize;
  	u32 nodesize;
- 	u32 stripesize;
  	u64 generation;
  	u16 csum_type;
  	struct btrfs_super_block *disk_super;
@@@ -3464,7 -3475,6 +3475,6 @@@
  	/* Set up fs_info before parsing mount options */
  	nodesize =3D btrfs_super_nodesize(disk_super);
  	sectorsize =3D btrfs_super_sectorsize(disk_super);
- 	stripesize =3D sectorsize;
  	fs_info->dirty_metadata_batch =3D nodesize * (1 + ilog2(nr_cpu_ids));
  	fs_info->delalloc_batch =3D sectorsize * 512 * (1 + ilog2(nr_cpu_ids));
 =20
@@@ -3483,7 -3493,6 +3493,6 @@@
  	else
  		fs_info->block_max_order =3D calc_block_max_order(fs_info->sectorsize_b=
its);
  	fs_info->csums_per_leaf =3D BTRFS_MAX_ITEM_SIZE(fs_info) / fs_info->csum=
_size;
- 	fs_info->stripesize =3D stripesize;
  	fs_info->fs_devices->fs_info =3D fs_info;
 =20
  	if (fs_info->sectorsize > PAGE_SIZE)
@@@ -3549,7 -3558,7 +3558,7 @@@
  	ret =3D btrfs_read_sys_array(fs_info);
  	mutex_unlock(&fs_info->chunk_mutex);
  	if (ret) {
- 		btrfs_err(fs_info, "failed to read the system array: %d", ret);
+ 		btrfs_err(fs_info, "failed to read the system array: %pe", ERR_PTR(ret)=
);
  		goto fail_sb_buffer;
  	}
 =20
@@@ -3568,7 -3577,7 +3577,7 @@@
 =20
  	ret =3D btrfs_read_chunk_tree(fs_info);
  	if (ret) {
- 		btrfs_err(fs_info, "failed to read chunk tree: %d", ret);
+ 		btrfs_err(fs_info, "failed to read chunk tree: %pe", ERR_PTR(ret));
  		goto fail_tree_roots;
  	}
 =20
@@@ -3598,7 -3607,7 +3607,7 @@@
  	ret =3D btrfs_get_dev_zone_info_all_devices(fs_info);
  	if (ret) {
  		btrfs_err(fs_info,
- 			  "zoned: failed to read device zone info: %d", ret);
+ 			  "zoned: failed to read device zone info: %pe", ERR_PTR(ret));
  		goto fail_block_groups;
  	}
 =20
@@@ -3621,72 -3630,73 +3630,73 @@@
  	ret =3D btrfs_verify_dev_extents(fs_info);
  	if (ret) {
  		btrfs_err(fs_info,
- 			  "failed to verify dev extents against chunks: %d",
- 			  ret);
+ 			  "failed to verify dev extents against chunks: %pe",
+ 			  ERR_PTR(ret));
  		goto fail_block_groups;
  	}
  	ret =3D btrfs_recover_balance(fs_info);
  	if (ret) {
- 		btrfs_err(fs_info, "failed to recover balance: %d", ret);
+ 		btrfs_err(fs_info, "failed to recover balance: %pe", ERR_PTR(ret));
  		goto fail_block_groups;
  	}
 =20
  	ret =3D btrfs_init_dev_stats(fs_info);
  	if (ret) {
- 		btrfs_err(fs_info, "failed to init dev_stats: %d", ret);
+ 		btrfs_err(fs_info, "failed to init dev_stats: %pe", ERR_PTR(ret));
  		goto fail_block_groups;
  	}
 =20
  	ret =3D btrfs_init_dev_replace(fs_info);
  	if (ret) {
- 		btrfs_err(fs_info, "failed to init dev_replace: %d", ret);
+ 		btrfs_err(fs_info, "failed to init dev_replace: %pe", ERR_PTR(ret));
  		goto fail_block_groups;
  	}
 =20
  	ret =3D btrfs_check_zoned_mode(fs_info);
  	if (ret) {
- 		btrfs_err(fs_info, "failed to initialize zoned mode: %d",
- 			  ret);
+ 		btrfs_err(fs_info, "failed to initialize zoned mode: %pe",
+ 			  ERR_PTR(ret));
  		goto fail_block_groups;
  	}
 =20
  	ret =3D btrfs_sysfs_add_fsid(fs_devices);
  	if (ret) {
- 		btrfs_err(fs_info, "failed to init sysfs fsid interface: %d",
- 				ret);
+ 		btrfs_err(fs_info, "failed to init sysfs fsid interface: %pe",
+ 			  ERR_PTR(ret));
  		goto fail_block_groups;
  	}
 =20
  	ret =3D btrfs_sysfs_add_mounted(fs_info);
  	if (ret) {
- 		btrfs_err(fs_info, "failed to init sysfs interface: %d", ret);
+ 		btrfs_err(fs_info, "failed to init sysfs interface: %pe", ERR_PTR(ret));
  		goto fail_fsdev_sysfs;
  	}
 =20
  	ret =3D btrfs_init_space_info(fs_info);
  	if (ret) {
- 		btrfs_err(fs_info, "failed to initialize space info: %d", ret);
+ 		btrfs_err(fs_info, "failed to initialize space info: %pe", ERR_PTR(ret)=
);
  		goto fail_sysfs;
  	}
 =20
  	ret =3D btrfs_read_block_groups(fs_info);
  	if (ret) {
- 		btrfs_err(fs_info, "failed to read block groups: %d", ret);
+ 		btrfs_err(fs_info, "failed to read block groups: %pe", ERR_PTR(ret));
  		goto fail_sysfs;
  	}
 =20
  	if (btrfs_fs_incompat(fs_info, REMAP_TREE)) {
  		ret =3D btrfs_populate_fully_remapped_bgs_list(fs_info);
  		if (ret) {
- 			btrfs_err(fs_info, "failed to populate fully_remapped_bgs list: %d", r=
et);
+ 			btrfs_err(fs_info, "failed to populate fully_remapped_bgs list: %pe",
+ 				  ERR_PTR(ret));
  			goto fail_sysfs;
  		}
  	}
 =20
  	ret =3D btrfs_init_writeback_bio_size(fs_info);
  	if (ret) {
- 		btrfs_err(fs_info, "failed to get optimum writeback size: %d",
- 			  ret);
+ 		btrfs_err(fs_info, "failed to get optimum writeback size: %pe",
+ 			  ERR_PTR(ret));
  		goto fail_sysfs;
  	}
 =20
@@@ -3742,7 -3752,7 +3752,7 @@@
  	fs_info->fs_root =3D btrfs_get_fs_root(fs_info, BTRFS_FS_TREE_OBJECTID, =
true);
  	if (IS_ERR(fs_info->fs_root)) {
  		ret =3D PTR_ERR(fs_info->fs_root);
- 		btrfs_err(fs_info, "failed to read fs tree: %d", ret);
+ 		btrfs_err(fs_info, "failed to read fs tree: %pe", ERR_PTR(ret));
  		fs_info->fs_root =3D NULL;
  		goto fail_qgroup;
  	}
@@@ -3763,7 -3773,7 +3773,7 @@@
  		btrfs_info(fs_info, "checking UUID tree");
  		ret =3D btrfs_check_uuid_tree(fs_info);
  		if (ret) {
- 			btrfs_err(fs_info, "failed to check the UUID tree: %d", ret);
+ 			btrfs_err(fs_info, "failed to check the UUID tree: %pe", ERR_PTR(ret));
  			close_ctree(fs_info);
  			return ret;
  		}
@@@ -3879,8 -3889,8 +3889,8 @@@ static int write_dev_supers(struct btrf
  			continue;
  		} else if (ret < 0) {
  			btrfs_err(device->fs_info,
- 			  "couldn't get super block location for mirror %d error %d",
- 			  i, ret);
+ 			  "couldn't get super block location for mirror %d error %pe",
+ 			  i, ERR_PTR(ret));
  			atomic_inc(&device->sb_write_errors);
  			continue;
  		}
@@@ -3898,8 -3908,8 +3908,8 @@@
  					    GFP_NOFS);
  		if (IS_ERR(folio)) {
  			btrfs_err(device->fs_info,
- 			  "couldn't get super block page for bytenr %llu error %ld",
- 			  bytenr, PTR_ERR(folio));
+ 			  "couldn't get super block page for bytenr %llu error %pe",
+ 			  bytenr, folio);
  			atomic_inc(&device->sb_write_errors);
  			continue;
  		}
@@@ -4381,6 -4391,21 +4391,21 @@@ void __cold close_ctree(struct btrfs_fs
  	 */
  	flush_workqueue(fs_info->fixup_workers);
 =20
+ 	/*
+ 	 * After we entered close_ctree() autodefrag could be running and before
+ 	 * we parked the cleaner kthread, it dirtied folios of some inode.
+ 	 * We don't want to leave any delalloc here, it may be flushed any time
+ 	 * after this point and result in ordered extents that create delayed
+ 	 * iputs after flushed the ordered extent queues further below, run
+ 	 * delayed iputs and set BTRFS_FS_STATE_NO_DELAYED_IPUT. If we are
+ 	 * mounted with flushoncommit, then btrfs_commit_super() called below
+ 	 * will flush delalloc and wait for ordered extents but we end up
+ 	 * getting delayed iputs than are never run. So flush delalloc and wait
+ 	 * for ordered extents.
+ 	 */
+ 	btrfs_start_delalloc_roots(fs_info, LONG_MAX, false);
+ 	btrfs_wait_ordered_roots(fs_info, U64_MAX, NULL);
+=20
  	/*
  	 * Handle the error fs first, as it will flush and wait for all ordered
  	 * extents.  This will generate delayed iputs, thus we want to handle
@@@ -4511,7 -4536,7 +4536,7 @@@
  		if (!btrfs_is_shutdown(fs_info)) {
  			ret =3D btrfs_commit_super(fs_info);
  			if (ret)
- 				btrfs_err(fs_info, "commit super block returned %d", ret);
+ 				btrfs_err(fs_info, "commit super block returned %pe", ERR_PTR(ret));
  		}
  	}
 =20
@@@ -4550,6 -4575,13 +4575,13 @@@
  	free_root_pointers(fs_info, true);
  	btrfs_free_fs_roots(fs_info);
 =20
+ 	/*
+ 	 * Drop metadata left stranded ahead of a zone write pointer while the
+ 	 * endio workqueues are still up, so the final iput() of the btree inode
+ 	 * below does not hang submitting a write that can no longer complete.
+ 	 */
+ 	btrfs_zoned_release_dirty_metadata(fs_info);
+=20
  	/*
  	 * We must make sure there is not any read request to
  	 * submit after we stop all workers.
@@@ -4998,6 -5030,7 +5030,7 @@@ static int btrfs_cleanup_transaction(st
  	btrfs_assert_delayed_root_empty(fs_info);
  	btrfs_destroy_all_delalloc_inodes(fs_info);
  	btrfs_drop_all_logs(fs_info);
+ 	btrfs_zoned_release_dirty_metadata(fs_info);
  	btrfs_free_all_qgroup_pertrans(fs_info);
  	mutex_unlock(&fs_info->transaction_kthread_mutex);
 =20

--YMh7CvcQ49pyAh8B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyEzwACgkQJNaLcl1U
h9DpOQf/XlSB6JFi/Z8w0U/kOYCLSw86oO+shVaiwjORFT4Wj1Dk9TSkDdUOz3QF
H1ZYIwiPssmJf4ptwmypcOI8bcKtFA0+LBSIVK4Kn3CTM2odb2CdCcoWrj4+Ra9T
xeARxygXM3oQAe/o0f8A80/skBbPBtJjA3E8daYry2AhjsD9p7pen7ZN5YwTbO3e
BhQX4BXySe4AzDskoaixZLykEwEMy5owZvWJh0+HUDlXAd57FMXZETCl2fr30DZd
IDm2ClcVME2ixNAlOZSGoGODLpsTxVtqq80kFomVPhT0q+YXwOWFfmHC0cgn7xDQ
3gi4YMtP4WTf7Ko8VjeFog4Vr1Krng==
=TB8b
-----END PGP SIGNATURE-----

--YMh7CvcQ49pyAh8B--
