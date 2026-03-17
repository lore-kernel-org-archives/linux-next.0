Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437AE3290D2;
	Tue, 17 Mar 2026 13:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755318; cv=none; b=jnyuxndB5kB1Lnk2ffMCkuesj2UBTdA7yHrgJyJ3HsCNQXpv2hmo6LvOSoD0rH1Lc6KM7hQZYdI+aMdO6cSuspYmMjzUgKv6Sm9GX8C3hh3ajHC45HYsiJ2Kjp2zHkeU/oMqPe/Kio1pIVX2hA7JfSB8LlTv94lmj90Ci0TuEP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755318; c=relaxed/simple;
	bh=AO3AaOae+8CFTegd04lIu0wBmhJNXHZByfw0xHDm3To=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H5HfNkxtuynKWTwYmQKb9LatxMcfoHdDNysd/f46S4pfDDuYsaOVroyEzlpfdxAraePhfnw4sXbzPs4ljFFY3O0QqQ3oTdPc6x/4XeDzzxjUGFsYBIkT+rqrzjgGzByQ6ryT84MMPC8T6IpUJRHhvRIrSc/kdwaux1ST5KzjxOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJqUxgl3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJqUxgl3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0C4C4CEF7;
	Tue, 17 Mar 2026 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773755317;
	bh=AO3AaOae+8CFTegd04lIu0wBmhJNXHZByfw0xHDm3To=;
	h=Date:From:To:Cc:Subject:From;
	b=pJqUxgl30TpQMqNi9bYa/xS7GOm7KXq7d2Az4t+aW0/dnLw+gTxlsEa6JpkyR/Ky7
	 LvYdMpkIpmJh+FXL3Gcj5Pgw6I2xLVPYdl7jvoUG6QaFq3IFX0hzk1UF5FbjSWXTm8
	 ypXrFoWTTZRzeamC/9sv4YaPK1Eism5CgNZSRweQm13VXhsRtZPFFBxBBDMD513Ew7
	 LJveHY2HSxGB41mscD3KZdSFlC1NIAj9/Es5S6WYitIRe6Hvezvcb0ypUY61PMx0ox
	 pE3ZIaHHd6ezdt/mXyiTcbmV3R4uzrt1ykvsIsnX0XbpN9u6Fm1lHjPa9HM+MRIjIH
	 wAF756wq/3eIw==
Date: Tue, 17 Mar 2026 13:48:33 +0000
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Filipe Manana <fdmanana@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Qu Wenruo <wqu@suse.com>
Subject: linux-next: manual merge of the btrfs tree with the btrfs-fixes tree
Message-ID: <ablbsQZEOkzcDrHC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LQEHhWml4Ga9Kg08"
Content-Disposition: inline


--LQEHhWml4Ga9Kg08
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/inode.c

between commit:

  2b4cb4e58f346 ("btrfs: check for NULL root after calls to btrfs_csum_root=
()")

=66rom the btrfs-fixes tree and commits:

  95c2b73d28d71 ("btrfs: check for NULL root after calls to btrfs_csum_root=
()")
  0d0b5f693bf44 ("btrfs: make add_pending_csums() to take an ordered extent=
 as parameter")
  30525e90e1e86 ("btrfs: rename btrfs_csum_file_blocks() to btrfs_insert_da=
ta_csums()")

=66rom the btrfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/btrfs/inode.c
index f643a05208720,8d97a8ad3858b..0000000000000
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@@ -74,7 -74,6 +74,6 @@@
  #include "delayed-inode.h"
 =20
  #define COW_FILE_RANGE_KEEP_LOCKED	(1UL << 0)
- #define COW_FILE_RANGE_NO_INLINE	(1UL << 1)
 =20
  struct btrfs_iget_args {
  	u64 ino;
@@@ -424,7 -423,7 +423,7 @@@ static inline void btrfs_cleanup_ordere
  		folio_put(folio);
  	}
 =20
- 	return btrfs_mark_ordered_io_finished(inode, NULL, offset, bytes, false);
+ 	return btrfs_mark_ordered_io_finished(inode, offset, bytes, false);
  }
 =20
  static int btrfs_dirty_inode(struct btrfs_inode *inode);
@@@ -622,6 -621,10 +621,10 @@@ static bool can_cow_file_range_inline(s
   *
   * If being used directly, you must have already checked we're allowed to=
 cow
   * the range by getting true from can_cow_file_range_inline().
+  *
+  * Return 0 if the inlined extent is created successfully.
+  * Return <0 for critical error, and should be considered as an writeback=
 error.
+  * Return >0 if can not create an inlined extent (mostly due to lack of m=
eta space).
   */
  static noinline int __cow_file_range_inline(struct btrfs_inode *inode,
  					    u64 size, size_t compressed_size,
@@@ -703,55 -706,6 +706,6 @@@ out
  	return ret;
  }
 =20
- static noinline int cow_file_range_inline(struct btrfs_inode *inode,
- 					  struct folio *locked_folio,
- 					  u64 offset, u64 end,
- 					  size_t compressed_size,
- 					  int compress_type,
- 					  struct folio *compressed_folio,
- 					  bool update_i_size)
- {
- 	struct extent_state *cached =3D NULL;
- 	unsigned long clear_flags =3D EXTENT_DELALLOC | EXTENT_DELALLOC_NEW |
- 		EXTENT_DEFRAG | EXTENT_DO_ACCOUNTING | EXTENT_LOCKED;
- 	u64 size =3D min_t(u64, i_size_read(&inode->vfs_inode), end + 1);
- 	int ret;
-=20
- 	if (!can_cow_file_range_inline(inode, offset, size, compressed_size))
- 		return 1;
-=20
- 	btrfs_lock_extent(&inode->io_tree, offset, end, &cached);
- 	ret =3D __cow_file_range_inline(inode, size, compressed_size,
- 				      compress_type, compressed_folio,
- 				      update_i_size);
- 	if (ret > 0) {
- 		btrfs_unlock_extent(&inode->io_tree, offset, end, &cached);
- 		return ret;
- 	}
-=20
- 	/*
- 	 * In the successful case (ret =3D=3D 0 here), cow_file_range will retur=
n 1.
- 	 *
- 	 * Quite a bit further up the callstack in extent_writepage(), ret =3D=
=3D 1
- 	 * is treated as a short circuited success and does not unlock the folio,
- 	 * so we must do it here.
- 	 *
- 	 * In the failure case, the locked_folio does get unlocked by
- 	 * btrfs_folio_end_all_writers, which asserts that it is still locked
- 	 * at that point, so we must *not* unlock it here.
- 	 *
- 	 * The other two callsites in compress_file_range do not have a
- 	 * locked_folio, so they are not relevant to this logic.
- 	 */
- 	if (ret =3D=3D 0)
- 		locked_folio =3D NULL;
-=20
- 	extent_clear_unlock_delalloc(inode, offset, end, locked_folio, &cached,
- 				     clear_flags, PAGE_UNLOCK |
- 				     PAGE_START_WRITEBACK | PAGE_END_WRITEBACK);
- 	return ret;
- }
-=20
  struct async_extent {
  	u64 start;
  	u64 ram_size;
@@@ -797,7 -751,7 +751,7 @@@ static int add_async_extent(struct asyn
   * options, defragmentation, properties or heuristics.
   */
  static inline int inode_need_compress(struct btrfs_inode *inode, u64 star=
t,
- 				      u64 end)
+ 				      u64 end, bool check_inline)
  {
  	struct btrfs_fs_info *fs_info =3D inode->root->fs_info;
 =20
@@@ -811,8 -765,10 +765,10 @@@
  	 * do not even bother try compression, as there will be no space saving
  	 * and will always fallback to regular write later.
  	 */
- 	if (start !=3D 0 && end + 1 - start <=3D fs_info->sectorsize)
+ 	if (end + 1 - start <=3D fs_info->sectorsize &&
+ 	    (!check_inline || (start > 0 || end + 1 < inode->disk_i_size)))
  		return 0;
+=20
  	/* Defrag ioctl takes precedence over mount options and properties. */
  	if (inode->defrag_compress =3D=3D BTRFS_DEFRAG_DONT_COMPRESS)
  		return 0;
@@@ -890,28 -846,20 +846,20 @@@ static struct folio *compressed_bio_las
  	return page_folio(phys_to_page(paddr));
  }
 =20
- static void zero_last_folio(struct compressed_bio *cb)
- {
- 	struct bio *bio =3D &cb->bbio.bio;
- 	struct folio *last_folio =3D compressed_bio_last_folio(cb);
- 	const u32 bio_size =3D bio->bi_iter.bi_size;
- 	const u32 foffset =3D offset_in_folio(last_folio, bio_size);
-=20
- 	folio_zero_range(last_folio, foffset, folio_size(last_folio) - foffset);
- }
-=20
  static void round_up_last_block(struct compressed_bio *cb, u32 blocksize)
  {
  	struct bio *bio =3D &cb->bbio.bio;
  	struct folio *last_folio =3D compressed_bio_last_folio(cb);
  	const u32 bio_size =3D bio->bi_iter.bi_size;
  	const u32 foffset =3D offset_in_folio(last_folio, bio_size);
+ 	const u32 padding_len =3D round_up(foffset, blocksize) - foffset;
  	bool ret;
 =20
  	if (IS_ALIGNED(bio_size, blocksize))
  		return;
 =20
- 	ret =3D bio_add_folio(bio, last_folio, round_up(foffset, blocksize) - fo=
ffset, foffset);
+ 	folio_zero_range(last_folio, foffset, padding_len);
+ 	ret =3D bio_add_folio(bio, last_folio, padding_len, foffset);
  	/* The remaining part should be merged thus never fail. */
  	ASSERT(ret);
  }
@@@ -935,9 -883,7 +883,7 @@@ static void compress_file_range(struct=20
  		container_of(work, struct async_chunk, work);
  	struct btrfs_inode *inode =3D async_chunk->inode;
  	struct btrfs_fs_info *fs_info =3D inode->root->fs_info;
- 	struct address_space *mapping =3D inode->vfs_inode.i_mapping;
  	struct compressed_bio *cb =3D NULL;
- 	const u32 min_folio_size =3D btrfs_min_folio_size(fs_info);
  	u64 blocksize =3D fs_info->sectorsize;
  	u64 start =3D async_chunk->start;
  	u64 end =3D async_chunk->end;
@@@ -947,7 -893,6 +893,6 @@@
  	int ret =3D 0;
  	unsigned long total_compressed =3D 0;
  	unsigned long total_in =3D 0;
- 	unsigned int loff;
  	int compress_type =3D fs_info->compress_type;
  	int compress_level =3D fs_info->compress_level;
 =20
@@@ -1009,7 -954,7 +954,7 @@@ again
  	 * been flagged as NOCOMPRESS.  This flag can change at any time if we
  	 * discover bad compression ratios.
  	 */
- 	if (!inode_need_compress(inode, start, end))
+ 	if (!inode_need_compress(inode, start, end, false))
  		goto cleanup_and_bail_uncompressed;
 =20
  	if (0 < inode->defrag_compress && inode->defrag_compress < BTRFS_NR_COMP=
RESS_TYPES) {
@@@ -1030,43 -975,13 +975,13 @@@
  	total_compressed =3D cb->bbio.bio.bi_iter.bi_size;
  	total_in =3D cur_len;
 =20
- 	/*
- 	 * Zero the tail end of the last folio, as we might be sending it down
- 	 * to disk.
- 	 */
- 	loff =3D (total_compressed & (min_folio_size - 1));
- 	if (loff)
- 		zero_last_folio(cb);
-=20
- 	/*
- 	 * Try to create an inline extent.
- 	 *
- 	 * If we didn't compress the entire range, try to create an uncompressed
- 	 * inline extent, else a compressed one.
- 	 *
- 	 * Check cow_file_range() for why we don't even try to create inline
- 	 * extent for the subpage case.
- 	 */
- 	if (total_in < actual_end)
- 		ret =3D cow_file_range_inline(inode, NULL, start, end, 0,
- 					    BTRFS_COMPRESS_NONE, NULL, false);
- 	else
- 		ret =3D cow_file_range_inline(inode, NULL, start, end, total_compressed,
- 					    compress_type,
- 					    bio_first_folio_all(&cb->bbio.bio), false);
- 	if (ret <=3D 0) {
- 		cleanup_compressed_bio(cb);
- 		if (ret < 0)
- 			mapping_set_error(mapping, -EIO);
- 		return;
- 	}
-=20
  	/*
  	 * We aren't doing an inline extent. Round the compressed size up to a
  	 * block size boundary so the allocator does sane things.
  	 */
- 	total_compressed =3D ALIGN(total_compressed, blocksize);
  	round_up_last_block(cb, blocksize);
+ 	total_compressed =3D cb->bbio.bio.bi_iter.bi_size;
+ 	ASSERT(IS_ALIGNED(total_compressed, blocksize));
 =20
  	/*
  	 * One last check to make sure the compression is really a win, compare
@@@ -1437,11 -1352,6 +1352,6 @@@ free_reserved
   *
   * When this function fails, it unlocks all folios except @locked_folio.
   *
-  * When this function successfully creates an inline extent, it returns 1=
 and
-  * unlocks all folios including locked_folio and starts I/O on them.
-  * (In reality inline extents are limited to a single block, so locked_fo=
lio is
-  * the only folio handled anyway).
-  *
   * When this function succeed and creates a normal extent, the folio lock=
ing
   * status depends on the passed in flags:
   *
@@@ -1485,25 -1395,6 +1395,6 @@@ static noinline int cow_file_range(stru
  	ASSERT(num_bytes <=3D btrfs_super_total_bytes(fs_info->super_copy));
 =20
  	inode_should_defrag(inode, start, end, num_bytes, SZ_64K);
-=20
- 	if (!(flags & COW_FILE_RANGE_NO_INLINE)) {
- 		/* lets try to make an inline extent */
- 		ret =3D cow_file_range_inline(inode, locked_folio, start, end, 0,
- 					    BTRFS_COMPRESS_NONE, NULL, false);
- 		if (ret <=3D 0) {
- 			/*
- 			 * We succeeded, return 1 so the caller knows we're done
- 			 * with this page and already handled the IO.
- 			 *
- 			 * If there was an error then cow_file_range_inline() has
- 			 * already done the cleanup.
- 			 */
- 			if (ret =3D=3D 0)
- 				ret =3D 1;
- 			goto done;
- 		}
- 	}
-=20
  	alloc_hint =3D btrfs_get_extent_allocation_hint(inode, start, num_bytes);
 =20
  	/*
@@@ -1581,7 -1472,6 +1472,6 @@@
  	}
  	extent_clear_unlock_delalloc(inode, orig_start, end, locked_folio, &cach=
ed,
  				     EXTENT_LOCKED | EXTENT_DELALLOC, page_ops);
- done:
  	if (done_offset)
  		*done_offset =3D end;
  	return ret;
@@@ -1701,7 -1591,7 +1591,7 @@@ static bool run_delalloc_compressed(str
  	struct async_cow *ctx;
  	struct async_chunk *async_chunk;
  	unsigned long nr_pages;
- 	u64 num_chunks =3D DIV_ROUND_UP(end - start, SZ_512K);
+ 	u64 num_chunks =3D DIV_ROUND_UP(end - start, BTRFS_COMPRESSION_CHUNK_SIZ=
E);
  	int i;
  	unsigned nofs_flag;
  	const blk_opf_t write_flags =3D wbc_to_write_flags(wbc);
@@@ -1718,7 -1608,7 +1608,7 @@@
  	atomic_set(&ctx->num_chunks, num_chunks);
 =20
  	for (i =3D 0; i < num_chunks; i++) {
- 		u64 cur_end =3D min(end, start + SZ_512K - 1);
+ 		u64 cur_end =3D min(end, start + BTRFS_COMPRESSION_CHUNK_SIZE - 1);
 =20
  		/*
  		 * igrab is called higher up in the call chain, take only the
@@@ -1853,7 -1743,7 +1743,7 @@@ static int fallback_to_cow(struct btrfs
  	 */
  	btrfs_lock_extent(io_tree, start, end, &cached_state);
  	count =3D btrfs_count_range_bits(io_tree, &range_start, end, range_bytes,
- 				       EXTENT_NORESERVE, 0, NULL);
+ 				       EXTENT_NORESERVE, false, NULL);
  	if (count > 0 || is_space_ino || is_reloc_ino) {
  		u64 bytes =3D count;
  		struct btrfs_fs_info *fs_info =3D inode->root->fs_info;
@@@ -1884,7 -1774,7 +1774,7 @@@
  	 * a locked folio, which can race with writeback.
  	 */
  	ret =3D cow_file_range(inode, locked_folio, start, end, NULL,
- 			     COW_FILE_RANGE_NO_INLINE | COW_FILE_RANGE_KEEP_LOCKED);
+ 			     COW_FILE_RANGE_KEEP_LOCKED);
  	ASSERT(ret !=3D 1);
  	return ret;
  }
@@@ -1936,6 -1826,11 +1826,11 @@@ static int can_nocow_file_extent(struc
  	int ret =3D 0;
  	bool nowait =3D path->nowait;
 =20
+ 	/* If there are pending snapshots for this root, we must do COW. */
+ 	if (args->writeback_path && !is_freespace_inode &&
+ 	    atomic_read(&root->snapshot_force_cow))
+ 		goto out;
+=20
  	fi =3D btrfs_item_ptr(leaf, path->slots[0], struct btrfs_file_extent_ite=
m);
  	extent_type =3D btrfs_file_extent_type(leaf, fi);
 =20
@@@ -1997,11 -1892,6 +1892,6 @@@
  		path =3D NULL;
  	}
 =20
- 	/* If there are pending snapshots for this root, we must COW. */
- 	if (args->writeback_path && !is_freespace_inode &&
- 	    atomic_read(&root->snapshot_force_cow))
- 		goto out;
-=20
  	args->file_extent.num_bytes =3D min(args->end + 1, extent_end) - args->s=
tart;
  	args->file_extent.offset +=3D args->start - key->offset;
  	io_start =3D args->file_extent.disk_bytenr + args->file_extent.offset;
@@@ -2435,6 -2325,91 +2325,91 @@@ static bool should_nocow(struct btrfs_i
  	return false;
  }
 =20
+ /*
+  * Return 0 if an inlined extent is created successfully.
+  * Return <0 if critical error happened.
+  * Return >0 if an inline extent can not be created.
+  */
+ static int run_delalloc_inline(struct btrfs_inode *inode, struct folio *l=
ocked_folio)
+ {
+ 	struct btrfs_fs_info *fs_info =3D inode->root->fs_info;
+ 	struct compressed_bio *cb =3D NULL;
+ 	struct extent_state *cached =3D NULL;
+ 	const u64 i_size =3D i_size_read(&inode->vfs_inode);
+ 	const u32 blocksize =3D fs_info->sectorsize;
+ 	int compress_type =3D fs_info->compress_type;
+ 	int compress_level =3D fs_info->compress_level;
+ 	u32 compressed_size =3D 0;
+ 	int ret;
+=20
+ 	ASSERT(folio_pos(locked_folio) =3D=3D 0);
+=20
+ 	if (btrfs_inode_can_compress(inode) &&
+ 	    inode_need_compress(inode, 0, blocksize, true)) {
+ 		if (inode->defrag_compress > 0 &&
+ 		    inode->defrag_compress < BTRFS_NR_COMPRESS_TYPES) {
+ 			compress_type =3D inode->defrag_compress;
+ 			compress_level =3D inode->defrag_compress_level;
+ 		} else if (inode->prop_compress) {
+ 			compress_type =3D inode->prop_compress;
+ 		}
+ 		cb =3D btrfs_compress_bio(inode, 0, blocksize, compress_type, compress_=
level, 0);
+ 		if (IS_ERR(cb)) {
+ 			cb =3D NULL;
+ 			/* Just fall back to non-compressed case. */
+ 		} else {
+ 			compressed_size =3D cb->bbio.bio.bi_iter.bi_size;
+ 		}
+ 	}
+ 	if (!can_cow_file_range_inline(inode, 0, i_size, compressed_size)) {
+ 		if (cb)
+ 			cleanup_compressed_bio(cb);
+ 		return 1;
+ 	}
+=20
+ 	btrfs_lock_extent(&inode->io_tree, 0, blocksize - 1, &cached);
+ 	if (cb) {
+ 		ret =3D __cow_file_range_inline(inode, i_size, compressed_size, compres=
s_type,
+ 					      bio_first_folio_all(&cb->bbio.bio), false);
+ 		cleanup_compressed_bio(cb);
+ 		cb =3D NULL;
+ 	} else {
+ 		ret =3D __cow_file_range_inline(inode, i_size, 0, BTRFS_COMPRESS_NONE,
+ 					      NULL, false);
+ 	}
+ 	/*
+ 	 * We failed to insert inline extent due to lack of meta space.
+ 	 * Just unlock the extent io range and fallback to regular COW/NOCOW pat=
h.
+ 	 */
+ 	if (ret > 0) {
+ 		btrfs_unlock_extent(&inode->io_tree, 0, blocksize - 1, &cached);
+ 		return ret;
+ 	}
+=20
+ 	/*
+ 	 * In the successful case (ret =3D=3D 0 here), btrfs_run_delalloc_range()
+ 	 * will return 1.
+ 	 *
+ 	 * Quite a bit further up the callstack in extent_writepage(), ret =3D=
=3D 1
+ 	 * is treated as a short circuited success and does not unlock the folio,
+ 	 * so we must do it here.
+ 	 *
+ 	 * For failure case, the @locked_folio does get unlocked by
+ 	 * btrfs_folio_end_lock_bitmap(), so we must *not* unlock it here.
+ 	 *
+ 	 * So if ret =3D=3D 0, we let extent_clear_unlock_delalloc() to unlock t=
he
+ 	 * folio by passing NULL as @locked_folio.
+ 	 * Otherwise pass @locked_folio as usual.
+ 	 */
+ 	if (ret =3D=3D 0)
+ 		locked_folio =3D NULL;
+ 	extent_clear_unlock_delalloc(inode, 0, blocksize - 1, locked_folio, &cac=
hed,
+ 				     EXTENT_DELALLOC | EXTENT_DELALLOC_NEW | EXTENT_DEFRAG |
+ 				     EXTENT_DO_ACCOUNTING | EXTENT_LOCKED,
+ 				     PAGE_UNLOCK | PAGE_START_WRITEBACK | PAGE_END_WRITEBACK);
+ 	return ret;
+ }
+=20
  /*
   * Function to process delayed allocation (create CoW) for ranges which a=
re
   * being touched for the first time.
@@@ -2451,11 -2426,26 +2426,26 @@@ int btrfs_run_delalloc_range(struct btr
  	ASSERT(!(end <=3D folio_pos(locked_folio) ||
  		 start >=3D folio_next_pos(locked_folio)));
 =20
+ 	if (start =3D=3D 0 && end + 1 <=3D inode->root->fs_info->sectorsize &&
+ 	    end + 1 >=3D inode->disk_i_size) {
+ 		int ret;
+=20
+ 		ret =3D run_delalloc_inline(inode, locked_folio);
+ 		if (ret < 0)
+ 			return ret;
+ 		if (ret =3D=3D 0)
+ 			return 1;
+ 		/*
+ 		 * Continue regular handling if we can not create an
+ 		 * inlined extent.
+ 		 */
+ 	}
+=20
  	if (should_nocow(inode, start, end))
  		return run_delalloc_nocow(inode, locked_folio, start, end);
 =20
  	if (btrfs_inode_can_compress(inode) &&
- 	    inode_need_compress(inode, start, end) &&
+ 	    inode_need_compress(inode, start, end, false) &&
  	    run_delalloc_compressed(inode, locked_folio, start, end, wbc))
  		return 1;
 =20
@@@ -2745,17 -2735,19 +2735,19 @@@ void btrfs_clear_delalloc_extent(struc
  }
 =20
  /*
-  * given a list of ordered sums record them in the inode.  This happens
-  * at IO completion time based on sums calculated at bio submission time.
+  * Given an ordered extent and insert all its checksums into the csum tre=
e.
+  *
+  * This happens at IO completion time based on sums calculated at bio
+  * submission time.
   */
  static int add_pending_csums(struct btrfs_trans_handle *trans,
- 			     struct list_head *list)
+ 			     struct btrfs_ordered_extent *oe)
  {
  	struct btrfs_ordered_sum *sum;
  	struct btrfs_root *csum_root =3D NULL;
  	int ret;
 =20
- 	list_for_each_entry(sum, list, list) {
+ 	list_for_each_entry(sum, &oe->csum_list, list) {
  		if (!csum_root) {
  			csum_root =3D btrfs_csum_root(trans->fs_info,
  						    sum->logical);
@@@ -2767,7 -2759,7 +2759,7 @@@
  			}
  		}
  		trans->adding_csums =3D true;
- 		ret =3D btrfs_csum_file_blocks(trans, csum_root, sum);
+ 		ret =3D btrfs_insert_data_csums(trans, csum_root, sum);
  		trans->adding_csums =3D false;
  		if (ret)
  			return ret;
@@@ -2956,7 -2948,9 +2948,9 @@@ out_page
  		 * to reflect the errors and clean the page.
  		 */
  		mapping_set_error(folio->mapping, ret);
- 		btrfs_mark_ordered_io_finished(inode, folio, page_start,
+ 		btrfs_folio_clear_ordered(fs_info, folio, page_start,
+ 					  folio_size(folio));
+ 		btrfs_mark_ordered_io_finished(inode, page_start,
  					       folio_size(folio), !ret);
  		folio_clear_dirty_for_io(folio);
  	}
@@@ -3271,8 -3265,8 +3265,8 @@@ int btrfs_finish_one_ordered(struct btr
 =20
  	if (test_bit(BTRFS_ORDERED_NOCOW, &ordered_extent->flags)) {
  		/* Logic error */
- 		ASSERT(list_empty(&ordered_extent->list));
- 		if (unlikely(!list_empty(&ordered_extent->list))) {
+ 		ASSERT(list_empty(&ordered_extent->csum_list));
+ 		if (unlikely(!list_empty(&ordered_extent->csum_list))) {
  			ret =3D -EINVAL;
  			btrfs_abort_transaction(trans, ret);
  			goto out;
@@@ -3321,7 -3315,7 +3315,7 @@@
  		goto out;
  	}
 =20
- 	ret =3D add_pending_csums(trans, &ordered_extent->list);
+ 	ret =3D add_pending_csums(trans, ordered_extent);
  	if (unlikely(ret)) {
  		btrfs_abort_transaction(trans, ret);
  		goto out;
@@@ -3427,7 -3421,7 +3421,7 @@@ out
  	 * This needs to be done to make sure anybody waiting knows we are done
  	 * updating everything for this ordered extent.
  	 */
- 	btrfs_remove_ordered_extent(inode, ordered_extent);
+ 	btrfs_remove_ordered_extent(ordered_extent);
 =20
  	/* once for us */
  	btrfs_put_ordered_extent(ordered_extent);
@@@ -4697,7 -4691,7 +4691,7 @@@ static noinline int may_destroy_subvol(
  	dir_id =3D btrfs_super_root_dir(fs_info->super_copy);
  	di =3D btrfs_lookup_dir_item(NULL, fs_info->tree_root, path,
  				   dir_id, &name, 0);
- 	if (di && !IS_ERR(di)) {
+ 	if (!IS_ERR_OR_NULL(di)) {
  		btrfs_dir_item_key_to_cpu(path->nodes[0], di, &key);
  		if (key.objectid =3D=3D btrfs_root_id(root)) {
  			ret =3D -EPERM;
@@@ -6859,7 -6853,7 +6853,7 @@@ int btrfs_create_new_inode(struct btrfs
  		}
  	} else {
  		ret =3D btrfs_add_link(trans, BTRFS_I(dir), BTRFS_I(inode), name,
- 				     0, BTRFS_I(inode)->dir_index);
+ 				     false, BTRFS_I(inode)->dir_index);
  		if (unlikely(ret)) {
  			btrfs_abort_transaction(trans, ret);
  			goto discard;
@@@ -7075,7 -7069,7 +7069,7 @@@ static int btrfs_link(struct dentry *ol
  	inode_set_ctime_current(inode);
 =20
  	ret =3D btrfs_add_link(trans, BTRFS_I(dir), BTRFS_I(inode),
- 			     &fname.disk_name, 1, index);
+ 			     &fname.disk_name, true, index);
  	if (ret)
  		goto fail;
 =20
@@@ -8173,7 -8167,7 +8167,7 @@@ void btrfs_destroy_inode(struct inode *
  			if (!freespace_inode)
  				btrfs_lockdep_acquire(root->fs_info, btrfs_ordered_extent);
 =20
- 			btrfs_remove_ordered_extent(inode, ordered);
+ 			btrfs_remove_ordered_extent(ordered);
  			btrfs_put_ordered_extent(ordered);
  			btrfs_put_ordered_extent(ordered);
  		}
@@@ -8495,14 -8489,14 +8489,14 @@@ static int btrfs_rename_exchange(struc
  	}
 =20
  	ret =3D btrfs_add_link(trans, BTRFS_I(new_dir), BTRFS_I(old_inode),
- 			     new_name, 0, old_idx);
+ 			     new_name, false, old_idx);
  	if (unlikely(ret)) {
  		btrfs_abort_transaction(trans, ret);
  		goto out_fail;
  	}
 =20
  	ret =3D btrfs_add_link(trans, BTRFS_I(old_dir), BTRFS_I(new_inode),
- 			     old_name, 0, new_idx);
+ 			     old_name, false, new_idx);
  	if (unlikely(ret)) {
  		btrfs_abort_transaction(trans, ret);
  		goto out_fail;
@@@ -8793,7 -8787,7 +8787,7 @@@ static int btrfs_rename(struct mnt_idma
  	}
 =20
  	ret =3D btrfs_add_link(trans, BTRFS_I(new_dir), BTRFS_I(old_inode),
- 			     &new_fname.disk_name, 0, index);
+ 			     &new_fname.disk_name, false, index);
  	if (unlikely(ret)) {
  		btrfs_abort_transaction(trans, ret);
  		goto out_fail;

--LQEHhWml4Ga9Kg08
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5W7EACgkQJNaLcl1U
h9BC3wf/Xhc4ZJzQYuQBKG6BsbaewtGdDfMEmfN+aKA9xoH5ereHyDTpMz4L94i2
liblGM8RycPZYmbWdzUFQL8ahb93bVLT8zavfonYioZ2UXThZRkiAB/NkNpDVFH8
zPD4blf13x6/aeRmzoPVau8bsmKqqGssPwJdNVeF2G5kcPLFQn7OYi4ijbZRIdnT
3Riqiu7JU8gEDOr1NzqEuv/isUFhvACGgPkoWuhF6rmla2ENgu9K/eXPhTRDULcB
TmGToEA8O+WJBwVHWOvE+eUx+e/BaMSetLHpaEyZfX2cM6uWqhdj+ISY91JZU0p6
nEC+IFgt5ghXLtjVeyEeVfhlv3PDuQ==
=WZee
-----END PGP SIGNATURE-----

--LQEHhWml4Ga9Kg08--
