Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008559;
	b=whJ2IarmfY2ClFcXL+TB9pfHS4qI0HH2gWcvdILEA2pG2Ow88u5uPlhLB+F3kcy2FbN4
	 ik/KmuYE7u3vkTLxEBKw0MT/gfQ51NVWapXdo/+nKTObgp09w0GL5dB0NyboluSYG8X0v
	 xZVafjQppJHfKOdUs25XuK1Uxzf6oey5fSOpR2VUL139b456Bfu8xioimEny4rX6W70SM
	 DEcBREunE5zLxSf4WrLyVAqZ34AvLVjltFxanHr2PL66hIcw065yq3GCU+rTO3vwn+u+x
	 KSBDanmANfj62DmlPImfJDHGZ/lEN4QC5BNHFpM3+k/1E56YORNbXWk7PU6/SF9wIKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008559;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=V7yfVir0YKQYnfvS3rKPKMkLaQkxTRzdOkgz62b10Hk=;
	b=cYPGw4Bw3inUVorGrjMyqBq4gHwIz23yApGUcjEp3Uxf70RdTZIinQd7co91IlDb6C5u
	 RBBwo2KO8R5eFtHPwYZM7wJd9ZKbu74gEYrtdckQK56pGhSxpHqrE6Juvm/nhu/+ZamlI
	 +T5CEW8f9P233dTTrmFzZiPyoxhied9hKuZVDUvFvwiRau1DGvspF1U+O1BQ6d5Dm4UnA
	 tOKBSSHb0sYWO3Z993SFyjDXHqcxKR2R65AXjlcLFkk3crvDLkxDMipmvb6WU7SdlYvE/
	 Y8ZQVJVXF/3aWgEnj2GgUsQV0kSBWWc0o2WqtbgVMGXt1ZS6KYWdXKlR4Zdc7dqpP8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jw9e8R8+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55724606A320;
	Wed, 18 Nov 2026 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jw9e8R8+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D5E1F000C4;
	Wed, 18 Nov 2026 13:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795008559;
	bh=V7yfVir0YKQYnfvS3rKPKMkLaQkxTRzdOkgz62b10Hk=;
	h=Date:From:To:Cc:Subject;
	b=jw9e8R8+pgv+TOq1zjWk96Tn6oPhv51JUw4xh9IXIMKuG9TcTkaau0Urz0wsaG1zd
	 lTRts0b/f8lw9VpZCMQjYg+AxxqVL8Bmzp2SExNa2U9tTxtiCWeMovwPDnW2+atdT8
	 cF0IOFFJwWCzGco+1IURZ3KoDhITBipx8pboAPnlAS76MPAASVdQt8UYnEnGH8Z+OB
	 zYpVCLo1gnLaZubEDcYnEPRN/65lqMFw82oemQJFvbxcXjEoPam0Mc8iTtPSzn1snK
	 jkydy2r/42LxSXU/v6ZFX9kENe63CvcdkkdeE9Y0dWNq9Khtd80Z4Srd9zRpywhoAo
	 9eXiFcS1xpp5g==
Date: Wed, 18 Nov 2026 13:29:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Chi Zhiling <chizhiling@kylinos.cn>,
	Christian Brauner <brauner@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the exfat tree with the origin tree
Message-ID: <av2oK6fn2XToTjxV@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U4eYdm7sgH4Q5PI0"
Content-Disposition: inline


--U4eYdm7sgH4Q5PI0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the exfat tree got a conflict in:

  fs/exfat/file.c

between commit:

  9e8fc16dc6b47 ("iomap: pass iomap_iter_next_fn directly instead of struct=
 iomap_ops")

=66rom the origin tree and commits:

  cfdee4e5f5764 ("exfat: coordinate direct writes with mmap faults")
  e70ec3eaac957 ("exfat: increase VDL before unlocking initialized folios")
  44c870b1a1216 ("exfat: zero invalid VDL tails in buffered and direct read=
s")

=66rom the exfat tree.  This one really wants some double checking.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/exfat/file.c
index 435bbef288b83,c7991e98a07ab..0000000000000
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@@ -804,6 -847,105 +847,105 @@@ static int exfat_extend_valid_size(stru
  	return ret;
  }
 =20
+ /*
+  * A later mmap fault can initialize the gap up to its folio. Prepare and
+  * write back through the DIO range and its boundary folio so that gap
+  * initialization in a later folio does not dirty the DIO range.
+  * i_rwsem serializes preparation, allowing later overwrites to reuse the
+  * prepared range without dirtying folios containing in-flight DIO.
+  */
+ static int exfat_prepare_dio_range(struct inode *inode, loff_t end)
+ {
+ 	struct address_space *mapping =3D inode->i_mapping;
+ 	struct exfat_inode_info *ei =3D EXFAT_I(inode);
+ 	loff_t valid, start, size;
+ 	int ret =3D 0;
+=20
+ 	filemap_invalidate_lock(mapping);
+ 	size =3D i_size_read(inode);
+ 	valid =3D exfat_get_valid_size(ei);
+ 	start =3D max(valid, exfat_get_zeroed_size(ei));
+ 	end =3D max(valid, min(end, size));
+ 	end =3D min_t(u64, round_up((u64)end, mapping_max_folio_size(mapping)),
+ 		    size);
+ 	if (start < end) {
+ 		unmap_mapping_range(mapping, start, end - start, 0);
+ 		ret =3D exfat_prepare_range(inode, start, end, false);
+ 		if (!ret)
+ 			ret =3D filemap_write_and_wait_range(mapping, start, end - 1);
+ 		if (!ret)
+ 			exfat_advance_zeroed_size(ei,
+ 						  round_up(end, i_blocksize(inode)));
+ 	}
+ 	filemap_invalidate_unlock(mapping);
+ 	return ret;
+ }
+=20
+ static int exfat_file_write_dio_end_io(struct kiocb *iocb, ssize_t size,
+ 		int error, unsigned int flags)
+ {
+ 	struct inode *inode =3D file_inode(iocb->ki_filp);
+ 	struct exfat_sb_info *sbi =3D EXFAT_SB(inode->i_sb);
+ 	struct exfat_dio *dio =3D container_of(iocb, struct exfat_dio, iocb);
+ 	struct folio *folio =3D NULL;
+ 	loff_t end =3D dio->start + size;
+ 	bool dirtied =3D false;
+=20
+ 	if (error || !size)
+ 		return error;
+=20
+ 	if (i_size_read(inode) < end)
+ 		folio =3D exfat_prepare_isize_extended(inode, i_size_read(inode),
+ 						     end);
+=20
+ 	mutex_lock(&sbi->s_lock);
+ 	if (i_size_read(inode) < end) {
+ 		i_size_write(inode, end);
+ 		dirtied =3D true;
+ 	}
+=20
+ 	if (dio->start <=3D exfat_get_valid_size(EXFAT_I(inode)) &&
+ 	    exfat_advance_valid_size(EXFAT_I(inode), end))
+ 		dirtied =3D true;
+ 	if (dirtied)
+ 		mark_inode_dirty(inode);
+ 	dio->completed =3D size;
+=20
+ 	mutex_unlock(&sbi->s_lock);
+ 	exfat_unlock_isize_folio(folio);
+ 	return 0;
+ }
+=20
+ static const struct iomap_dio_ops exfat_write_dio_ops =3D {
+ 	.end_io		=3D exfat_file_write_dio_end_io,
+ };
+=20
+ /*
+  * Run after iomap's post-write invalidation, so gap folios cannot be
+  * mistaken for stale cache pages by the direct I/O completion.
+  */
+ static int exfat_finish_dio_gap(struct exfat_dio *dio)
+ {
+ 	struct inode *inode =3D file_inode(dio->iocb.ki_filp);
+ 	struct exfat_inode_info *ei =3D EXFAT_I(inode);
+ 	loff_t start =3D max(exfat_get_valid_size(ei), exfat_get_zeroed_size(ei)=
);
+ 	int ret;
+=20
+ 	if (exfat_get_valid_size(ei) >=3D dio->start)
+ 		return 0;
+ 	if (start < dio->start) {
+ 		unmap_mapping_range(inode->i_mapping, start, dio->start - start, 0);
+ 		ret =3D iomap_zero_range(inode, start, dio->start - start, NULL,
 -				       &exfat_write_iomap_ops,
++				       exfat_write_iomap_next,
+ 				       &exfat_dio_gap_write_ops, dio);
+ 		if (ret)
+ 			return ret;
+ 	}
+ 	if (exfat_advance_valid_size(ei, dio->start + dio->completed))
+ 		mark_inode_dirty(inode);
+ 	return 0;
+ }
+=20
  /*
   * The clusters for a write are allocated before the data is copied. Free=
 the
   * ones that a failed or short write has left beyond the end of the file.
@@@ -828,12 -973,12 +973,12 @@@ static ssize_t exfat_fallback_buffered_
 =20
  	inode_dio_wait(file_inode(iocb->ki_filp));
 =20
- 	written =3D iomap_file_buffered_write(iocb, from, exfat_write_iomap_next,
 -	written =3D iomap_file_buffered_write(&buffered, &source, &exfat_write_i=
omap_ops,
 -			&exfat_iomap_write_ops, NULL);
 -	if (written <=3D 0)
++	written =3D iomap_file_buffered_write(&buffered, &source, exfat_write_io=
map_next,
 +			NULL, NULL);
 +	if (written < 0)
  		return written;
 =20
- 	end =3D iocb->ki_pos + written - 1;
+ 	end =3D buffered.ki_pos - 1;
  	ret =3D filemap_write_and_wait_range(iocb->ki_filp->f_mapping,
  			offset, end);
  	if (ret)
@@@ -848,25 -996,101 +996,101 @@@
 =20
  static ssize_t exfat_dio_write_iter(struct kiocb *iocb, struct iov_iter *=
=66rom)
  {
+ 	struct inode *inode =3D file_inode(iocb->ki_filp);
+ 	struct block_device *bdev =3D inode->i_sb->s_bdev;
+ 	struct exfat_dio dio =3D { };
+ 	struct iov_iter source =3D *from;
+ 	struct iomap_dio *iomap_dio;
+ 	loff_t old_size =3D i_size_read(inode);
+ 	loff_t valid_size =3D exfat_get_valid_size(EXFAT_I(inode));
+ 	loff_t end =3D iocb->ki_pos + iov_iter_count(from);
  	ssize_t ret;
+ 	int error;
 =20
- 	ret =3D iomap_dio_rw(iocb, from, exfat_write_iomap_next,
- 			&exfat_write_dio_ops, 0, NULL, 0);
- 	if (ret =3D=3D -ENOTBLK)
- 		ret =3D 0;
- 	else if (ret < 0)
+ 	/* VDL extension must wait for outstanding overwrites. */
+ 	if (end > valid_size)
+ 		inode_dio_wait(inode);
+ 	ret =3D exfat_prepare_dio_range(inode, end);
+ 	if (ret)
  		return ret;
 =20
- 	if (iov_iter_count(from)) {
- 		ssize_t written;
-=20
- 		written =3D exfat_fallback_buffered_write(iocb, from);
- 		if (written < 0)
- 			return written;
- 		ret +=3D written;
+ 	if (end <=3D valid_size) {
+ 		/* Use existing mappings and allow asynchronous completion. */
 -		ret =3D iomap_dio_rw(iocb, from, &exfat_iomap_ops, NULL,
++		ret =3D iomap_dio_rw(iocb, from, exfat_iomap_next, NULL,
+ 				   IOMAP_DIO_OVERWRITE_ONLY, &valid_size, 0);
+ 		if (ret !=3D -ENOTBLK)
+ 			return ret;
+ 		goto buffered;
  	}
 =20
- 	return ret;
+ 	kiocb_clone(&dio.iocb, iocb, iocb->ki_filp);
+ 	dio.start =3D iocb->ki_pos;
+ 	/* User page faults can take invalidate_lock via page_mkwrite. */
+ 	iomap_dio =3D __iomap_dio_rw(&dio.iocb, &source,
 -				   &exfat_write_iomap_ops,
++				   exfat_write_iomap_next,
+ 				   &exfat_write_dio_ops,
+ 				   0, &dio, 0);
+=20
+ 	/* Serialize size updates, post-invalidation and gap completion. */
+ 	filemap_invalidate_lock(inode->i_mapping);
+ 	if (IS_ERR_OR_NULL(iomap_dio))
+ 		ret =3D PTR_ERR_OR_ZERO(iomap_dio);
+ 	else
+ 		ret =3D iomap_dio_complete(iomap_dio);
+ 	if (dio.completed) {
+ 		error =3D exfat_finish_dio_gap(&dio);
+ 		if (error) {
+ 			exfat_err(inode->i_sb,
+ 				  "write: fail to initialize direct I/O gap (%d)",
+ 				  error);
+ 			if (ret >=3D 0)
+ 				ret =3D error;
+ 		}
+ 	}
+ 	if (ret < 0) {
+ 		struct exfat_inode_info *ei =3D EXFAT_I(inode);
+ 		loff_t size =3D max(old_size, exfat_get_valid_size(ei));
+ 		loff_t initialized =3D max(exfat_get_valid_size(ei), dio.start);
+=20
+ 		if (size < i_size_read(inode)) {
+ 			truncate_setsize(inode, size);
+ 			exfat_truncate(inode);
+ 		}
+ 		/* Failed DIO may have changed the prepared invalid tail. */
+ 		if (exfat_get_zeroed_size(ei) > initialized)
+ 			exfat_set_zeroed_size(ei, initialized);
+ 	}
+ 	if (exfat_bytes_to_cluster(EXFAT_SB(inode->i_sb),
+ 				   exfat_ondisk_size(inode)) >
+ 	    exfat_bytes_to_cluster_round_up(EXFAT_SB(inode->i_sb),
+ 					    i_size_read(inode)))
+ 		exfat_truncate(inode);
+ 	filemap_invalidate_unlock(inode->i_mapping);
+=20
+ 	if (ret > 0) {
+ 		iocb->ki_pos =3D dio.iocb.ki_pos;
+ 		iov_iter_advance(from, ret);
+ 		return ret;
+ 	}
+ 	if (ret < 0 && ret !=3D -ENOTBLK)
+ 		return ret;
+=20
+ buffered:
+ 	/* Invalidation can fail before iomap checks alignment. */
+ 	if (((iocb->ki_pos | iov_iter_count(from)) &
+ 	     (bdev_logical_block_size(bdev) - 1)) ||
+ 	    (iov_iter_alignment(from) & bdev_dma_alignment(bdev)))
+ 		return -EINVAL;
+ 	if (user_backed_iter(from) && !from->nofault &&
+ 	    fault_in_iov_iter_readable(from, 1))
+ 		return -EFAULT;
+ 	if (iocb->ki_pos > exfat_get_valid_size(EXFAT_I(inode))) {
+ 		ret =3D exfat_extend_valid_size(inode, iocb->ki_pos);
+ 		if (ret)
+ 			return ret;
+ 	}
+=20
+ 	return exfat_fallback_buffered_write(iocb, from);
  }
 =20
  static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter =
*iter)
@@@ -921,7 -1150,8 +1150,8 @@@
  		 */
  		inode_dio_wait(inode);
  		ret =3D iomap_file_buffered_write(iocb, iter,
- 				exfat_write_iomap_next, NULL, NULL);
 -				&exfat_write_iomap_ops, &exfat_iomap_write_ops,
++				exfat_write_iomap_next, &exfat_iomap_write_ops,
+ 				NULL);
  	}
  	if (ret !=3D -EIOCBQUEUED && end > i_size_read(inode))
  		exfat_write_failed(inode);
@@@ -956,9 -1186,15 +1186,15 @@@ static ssize_t exfat_file_read_iter(str
  	inode_lock_shared(inode);
 =20
  	if (iocb->ki_flags & IOCB_DIRECT) {
+ 		/* Snapshot before writeback or destination faults can advance VDL. */
+ 		loff_t valid_size =3D exfat_get_valid_size(EXFAT_I(inode));
+=20
  		file_accessed(iocb->ki_filp);
 -		ret =3D iomap_dio_rw(iocb, iter, &exfat_iomap_ops, NULL, 0,
 +		ret =3D iomap_dio_rw(iocb, iter, exfat_iomap_next, NULL, 0,
- 				NULL, 0);
+ 				   &valid_size, 0);
+ 		if (ret >=3D 0 && iov_iter_count(iter) &&
+ 		    iocb->ki_pos < i_size_read(inode))
+ 			ret =3D filemap_read(iocb, iter, ret);
  	} else {
  		ret =3D generic_file_read_iter(iocb, iter);
  	}
@@@ -971,55 -1207,51 +1207,51 @@@
  static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
  {
  	struct inode *inode =3D file_inode(vmf->vma->vm_file);
+ 	struct address_space *mapping =3D inode->i_mapping;
  	struct exfat_inode_info *ei =3D EXFAT_I(inode);
+ 	struct folio *folio =3D page_folio(vmf->page);
+ 	loff_t fault_start =3D folio_pos(folio);
+ 	loff_t new_valid_size, gap_start;
  	vm_fault_t ret;
- 	loff_t new_valid_size, mmap_valid_size, fault_page_start;
+ 	int error;
 =20
- 	if (!inode_trylock(inode))
- 		return VM_FAULT_RETRY;
-=20
- 	mmap_valid_size =3D ((loff_t)vmf->pgoff + 1) << PAGE_SHIFT;
- 	fault_page_start =3D ((loff_t)vmf->pgoff) << PAGE_SHIFT;
- 	new_valid_size =3D min(mmap_valid_size, i_size_read(inode));
-=20
- 	if (exfat_get_valid_size(ei) < new_valid_size) {
- 		loff_t zeroed_size =3D exfat_get_zeroed_size(ei);
-=20
- 		if (zeroed_size < fault_page_start) {
- 			int err;
-=20
- 			/*
- 			 * Zero only the gap below the faulting page. The read
- 			 * fault populated its folio and iomap_page_mkwrite()
- 			 * will dirty it.
- 			 */
- 			err =3D exfat_prepare_valid_range(inode, zeroed_size,
- 					fault_page_start);
- 			if (err < 0) {
- 				inode_unlock(inode);
- 				return vmf_fs_error(err);
- 			}
- 		}
-=20
- 		/*
- 		 * Track zeroed_size by block, not page, because writeback stops
- 		 * at i_size recording blocks wholly beyond it could skip a
- 		 * later required zeroing.
- 		 */
- 		exfat_advance_zeroed_size(ei,
- 				round_up(new_valid_size, i_blocksize(inode)));
- 		exfat_set_valid_size(ei, new_valid_size);
- 		mark_inode_dirty(inode);
- 	}
+ 	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
+ 		return VM_FAULT_SIGBUS;
 =20
  	sb_start_pagefault(inode->i_sb);
- 	file_update_time(vmf->vma->vm_file);
+ 	error =3D file_update_time(vmf->vma->vm_file);
+ 	if (error) {
+ 		ret =3D vmf_fs_error(error);
+ 		goto out_pagefault;
+ 	}
+ 	filemap_invalidate_lock_shared(mapping);
+=20
+ 	if (folio->mapping !=3D mapping || fault_start >=3D i_size_read(inode)) {
+ 		ret =3D VM_FAULT_NOPAGE;
+ 		goto out_unlock;
+ 	}
+=20
+ 	/* The faulting folio is already populated; initialize only its gap. */
+ 	gap_start =3D max(exfat_get_valid_size(ei), exfat_get_zeroed_size(ei));
+ 	error =3D exfat_prepare_range(inode, gap_start, fault_start, true);
+ 	if (error) {
+ 		ret =3D vmf_fs_error(error);
+ 		goto out_unlock;
+ 	}
 =20
- 	filemap_invalidate_lock_shared(inode->i_mapping);
 -	ret =3D iomap_page_mkwrite(vmf, &exfat_iomap_ops, NULL);
 +	ret =3D iomap_page_mkwrite(vmf, exfat_iomap_next, NULL);
- 	filemap_invalidate_unlock_shared(inode->i_mapping);
+ 	if (ret =3D=3D VM_FAULT_LOCKED) {
+ 		/* Buffered write may have grown EOF before we locked the folio. */
+ 		new_valid_size =3D min(folio_next_pos(folio), i_size_read(inode));
+ 		exfat_advance_zeroed_size(ei,
+ 				round_up(new_valid_size, i_blocksize(inode)));
+ 		if (exfat_advance_valid_size(ei, new_valid_size))
+ 			mark_inode_dirty(inode);
+ 	}
+ out_unlock:
+ 	filemap_invalidate_unlock_shared(mapping);
+ out_pagefault:
  	sb_end_pagefault(inode->i_sb);
- 	inode_unlock(inode);
 =20
  	return ret;
  }

--U4eYdm7sgH4Q5PI0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr9qCoACgkQJNaLcl1U
h9BGtAf/S+bQKIujlkD8YB1mBG7jme2rU24X9pmTbXpw/B42VxOFY03BOV5AJ3XV
1bnwvLVRkNcSyEPUSOYwCqPHF1/0mIRw7dWCG0u38C6lbe9883HV0nU02J4UJGdL
O0O6PoSXKW2vdX52bV2nKjW/vihc5VJmpBZMQ+fxkt9HbxoffRuplHXn0aOtvmXf
Np7yF0a4Otco8yqcFXnPJOsFAQNpnqhEQvJ8T7gFcsSlmDsFjznxbDUamsHbybqT
CWgpjeZV1wemSd6+cnoRWoT1ENDfDNkKd0L966OpAMn4DQlMTgQ99PsWXOasOfPw
/2a1jbXcdp+O4w0GcWEK7sj1FmCwtQ==
=NS9h
-----END PGP SIGNATURE-----

--U4eYdm7sgH4Q5PI0--
