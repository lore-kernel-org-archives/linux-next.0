Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A53F99DD;
	Tue, 24 Mar 2026 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358749; cv=none; b=Dprk46P620UkCLknejgJ6HXn+P+DcqEWHgrBT0PUfHHhqbPNmWAaGkIWhPdyQn8qVbblWdTnw7XBWS8OTujzr6KCc8oO7k/s41Ylo7+5qWrBErXhHM7JtF2wRvll4aSnnowCiuw6Xay00qJa5M0AYleBhV2BZwjJuhdj7w2Z1GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358749; c=relaxed/simple;
	bh=QP14YMm9novA80JKzDT7CSV/cn4ykpV6NGBkdTlOmNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKi6MEa20wHDWw+VdOz3j0a6Qx0hjVO3ze/PYGUj7tIfF0JK+pdsWyHSYWbCIc2Eh9hyeZQcIU6vhiByxwQehoMQszDLy0wX6RzfEnFTgzrWW81JrRaiGwFVWTQazkMqYlU0UbKYdoxe580tcseDUIRRAMKqmiDgKXh4VKo0sgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZ9/vwI7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZ9/vwI7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B4BC19424;
	Tue, 24 Mar 2026 13:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774358748;
	bh=QP14YMm9novA80JKzDT7CSV/cn4ykpV6NGBkdTlOmNA=;
	h=Date:From:To:Cc:Subject:From;
	b=rZ9/vwI7GE9YvuKuRJW0rR8Nmv+CaXAbldTSlAxz6vo6/FmTSSosV7kcH0YgKTHF+
	 p1Se/tVVhkGMy0QA7gkgEPzwi8lw5w1WGcTDOcFGIu+uaTVJGyzXa0O4d1MsU+O+5O
	 aQE0lHNBjVu7zXjZV8M6U0STHEAk6OoCl9X+NMOdHWt22b5IVzhj3TI0akQf6CCS5S
	 OcpDCEVjDLcyFVYlPMm3+wGRVlo9w+AiQ2zcDDypiw57ssDHTIdCTsgcfcfK6QTTs5
	 lbqE+2mFcmjQYSrvsMBezWPoyHK+TMO+F7xLXzHM3a6oUvMg4YEz5TG0+CBAzzCn8B
	 fETfkTVMQM8Tw==
Date: Tue, 24 Mar 2026 13:25:45 +0000
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Filipe Manana <fdmanana@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the btrfs tree with the btrfs-fixes tree
Message-ID: <acKQ2SCxs50fRtov@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rrrp3c/yer0SGIvA"
Content-Disposition: inline


--rrrp3c/yer0SGIvA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/tree-log.c

between commit:

  5254d4181add9 ("btrfs: fix zero size inode with non-zero size after log r=
eplay")

=66rom the btrfs-fixes tree and commits:

  5ff218f0ce4bf ("btrfs: pass a btrfs inode to tree-log.c:fill_inode_item()=
")
  b665ca59560b5 ("btrfs: fix zero size inode with non-zero size after log r=
eplay")

=66rom the btrfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/btrfs/tree-log.c
index ac871efb97639,de4707b1227ef..0000000000000
--- a/fs/btrfs/tree-log.c
+++ b/fs/btrfs/tree-log.c
@@@ -457,7 -457,7 +457,7 @@@ static int process_one_buffer(struct ex
  			return ret;
  		}
 =20
- 		if (btrfs_buffer_uptodate(eb, gen, false) && level =3D=3D 0) {
+ 		if (btrfs_buffer_uptodate(eb, gen, NULL) && level =3D=3D 0) {
  			ret =3D btrfs_exclude_logged_extents(eb);
  			if (ret)
  				btrfs_abort_transaction(trans, ret);
@@@ -1003,7 -1003,7 +1003,7 @@@ static noinline int replay_one_extent(s
  						       btrfs_root_id(root));
  		}
  		if (!ret) {
- 			ret =3D btrfs_csum_file_blocks(trans, csum_root, sums);
+ 			ret =3D btrfs_insert_data_csums(trans, csum_root, sums);
  			if (ret)
  				btrfs_abort_log_replay(wc, ret,
  	       "failed to add csums for range [%llu, %llu) inode %llu root %llu",
@@@ -1711,7 -1711,7 +1711,7 @@@ static noinline int add_inode_ref(struc
  			}
 =20
  			/* insert our name */
- 			ret =3D btrfs_add_link(trans, dir, inode, &name, 0, ref_index);
+ 			ret =3D btrfs_add_link(trans, dir, inode, &name, false, ref_index);
  			if (ret) {
  				btrfs_abort_log_replay(wc, ret,
  "failed to add link for inode %llu in dir %llu ref_index %llu name %.*s r=
oot %llu",
@@@ -2059,7 -2059,7 +2059,7 @@@ static noinline int insert_one_name(str
  		return PTR_ERR(dir);
  	}
 =20
- 	ret =3D btrfs_add_link(trans, dir, inode, name, 1, index);
+ 	ret =3D btrfs_add_link(trans, dir, inode, name, true, index);
 =20
  	/* FIXME, put inode into FIXUP list */
 =20
@@@ -3576,7 -3576,7 +3576,7 @@@ int btrfs_sync_log(struct btrfs_trans_h
 =20
  	btrfs_set_super_log_root(fs_info->super_for_commit, log_root_start);
  	btrfs_set_super_log_root_level(fs_info->super_for_commit, log_root_level=
);
- 	ret =3D write_all_supers(fs_info, 1);
+ 	ret =3D write_all_supers(trans);
  	mutex_unlock(&fs_info->tree_log_mutex);
  	if (unlikely(ret)) {
  		btrfs_set_log_full_commit(trans);
@@@ -4613,10 -4613,11 +4613,11 @@@ static int truncate_inode_items(struct=
=20
  static void fill_inode_item(struct btrfs_trans_handle *trans,
  			    struct extent_buffer *leaf,
  			    struct btrfs_inode_item *item,
- 			    struct inode *inode, bool log_inode_only,
+ 			    struct btrfs_inode *inode, bool log_inode_only,
  			    u64 logged_isize)
  {
- 	u64 gen =3D BTRFS_I(inode)->generation;
+ 	struct inode *vfs_inode =3D &inode->vfs_inode;
+ 	u64 gen =3D inode->generation;
  	u64 flags;
 =20
  	if (log_inode_only) {
@@@ -4631,33 -4632,33 +4632,33 @@@
  		 * and one can set it to 0 since that only happens on eviction
  		 * and we are holding a ref on the inode.
  		 */
- 		ASSERT(data_race(BTRFS_I(inode)->logged_trans) > 0);
- 		if (data_race(BTRFS_I(inode)->logged_trans) < trans->transid)
+ 		ASSERT(data_race(inode->logged_trans) > 0);
+ 		if (data_race(inode->logged_trans) < trans->transid)
  			gen =3D 0;
 =20
  		btrfs_set_inode_size(leaf, item, logged_isize);
  	} else {
- 		btrfs_set_inode_size(leaf, item, inode->i_size);
+ 		btrfs_set_inode_size(leaf, item, vfs_inode->i_size);
  	}
 =20
  	btrfs_set_inode_generation(leaf, item, gen);
 =20
- 	btrfs_set_inode_uid(leaf, item, i_uid_read(inode));
- 	btrfs_set_inode_gid(leaf, item, i_gid_read(inode));
- 	btrfs_set_inode_mode(leaf, item, inode->i_mode);
- 	btrfs_set_inode_nlink(leaf, item, inode->i_nlink);
+ 	btrfs_set_inode_uid(leaf, item, i_uid_read(vfs_inode));
+ 	btrfs_set_inode_gid(leaf, item, i_gid_read(vfs_inode));
+ 	btrfs_set_inode_mode(leaf, item, vfs_inode->i_mode);
+ 	btrfs_set_inode_nlink(leaf, item, vfs_inode->i_nlink);
 =20
- 	btrfs_set_timespec_sec(leaf, &item->atime, inode_get_atime_sec(inode));
- 	btrfs_set_timespec_nsec(leaf, &item->atime, inode_get_atime_nsec(inode));
+ 	btrfs_set_timespec_sec(leaf, &item->atime, inode_get_atime_sec(vfs_inode=
));
+ 	btrfs_set_timespec_nsec(leaf, &item->atime, inode_get_atime_nsec(vfs_ino=
de));
 =20
- 	btrfs_set_timespec_sec(leaf, &item->mtime, inode_get_mtime_sec(inode));
- 	btrfs_set_timespec_nsec(leaf, &item->mtime, inode_get_mtime_nsec(inode));
+ 	btrfs_set_timespec_sec(leaf, &item->mtime, inode_get_mtime_sec(vfs_inode=
));
+ 	btrfs_set_timespec_nsec(leaf, &item->mtime, inode_get_mtime_nsec(vfs_ino=
de));
 =20
- 	btrfs_set_timespec_sec(leaf, &item->ctime, inode_get_ctime_sec(inode));
- 	btrfs_set_timespec_nsec(leaf, &item->ctime, inode_get_ctime_nsec(inode));
+ 	btrfs_set_timespec_sec(leaf, &item->ctime, inode_get_ctime_sec(vfs_inode=
));
+ 	btrfs_set_timespec_nsec(leaf, &item->ctime, inode_get_ctime_nsec(vfs_ino=
de));
 =20
- 	btrfs_set_timespec_sec(leaf, &item->otime, BTRFS_I(inode)->i_otime_sec);
- 	btrfs_set_timespec_nsec(leaf, &item->otime, BTRFS_I(inode)->i_otime_nsec=
);
+ 	btrfs_set_timespec_sec(leaf, &item->otime, inode->i_otime_sec);
+ 	btrfs_set_timespec_nsec(leaf, &item->otime, inode->i_otime_nsec);
 =20
  	/*
  	 * We do not need to set the nbytes field, in fact during a fast fsync
@@@ -4668,11 -4669,10 +4669,10 @@@
  	 * inode item in subvolume tree as needed (see overwrite_item()).
  	 */
 =20
- 	btrfs_set_inode_sequence(leaf, item, inode_peek_iversion(inode));
+ 	btrfs_set_inode_sequence(leaf, item, inode_peek_iversion(vfs_inode));
  	btrfs_set_inode_transid(leaf, item, trans->transid);
- 	btrfs_set_inode_rdev(leaf, item, inode->i_rdev);
- 	flags =3D btrfs_inode_combine_flags(BTRFS_I(inode)->flags,
- 					  BTRFS_I(inode)->ro_flags);
+ 	btrfs_set_inode_rdev(leaf, item, vfs_inode->i_rdev);
+ 	flags =3D btrfs_inode_combine_flags(inode->flags, inode->ro_flags);
  	btrfs_set_inode_flags(leaf, item, flags);
  	btrfs_set_inode_block_group(leaf, item, 0);
  }
@@@ -4719,8 -4719,7 +4719,7 @@@ static int log_inode_item(struct btrfs_
  		return ret;
  	inode_item =3D btrfs_item_ptr(path->nodes[0], path->slots[0],
  				    struct btrfs_inode_item);
- 	fill_inode_item(trans, path->nodes[0], inode_item, &inode->vfs_inode,
- 			false, 0);
+ 	fill_inode_item(trans, path->nodes[0], inode_item, inode, false, 0);
  	btrfs_release_path(path);
  	return 0;
  }
@@@ -4740,7 -4739,7 +4739,7 @@@ static int log_csums(struct btrfs_trans
  	 * worry about logging checksum items with overlapping ranges.
  	 */
  	if (inode->last_reflink_trans < trans->transid)
- 		return btrfs_csum_file_blocks(trans, log_root, sums);
+ 		return btrfs_insert_data_csums(trans, log_root, sums);
 =20
  	/*
  	 * Serialize logging for checksums. This is to avoid racing with the
@@@ -4763,7 -4762,7 +4762,7 @@@
  	 */
  	ret =3D btrfs_del_csums(trans, log_root, sums->logical, sums->len);
  	if (!ret)
- 		ret =3D btrfs_csum_file_blocks(trans, log_root, sums);
+ 		ret =3D btrfs_insert_data_csums(trans, log_root, sums);
 =20
  	btrfs_unlock_extent(&log_root->log_csum_range, sums->logical, lock_end,
  			    &cached_state);
@@@ -4989,8 -4988,7 +4988,7 @@@ copy_item
  			inode_item =3D btrfs_item_ptr(dst_path->nodes[0], dst_slot,
  						    struct btrfs_inode_item);
  			fill_inode_item(trans, dst_path->nodes[0], inode_item,
- 					&inode->vfs_inode,
- 					inode_only =3D=3D LOG_INODE_EXISTS,
+ 					inode, inode_only =3D=3D LOG_INODE_EXISTS,
  					logged_isize);
  		} else {
  			copy_extent_buffer(dst_path->nodes[0], src, dst_offset,
@@@ -5088,7 -5086,7 +5086,7 @@@ static int log_extent_csums(struct btrf
  		if (test_and_set_bit(BTRFS_ORDERED_LOGGED_CSUM, &ordered->flags))
  			continue;
 =20
- 		list_for_each_entry(sums, &ordered->list, list) {
+ 		list_for_each_entry(sums, &ordered->csum_list, list) {
  			ret =3D log_csums(trans, inode, log_root, sums);
  			if (ret)
  				return ret;
@@@ -5803,7 -5801,7 +5801,7 @@@ static int btrfs_check_ref_name_overrid
  		name_str.len =3D this_name_len;
  		di =3D btrfs_lookup_dir_item(NULL, inode->root, search_path,
  				parent, &name_str, 0);
- 		if (di && !IS_ERR(di)) {
+ 		if (!IS_ERR_OR_NULL(di)) {
  			struct btrfs_key di_key;
 =20
  			btrfs_dir_item_key_to_cpu(search_path->nodes[0],

--rrrp3c/yer0SGIvA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnCkNgACgkQJNaLcl1U
h9DxfQf/dr2hoyO8I/1ws00DeemXzheWkcT+wojsbM17M2+01J3t525Swz2gcFul
ALnAEursx2Rpn8pTQ7VPxjzCsjAGMaDu5WSnfgaRBQBmSTxRoWnEJ/+IEotpoBhQ
e4GIBMlGTJZJ/ZA49se38ynHXkBJFZyc0L55XPE4VOi3LP5eV/+vgFlZnmTRo8Bt
Xb28+nkqRIebeoF6yDOlfYYol+vQ46bR7R+Ss2fO02WevUhdgnBPxQ7+vZjdqxlu
tLxHdjjLfZ5C1IK9HKu7ez7rdxJ1cmAC6lOjkpcUzMAcHDTC6lD6BXY6ZHneM+fg
50ieL3vFaDkKLuQi6rB5LFNK9+A0Jw==
=naN0
-----END PGP SIGNATURE-----

--rrrp3c/yer0SGIvA--
