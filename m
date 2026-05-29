Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048142264B0;
	Fri, 29 May 2026 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060566; cv=none; b=TpTjtF7vAYc086Qhgr1h1IDFtVO874Dqy7L+Q8b6X6g9U2JGw1e5+jB1bA7HPRGrxPdV+B67hhfgrgQmgGatN8KaWAlXSGVIKHjPMxdkapQoDqu/IgMk65RYdY1VN0sjr+6yk2jMcwM4cNAIy+ha0fUz8XbOYJ7Le4eZlBN1s2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060566; c=relaxed/simple;
	bh=ugVo0vEi2UmXGG3eZ4Pexp+kxxQ5VMJ8zxaEJ/VPGWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P922xjCGhxCgLWWHw4wxQfwl9USCFVdisjWjjzve9CDmL/CO8srYRkioBVRS03RDkYIyNwvoxnX1c748TCG62NmSvttrzBWMllCLWaOVI2hbyUDofPt5RN1ipK6bq+CM5Qo/eQghsGL2DIlq4yyrsFuWABuEEGqQcprY2xSwoIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCVg/CAv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCVg/CAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2C81F00893;
	Fri, 29 May 2026 13:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780060564;
	bh=LTyx8wCZklOhAYBzo+IOLrmvgZzL967xDV3GRQOV93k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oCVg/CAvFeuagV4mzukWXY0kMNP5KZ7wuoSbDtHMZ5C+Gwu6t69Cm/0IGrOYHTOQA
	 tf+dO+KVTDzfwC3BEkioVCzLYJqzOq/qroUQI7izA3Nqkhv6LCw4cEPAq+Gv/c0kdg
	 hyCuvx8OgzrpqMeuxHQ/3DljsMT4h35n6Bz9w3tY17sEGLf2gcrAjhgmLD9qE1kdF1
	 Ja/N+quvLd5IBglDTjmhJRiQJr9nS3BtmvpxYxGsRqUIUDdaIke1ZCIMypXRbR71Q8
	 y7eY3s76jfnb/CcQIHtd1qoP4wFCiwqGbl42ZWE+KZKWNdFf59tcvbN+aNTVpGCG6y
	 6dktkQGF2kRxw==
Date: Fri, 29 May 2026 14:16:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ntfs3 tree with the nfsd,
 vfs-brauner trees
Message-ID: <1c0e305f-97c8-46dc-be8a-4c6b154a38f5@sirena.org.uk>
References: <ahmF4spkQMYcQMGI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KdLqGbqKC8mIlLov"
Content-Disposition: inline
In-Reply-To: <ahmF4spkQMYcQMGI@sirena.org.uk>
X-Cookie: Equal bytes for women.


--KdLqGbqKC8mIlLov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 01:26:10PM +0100, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the ntfs3 tree got conflicts in:
>=20
>   fs/ntfs3/file.c
>   fs/ntfs3/namei.c
>   fs/ntfs3/ntfs_fs.h
>=20
> between commit:
>=20
>   eeb7b37b9700f ("ntfs3: Implement fileattr_get for case sensitivity")
>=20
> from the nfsd, vfs-brauner trees and commit:
>=20
>   245bbdd2b9d65 ("fs/ntfs3: add fileattr support")
>=20
> from the ntfs3 tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Sorry, actual diff here taking account of the two additions in different
places with different content of fileattr_get():

diff --combined fs/ntfs3/file.c
index b2dfb46e60c6d,ad9350d7fc3fd..0000000000000
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@@ -89,80 -89,6 +89,91 @@@ static int ntfs_ioctl_fitrim(struct ntf
  	return 0;
  }
 =20
 +/*
 + * ntfs_fileattr_get - inode_operations::fileattr_get
 + */
 +int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 +{
 +	struct inode *inode =3D d_inode(dentry);
 +	struct ntfs_inode *ni =3D ntfs_i(inode);
 +	u32 flags =3D 0;
 +
 +	/* Avoid any operation if inode is bad. */
 +	if (unlikely(is_bad_ni(ni)))
 +		return -EINVAL;
 +
- 	if (inode->i_flags & S_IMMUTABLE)
- 		flags |=3D FS_IMMUTABLE_FL;
++	/*
++	 * NTFS preserves case (the default). Case sensitivity depends on
++	 * mount options: with "nocase", NTFS is case-insensitive;
++	 * otherwise it is case-sensitive.
++	 */
++	if (sbi->options->nocase) {
++		fa->fsx_xflags |=3D FS_XFLAG_CASEFOLD;
++		fa->flags |=3D FS_CASEFOLD_FL;
++	}
++	if (inode->i_flags & S_IMMUTABLE) {
++		fa->fsx_xflags |=3D FS_XFLAG_IMMUTABLE;
++		fa->flags |=3D FS_IMMUTABLE_FL;
++	}
 +
 +	if (inode->i_flags & S_APPEND)
 +		flags |=3D FS_APPEND_FL;
 +
 +	if (is_compressed(ni))
 +		flags |=3D FS_COMPR_FL;
 +
 +	if (is_encrypted(ni))
 +		flags |=3D FS_ENCRYPT_FL;
 +
 +	if (ni->nodump)
 +		flags |=3D FS_NODUMP_FL;
 +
 +	fileattr_fill_flags(fa, flags);
 +
 +	return 0;
 +}
 +
 +/*
 + * ntfs_fileattr_set - inode_operations::fileattr_set
 + */
 +int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 +		      struct file_kattr *fa)
 +{
 +	struct inode *inode =3D d_inode(dentry);
 +	struct ntfs_inode *ni =3D ntfs_i(inode);
 +	u32 flags =3D fa->flags;
 +	unsigned int new_fl =3D 0;
 +
 +	/* Avoid any operation if inode is bad. */
 +	if (unlikely(is_bad_ni(ni)))
 +		return -EINVAL;
 +
 +	if (fileattr_has_fsx(fa))
 +		return -EOPNOTSUPP;
 +
 +	if (flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL))
 +		return -EOPNOTSUPP;
 +
 +	if (flags & FS_IMMUTABLE_FL)
 +		new_fl |=3D S_IMMUTABLE;
 +
 +	if (flags & FS_APPEND_FL)
 +		new_fl |=3D S_APPEND;
 +
 +	inode_set_flags(inode, new_fl, S_IMMUTABLE | S_APPEND);
 +
 +	/* Save nodump flag to return in ntfs_getattr. */
 +	if (flags & FS_NODUMP_FL)
 +		ni->nodump =3D 1;
 +	else
 +		ni->nodump =3D 0;
 +
 +	inode_set_ctime_current(inode);
 +	mark_inode_dirty(inode);
 +
 +	return 0;
 +}
 +
  static int ntfs_ioctl_get_volume_label(struct ntfs_sb_info *sbi, u8 __use=
r *buf)
  {
  	if (copy_to_user(buf, sbi->volume.label, FSLABEL_MAX))
@@@ -254,34 -180,34 +265,6 @@@ long ntfs_compat_ioctl(struct file *fil
  }
  #endif
 =20
--/*
-- * ntfs_fileattr_get - inode_operations::fileattr_get
-- */
--int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
--{
--	struct inode *inode =3D d_inode(dentry);
--	struct ntfs_sb_info *sbi =3D inode->i_sb->s_fs_info;
--
--	/* Avoid any operation if inode is bad. */
--	if (unlikely(is_bad_ni(ntfs_i(inode))))
--		return -EINVAL;
--
--	/*
--	 * NTFS preserves case (the default). Case sensitivity depends on
--	 * mount options: with "nocase", NTFS is case-insensitive;
--	 * otherwise it is case-sensitive.
--	 */
--	if (sbi->options->nocase) {
--		fa->fsx_xflags |=3D FS_XFLAG_CASEFOLD;
--		fa->flags |=3D FS_CASEFOLD_FL;
--	}
--	if (inode->i_flags & S_IMMUTABLE) {
--		fa->fsx_xflags |=3D FS_XFLAG_IMMUTABLE;
--		fa->flags |=3D FS_IMMUTABLE_FL;
--	}
--	return 0;
--}
--
  /*
   * ntfs_getattr - inode_operations::getattr
   */
@@@ -305,9 -231,6 +288,9 @@@ int ntfs_getattr(struct mnt_idmap *idma
  	if (inode->i_flags & S_APPEND)
  		stat->attributes |=3D STATX_ATTR_APPEND;
 =20
 +	if (ni->nodump)
 +		stat->attributes |=3D STATX_ATTR_NODUMP;
 +
  	if (is_compressed(ni))
  		stat->attributes |=3D STATX_ATTR_COMPRESSED;
 =20
@@@ -351,44 -274,18 +334,44 @@@ static int ntfs_extend_initialized_size
  	return 0;
  }
 =20
 +/* Zero pagecache after 'from'. */
 +static void ntfs_zero_tail(struct address_space *mapping, loff_t from)
 +{
 +	struct folio_batch fbatch;
 +	pgoff_t index =3D from >> PAGE_SHIFT;
 +	unsigned nr, i;
 +
 +	folio_batch_init(&fbatch);
 +
 +	nr =3D filemap_get_folios(mapping, &index, -1, &fbatch);
 +
 +	for (i =3D 0; i < nr; i++) {
 +		struct folio *folio =3D fbatch.folios[i];
 +		u32 st =3D folio_pos(folio) < from ?
 +				 offset_in_folio(folio, from) :
 +				 0;
 +
 +		folio_lock(folio);
 +		folio_zero_segment(folio, st, folio_size(folio));
 +
 +		folio_unlock(folio);
 +	}
 +	folio_batch_release(&fbatch);
 +}
 +
  static void ntfs_filemap_close(struct vm_area_struct *vma)
  {
  	struct inode *inode =3D file_inode(vma->vm_file);
  	struct ntfs_inode *ni =3D ntfs_i(inode);
 +	u64 i_size =3D i_size_read(inode);
  	u64 from =3D (u64)vma->vm_pgoff << PAGE_SHIFT;
 -	u64 to =3D min_t(u64, i_size_read(inode),
 -		       from + vma->vm_end - vma->vm_start);
 +	u64 to =3D min(i_size, from + vma->vm_end - vma->vm_start);
 =20
  	if (ni->i_valid < to) {
  		ni->i_valid =3D to;
  		mark_inode_dirty(inode);
  	}
 +	ntfs_zero_tail(inode->i_mapping, ni->i_valid);
  }
 =20
  /* Copy of generic_file_vm_ops. */
@@@ -478,6 -375,93 +461,6 @@@ out
  	return err;
  }
 =20
 -static int ntfs_extend(struct inode *inode, loff_t pos, size_t count,
 -		       struct file *file)
 -{
 -	struct ntfs_inode *ni =3D ntfs_i(inode);
 -	struct address_space *mapping =3D inode->i_mapping;
 -	loff_t end =3D pos + count;
 -	bool extend_init =3D file && pos > ni->i_valid;
 -	int err;
 -
 -	if (end <=3D inode->i_size && !extend_init)
 -		return 0;
 -
 -	/* Mark rw ntfs as dirty. It will be cleared at umount. */
 -	ntfs_set_state(ni->mi.sbi, NTFS_DIRTY_DIRTY);
 -
 -	if (end > inode->i_size) {
 -		/*
 -		 * Normal files: increase file size, allocate space.
 -		 * Sparse/Compressed: increase file size. No space allocated.
 -		 */
 -		err =3D ntfs_set_size(inode, end);
 -		if (err)
 -			goto out;
 -	}
 -
 -	if (extend_init && !is_compressed(ni)) {
 -		err =3D ntfs_extend_initialized_size(file, ni, pos);
 -		if (err)
 -			goto out;
 -	} else {
 -		err =3D 0;
 -	}
 -
 -	inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 -	mark_inode_dirty(inode);
 -
 -	if (IS_SYNC(inode)) {
 -		int err2;
 -
 -		err =3D filemap_fdatawrite_range(mapping, pos, end - 1);
 -		err2 =3D write_inode_now(inode, 1);
 -		if (!err)
 -			err =3D err2;
 -		if (!err)
 -			err =3D filemap_fdatawait_range(mapping, pos, end - 1);
 -	}
 -
 -out:
 -	return err;
 -}
 -
 -static int ntfs_truncate(struct inode *inode, loff_t new_size)
 -{
 -	int err;
 -	struct ntfs_inode *ni =3D ntfs_i(inode);
 -	u64 new_valid =3D min_t(u64, ni->i_valid, new_size);
 -
 -	truncate_setsize(inode, new_size);
 -
 -	ni_lock(ni);
 -
 -	down_write(&ni->file.run_lock);
 -	err =3D attr_set_size_ex(ni, ATTR_DATA, NULL, 0, &ni->file.run, new_size,
 -			       &new_valid, ni->mi.sbi->options->prealloc, NULL,
 -			       false);
 -	up_write(&ni->file.run_lock);
 -
 -	ni->i_valid =3D new_valid;
 -
 -	ni_unlock(ni);
 -
 -	if (err)
 -		return err;
 -
 -	ni->std_fa |=3D FILE_ATTRIBUTE_ARCHIVE;
 -	inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 -	if (!IS_DIRSYNC(inode)) {
 -		mark_inode_dirty(inode);
 -	} else {
 -		err =3D ntfs_sync_inode(inode);
 -		if (err)
 -			return err;
 -	}
 -
 -	return 0;
 -}
 -
  /*
   * ntfs_fallocate - file_operations::ntfs_fallocate
   *
@@@ -684,25 -668,57 +667,25 @@@ static long ntfs_fallocate(struct file=20
  		if (is_supported_holes) {
  			CLST vcn =3D vbo >> cluster_bits;
  			CLST cend =3D bytes_to_cluster(sbi, end);
 -			CLST cend_v =3D bytes_to_cluster(sbi, ni->i_valid);
  			CLST lcn, clen;
  			bool new;
 =20
 -			if (cend_v > cend)
 -				cend_v =3D cend;
 -
  			/*
  			 * Allocate and zero new clusters.
 -			 * Zeroing these clusters may be too long.
 -			 */
 -			for (; vcn < cend_v; vcn +=3D clen) {
 -				err =3D attr_data_get_block(ni, vcn, cend_v - vcn,
 -							  &lcn, &clen, &new,
 -							  true, NULL, false);
 -				if (err)
 -					goto out;
 -			}
 -
 -			/*
 -			 * Moving up 'valid size'.
 -			 */
 -			err =3D ntfs_extend_initialized_size(
 -				file, ni, (u64)cend_v << cluster_bits);
 -			if (err)
 -				goto out;
 -
 -			/*
 -			 * Allocate but not zero new clusters.
  			 */
  			for (; vcn < cend; vcn +=3D clen) {
  				err =3D attr_data_get_block(ni, vcn, cend - vcn,
  							  &lcn, &clen, &new,
 -							  false, NULL, false);
 +							  true, NULL, false);
  				if (err)
  					goto out;
  			}
  		}
 =20
  		if (mode & FALLOC_FL_KEEP_SIZE) {
 -			ni_lock(ni);
 -			/* True - Keep preallocated. */
 -			err =3D attr_set_size(ni, ATTR_DATA, NULL, 0,
 -					    &ni->file.run, i_size, &ni->i_valid,
 -					    true);
 -			ni_unlock(ni);
 +			err =3D ntfs_set_size(inode, i_size);
  			if (err)
  				goto out;
 -			i_size_write(inode, i_size);
 -		} else if (new_size > i_size) {
 -			i_size_write(inode, new_size);
  		}
  	}
 =20
@@@ -759,20 -775,16 +742,20 @@@ int ntfs_setattr(struct mnt_idmap *idma
  		oldsize =3D i_size_read(inode);
  		newsize =3D attr->ia_size;
 =20
 -		if (newsize <=3D oldsize)
 -			err =3D ntfs_truncate(inode, newsize);
 -		else
 -			err =3D ntfs_extend(inode, newsize, 0, NULL);
 +		if (newsize !=3D oldsize) {
 +			truncate_setsize(inode, newsize);
 =20
 -		if (err)
 -			goto out;
 +			err =3D ntfs_set_size(inode, newsize);
 +			if (err) {
 +				i_size_write(inode, oldsize);
 +				goto out;
 +			}
 =20
 -		ni->ni_flags |=3D NI_FLAG_UPDATE_PARENT;
 -		i_size_write(inode, newsize);
 +			ni->std_fa |=3D FILE_ATTRIBUTE_ARCHIVE;
 +			ni->ni_flags |=3D NI_FLAG_UPDATE_PARENT;
 +			inode_set_mtime_to_ts(inode,
 +					      inode_set_ctime_current(inode));
 +		}
  	}
 =20
  	setattr_copy(idmap, inode, attr);
@@@ -1036,7 -1048,7 +1019,7 @@@ static ssize_t ntfs_compress_write(stru
  		CLST lcn, clen;
 =20
  		frame =3D valid >> frame_bits;
 -		frame_vbo =3D valid & ~(frame_size - 1);
 +		frame_vbo =3D valid & ~(u64)(frame_size - 1);
  		off =3D valid & (frame_size - 1);
 =20
  		err =3D attr_data_get_block(ni, frame << NTFS_LZNT_CUNIT, 1, &lcn,
@@@ -1105,7 -1117,7 +1088,7 @@@
  		if (bytes > count)
  			bytes =3D count;
 =20
 -		frame_vbo =3D pos & ~(frame_size - 1);
 +		frame_vbo =3D pos & ~(u64)(frame_size - 1);
  		index =3D frame_vbo >> PAGE_SHIFT;
 =20
  		if (unlikely(fault_in_iov_iter_readable(from, bytes))) {
@@@ -1246,7 -1258,6 +1229,7 @@@ static ssize_t ntfs_file_write_iter(str
  	struct file *file =3D iocb->ki_filp;
  	struct inode *inode =3D file_inode(file);
  	struct ntfs_inode *ni =3D ntfs_i(inode);
 +	loff_t vbo, endbyte;
  	ssize_t ret, err;
 =20
  	if (!inode_trylock(inode)) {
@@@ -1281,30 -1292,15 +1264,30 @@@
  		goto out;
  	}
 =20
 -	ret =3D ntfs_extend(inode, iocb->ki_pos, ret, file);
 -	if (ret)
 -		goto out;
 +	vbo =3D iocb->ki_pos;
 +	endbyte =3D vbo + ret;
 +
 +	if (endbyte > inode->i_size) {
 +		/*
 +		 * Normal files: increase file size, allocate space.
 +		 * Sparse/Compressed: increase file size. No space allocated.
 +		 */
 +		ret =3D ntfs_set_size(inode, endbyte);
 +		if (ret)
 +			goto out;
 +	}
 =20
  	if (is_compressed(ni)) {
  		ret =3D ntfs_compress_write(iocb, from);
  		goto out;
  	}
 =20
 +	if (vbo > ni->i_valid) {
 +		ret =3D ntfs_extend_initialized_size(file, ni, vbo);
 +		if (ret)
 +			goto out;
 +	}
 +
  	/* Fallback to buffered I/O if the inode does not support direct I/O. */
  	if (!(iocb->ki_flags & IOCB_DIRECT) ||
  	    !ntfs_should_use_dio(iocb, from)) {
@@@ -1327,8 -1323,7 +1310,8 @@@
  			goto out;
  	}
 =20
 -	ret =3D iomap_dio_rw(iocb, from, &ntfs_iomap_ops, NULL, 0, NULL, 0);
 +	ret =3D iomap_dio_rw(iocb, from, &ntfs_iomap_ops, NULL,
 +			   IOMAP_DIO_FORCE_WAIT, NULL, 0);
 =20
  	if (ret =3D=3D -ENOTBLK) {
  		/* Returns -ENOTBLK in case of a page invalidation failure for writes.*/
@@@ -1337,7 -1332,7 +1320,7 @@@
  	}
 =20
  	if (ret >=3D 0 && iov_iter_count(from)) {
 -		loff_t offset =3D iocb->ki_pos, endbyte;
 +		vbo =3D iocb->ki_pos;
 =20
  		iocb->ki_flags &=3D ~IOCB_DIRECT;
  		err =3D iomap_file_buffered_write(iocb, from, &ntfs_iomap_ops,
@@@ -1355,15 -1350,15 +1338,15 @@@
  		* to complete off the I/O request.
  		*/
  		ret +=3D err;
 -		endbyte =3D offset + err - 1;
 -		err =3D filemap_write_and_wait_range(inode->i_mapping, offset,
 +		endbyte =3D vbo + err - 1;
 +		err =3D filemap_write_and_wait_range(inode->i_mapping, vbo,
  						   endbyte);
  		if (err) {
  			ret =3D err;
  			goto out;
  		}
 =20
 -		invalidate_mapping_pages(inode->i_mapping, offset >> PAGE_SHIFT,
 +		invalidate_mapping_pages(inode->i_mapping, vbo >> PAGE_SHIFT,
  					 endbyte >> PAGE_SHIFT);
  	}
 =20
@@@ -1444,9 -1439,8 +1427,9 @@@ static int ntfs_file_release(struct ino
  		down_write(&ni->file.run_lock);
 =20
  		/* Deallocate preallocated. */
 -		err =3D attr_set_size(ni, ATTR_DATA, NULL, 0, &ni->file.run,
 -				    inode->i_size, &ni->i_valid, false);
 +		err =3D attr_set_size_ex(ni, ATTR_DATA, NULL, 0, &ni->file.run,
 +				       inode->i_size, &ni->i_valid, false, NULL,
 +				       true);
 =20
  		up_write(&ni->file.run_lock);
  		ni_unlock(ni);
@@@ -1558,12 -1552,7 +1541,12 @@@ static loff_t ntfs_llseek(struct file *
  	loff_t maxbytes =3D ntfs_get_maxbytes(ni);
  	loff_t ret;
 =20
 -	if (whence =3D=3D SEEK_DATA || whence =3D=3D SEEK_HOLE) {
 +	if (whence !=3D SEEK_DATA && whence !=3D SEEK_HOLE) {
 +		ret =3D generic_file_llseek_size(file, offset, whence, maxbytes,
 +					       i_size_read(inode));
 +	} else if ((unsigned long long)offset >=3D i_size_read(inode)) {
 +		ret =3D -ENXIO;
 +	} else {
  		inode_lock_shared(inode);
  		/* Scan file for hole or data. */
  		ret =3D ni_seek_data_or_hole(ni, offset, whence =3D=3D SEEK_DATA);
@@@ -1571,6 -1560,9 +1554,6 @@@
 =20
  		if (ret >=3D 0)
  			ret =3D vfs_setpos(file, ret, maxbytes);
 -	} else {
 -		ret =3D generic_file_llseek_size(file, offset, whence, maxbytes,
 -					       i_size_read(inode));
  	}
  	return ret;
  }
@@@ -1584,7 -1576,6 +1567,7 @@@ const struct inode_operations ntfs_file
  	.set_acl	=3D ntfs_set_acl,
  	.fiemap		=3D ntfs_fiemap,
  	.fileattr_get	=3D ntfs_fileattr_get,
 +	.fileattr_set	=3D ntfs_fileattr_set,
  };
 =20
  const struct file_operations ntfs_file_operations =3D {
diff --combined fs/ntfs3/namei.c
index c59de5f2fa977,e159ba66a34a4..0000000000000
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@@ -340,7 -340,7 +340,7 @@@ static int ntfs_rename(struct mnt_idma
  			ntfs_sync_inode(dir);
 =20
  		if (IS_DIRSYNC(new_dir))
 -			ntfs_sync_inode(inode);
 +			ntfs_sync_inode(new_dir);
  	}
 =20
  	if (dir_ni !=3D new_dir_ni)
@@@ -519,7 -519,6 +519,7 @@@ const struct inode_operations ntfs_dir_
  	.listxattr	=3D ntfs_listxattr,
  	.fiemap		=3D ntfs_fiemap,
  	.fileattr_get	=3D ntfs_fileattr_get,
 +	.fileattr_set	=3D ntfs_fileattr_set,
  };
 =20
  const struct inode_operations ntfs_special_inode_operations =3D {
@@@ -528,8 -527,6 +528,8 @@@
  	.listxattr	=3D ntfs_listxattr,
  	.get_acl	=3D ntfs_get_acl,
  	.set_acl	=3D ntfs_set_acl,
 +	.fileattr_get	=3D ntfs_fileattr_get,
 +	.fileattr_set	=3D ntfs_fileattr_set,
  };
 =20
  const struct dentry_operations ntfs_dentry_ops =3D {
diff --combined fs/ntfs3/ntfs_fs.h
index d98d7e474476c,41db22d652c47..0000000000000
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@@ -392,9 -392,6 +392,9 @@@ struct ntfs_inode=20
  	 */
  	u8 ni_bad;
 =20
 +	/* Keep track of FS_NODUMP_FL. */
 +	u8 nodump;
 +
  	union {
  		struct ntfs_index dir;
  		struct {
@@@ -533,8 -530,6 +533,8 @@@ extern const struct file_operations ntf
 =20
  /* Globals from file.c */
  int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
 +int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 +		      struct file_kattr *fa);
  int ntfs_getattr(struct mnt_idmap *idmap, const struct path *path,
  		 struct kstat *stat, u32 request_mask, u32 flags);
  int ntfs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
@@@ -858,9 -853,6 +858,9 @@@ static inline void mi_get_ref(const str
  /* Globals from run.c */
  bool run_lookup_entry(const struct runs_tree *run, CLST vcn, CLST *lcn,
  		      CLST *len, size_t *index);
 +bool run_lookup_entry_da(const struct runs_tree *run,
 +			 const struct runs_tree *run_da, CLST vcn, CLST *lcn,
 +			 CLST *len);
  void run_truncate(struct runs_tree *run, CLST vcn);
  void run_truncate_head(struct runs_tree *run, CLST vcn);
  void run_truncate_around(struct runs_tree *run, CLST vcn);
@@@ -886,8 -878,7 +886,8 @@@ int run_unpack_ex(struct runs_tree *run
  #else
  #define run_unpack_ex run_unpack
  #endif
 -int run_get_highest_vcn(CLST vcn, const u8 *run_buf, u64 *highest_vcn);
 +int run_get_highest_vcn(CLST vcn, const u8 *run_buf, size_t run_buf_size,=
=20
 +		       u64 *highest_vcn);
  int run_clone(const struct runs_tree *run, struct runs_tree *new_run);
  bool run_remove_range(struct runs_tree *run, CLST vcn, CLST len, CLST *do=
ne);
  CLST run_len(const struct runs_tree *run);

--KdLqGbqKC8mIlLov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoZkZAACgkQJNaLcl1U
h9C6Awf8CZjK3RwPNKpYVt1EYZe1U9uX4JAGsPXJ/O+MZb0XATeLYiHEE6huY40x
OqKj3chSBG8a+jxtCz1JxCdEwMywvtR/PlY5YXRurhboLtet4aP30z4D0PEvROzc
m9zhhLV9ftcDBHUMQaHJvfeiupw7H3ujOKdjK9KcH0xp7huW0jSE2TYz1h+dTbwr
CfJauKEseyzWcI2XQiLLFRPmXQqdwqR7FuNysLsbaT9vm+04c+cObryVGlFO0pg3
HBWN1UDa+OW2h4Jr8OJUqAeH+/FZ0F3/DqWtSSkzHLssQEYHsOMzMda1IZG0laWP
pInRyKeGKNb8mMlPw6J0BRPnL8qMxQ==
=TlPk
-----END PGP SIGNATURE-----

--KdLqGbqKC8mIlLov--
