Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3C12C027B;
	Fri, 27 Mar 2026 17:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632955; cv=none; b=LgfZ+RPNKZg5kwd3Hx8ruawa3nO70xuzFm6Vgad3Xj579UFMWCMzvXgfCP5qaCqlh8OgSs54uZeLig9FMktnyUMan0DH8qxxi+qdTvxKAqihqbO3TuyrrSuyZPZqpa10vt3fwsQX0gPAmdOw0gDHsyzVoLG89HCsFLJxxQ6KsoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632955; c=relaxed/simple;
	bh=qx/RILgUU3hjsdhDiGiqHnP6GuiPe/PydbGPe+2HGAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hl4ofcENAwhj3eJyf2AqNbkiXL1WBAxmQW2mtuGUQkEXtA9eZTSzMcyHfpwcthjn9oQeHgKTgZlwRLdVkoa0gsKP+pgoTU3ndGC+VZsM5OA3pkwgHIjctcWZM+73Z+LAF/b52qvI77NdblyemacW62Norm8J6R/OW0kPCJsGjK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqQMKw8l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqQMKw8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642E0C19423;
	Fri, 27 Mar 2026 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774632954;
	bh=qx/RILgUU3hjsdhDiGiqHnP6GuiPe/PydbGPe+2HGAg=;
	h=Date:From:To:Cc:Subject:From;
	b=WqQMKw8lU3+44Ghveo+Vk2KJ9dQon7El0usV0L9grfV13AIK8MU0pyAD/wusoYhk9
	 KBdSEWdLh0OUfnxQkyIigqdzyb9VA5FaX67bwYRojo8MryfDzDN441AgzmL8s/QM9p
	 Z8yxfKPaVi4GqxSA2bjl1A1G/qQswwClEjCAKVm+UxvO1UyB+qNNwicS9L/aVOJ2Fe
	 9qEmnMiAlt6SvGBPAA56fmUQQGFKZwBwcDjua5WTTq90es1ch3aB57iLhQVi7w2gMx
	 b7EvEoU8IieNcLgBq2CvFfc6chSiMUbHxp/4XV32vSU/iMHyi+cxJL+xJ49OWWjAT5
	 7+DpRm1RbeSWA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BD52B1AC5847; Fri, 27 Mar 2026 17:35:51 +0000 (GMT)
Date: Fri, 27 Mar 2026 17:35:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the exfat tree
Message-ID: <aca_9wyB29931jgP@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u1hNvFWAry1na15r"
Content-Disposition: inline


--u1hNvFWAry1na15r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/exfat/file.c

between commit:

  9b373eacd6e6c4 ("exfat: add iomap buffered I/O support")

=66rom the exfat tree and commit:

  5f36c9ca333360 ("fs: Rename generic_file_fsync() to simple_fsync()")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating

diff --combined fs/exfat/file.c
index 9a30c32b3a0526,4e8d34a75b6638..00000000000000
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@@ -13,12 -13,9 +13,12 @@@
  #include <linux/msdos_fs.h>
  #include <linux/writeback.h>
  #include <linux/filelock.h>
 +#include <linux/falloc.h>
 +#include <linux/iomap.h>
 =20
  #include "exfat_raw.h"
  #include "exfat_fs.h"
 +#include "iomap.h"
 =20
  static int exfat_cont_expand(struct inode *inode, loff_t size)
  {
@@@ -57,7 -54,7 +57,7 @@@
  	clu.flags =3D ei->flags;
 =20
  	ret =3D exfat_alloc_cluster(inode, new_num_clusters - num_clusters,
 -			&clu, inode_needs_sync(inode));
 +			&clu, inode_needs_sync(inode), false);
  	if (ret)
  		return ret;
 =20
@@@ -93,45 -90,6 +93,45 @@@ free_clu
  	return -EIO;
  }
 =20
 +/*
 + * Preallocate space for a file. This implements exfat's fallocate file
 + * operation, which gets called from sys_fallocate system call. User space
 + * requests len bytes at offset. In contrary to fat, we only support
 + * FALLOC_FL_ALLOCATE_RANGE because by leaving the valid data length(VDL)
 + * field, it is unnecessary to zero out the newly allocated clusters.
 + */
 +static long exfat_fallocate(struct file *file, int mode,
 +			  loff_t offset, loff_t len)
 +{
 +	struct inode *inode =3D file->f_mapping->host;
 +	loff_t newsize =3D offset + len;
 +	int err =3D 0;
 +
 +	/* No support for other modes */
 +	if (mode !=3D FALLOC_FL_ALLOCATE_RANGE)
 +		return -EOPNOTSUPP;
 +
 +	/* No support for dir */
 +	if (!S_ISREG(inode->i_mode))
 +		return -EOPNOTSUPP;
 +
 +	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
 +		return -EIO;
 +
 +	inode_lock(inode);
 +
 +	if (newsize <=3D i_size_read(inode))
 +		goto error;
 +
 +	/* This is just an expanding truncate */
 +	err =3D exfat_cont_expand(inode, newsize);
 +
 +error:
 +	inode_unlock(inode);
 +
 +	return err;
 +}
 +
  static bool exfat_allow_set_time(struct mnt_idmap *idmap,
  				 struct exfat_sb_info *sbi, struct inode *inode)
  {
@@@ -337,18 -295,7 +337,18 @@@ int exfat_setattr(struct mnt_idmap *idm
 =20
  	if ((attr->ia_valid & ATTR_SIZE) &&
  	    attr->ia_size > i_size_read(inode)) {
 +		loff_t old_size =3D i_size_read(inode);
 +
  		error =3D exfat_cont_expand(inode, attr->ia_size);
 +		if (!error && attr->ia_size > old_size &&
 +		    old_size % PAGE_SIZE !=3D 0) {
 +			loff_t len =3D min_t(loff_t,
 +					round_up(old_size, PAGE_SIZE) - old_size,
 +					attr->ia_size - old_size);
 +			error =3D iomap_zero_range(inode, old_size, len,
 +					NULL, &exfat_read_iomap_ops,
 +					&exfat_iomap_folio_ops, NULL);
 +		}
  		if (error || attr->ia_valid =3D=3D ATTR_SIZE)
  			return error;
  		attr->ia_valid &=3D ~ATTR_SIZE;
@@@ -395,10 -342,7 +395,10 @@@
  	exfat_truncate_inode_atime(inode);
 =20
  	if (attr->ia_valid & ATTR_SIZE) {
 -		error =3D exfat_block_truncate_page(inode, attr->ia_size);
 +		inode_dio_wait(inode);
 +		error =3D iomap_truncate_page(inode, attr->ia_size, NULL,
 +				&exfat_read_iomap_ops,
 +				&exfat_iomap_folio_ops, NULL);
  		if (error)
  			goto out;
 =20
@@@ -633,14 -577,10 +633,14 @@@ int exfat_file_fsync(struct file *filp
  	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
  		return -EIO;
 =20
 -	err =3D simple_fsync_noflush(filp, start, end, datasync);
 +	err =3D file_write_and_wait_range(filp, start, end);
  	if (err)
  		return err;
 =20
 +	if (!datasync)
 +		err =3D __exfat_write_inode(inode, 1);
 +	write_inode_now(inode, !datasync);
 +
  	err =3D sync_blockdev(inode->i_sb->s_bdev);
  	if (err)
  		return err;
@@@ -648,72 -588,44 +648,72 @@@
  	return blkdev_issue_flush(inode->i_sb->s_bdev);
  }
 =20
 -static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_=
size)
 +int exfat_extend_valid_size(struct inode *inode, loff_t off, bool bsync)
  {
 -	int err;
 -	loff_t pos;
  	struct exfat_inode_info *ei =3D EXFAT_I(inode);
 -	struct address_space *mapping =3D inode->i_mapping;
 -	const struct address_space_operations *ops =3D mapping->a_ops;
 +	struct exfat_sb_info *sbi =3D EXFAT_SB(inode->i_sb);
 +	loff_t old_valid_size;
 +	int ret =3D 0;
 =20
 -	pos =3D ei->valid_size;
 -	while (pos < new_valid_size) {
 -		u32 len;
 -		struct folio *folio;
 -		unsigned long off;
 +	mutex_lock(&sbi->s_lock);
 +	old_valid_size =3D ei->valid_size;
 +	mutex_unlock(&sbi->s_lock);
 =20
 -		len =3D PAGE_SIZE - (pos & (PAGE_SIZE - 1));
 -		if (pos + len > new_valid_size)
 -			len =3D new_valid_size - pos;
 -
 -		err =3D ops->write_begin(NULL, mapping, pos, len, &folio, NULL);
 -		if (err)
 -			goto out;
 -
 -		off =3D offset_in_folio(folio, pos);
 -		folio_zero_new_buffers(folio, off, off + len);
 -
 -		err =3D ops->write_end(NULL, mapping, pos, len, len, folio, NULL);
 -		if (err < 0)
 -			goto out;
 -		pos +=3D len;
 -
 -		balance_dirty_pages_ratelimited(mapping);
 -		cond_resched();
 +	if (old_valid_size < off) {
 +		ret =3D iomap_zero_range(inode, old_valid_size,
 +				off - old_valid_size, NULL,
 +				&exfat_write_iomap_ops, &exfat_iomap_folio_ops,
 +				NULL);
 +		if (!ret && bsync)
 +			ret =3D filemap_write_and_wait_range(inode->i_mapping,
 +							   old_valid_size,
 +							   off - 1);
  	}
 =20
 -	return 0;
 +	return ret;
 +}
 =20
 +static ssize_t exfat_dio_write_iter(struct kiocb *iocb, struct iov_iter *=
=66rom)
 +{
 +	ssize_t ret;
 +
 +	ret =3D iomap_dio_rw(iocb, from, &exfat_write_iomap_ops,
 +			&exfat_write_dio_ops, 0, NULL, 0);
 +	if (ret =3D=3D -ENOTBLK)
 +		ret =3D 0;
 +	else if (ret < 0)
 +		goto out;
 +
 +	if (iov_iter_count(from)) {
 +		loff_t offset, end;
 +		ssize_t written;
 +		int ret2;
 +
 +		offset =3D iocb->ki_pos;
 +		iocb->ki_flags &=3D ~IOCB_DIRECT;
 +		written =3D iomap_file_buffered_write(iocb, from,
 +				&exfat_write_iomap_ops, &exfat_iomap_folio_ops,
 +				NULL);
 +		if (written < 0) {
 +			ret =3D written;
 +			goto out;
 +		}
 +
 +		ret +=3D written;
 +		end =3D iocb->ki_pos + written - 1;
 +		ret2 =3D filemap_write_and_wait_range(iocb->ki_filp->f_mapping,
 +				offset, end);
 +		if (ret2) {
 +			ret =3D -EIO;
 +			goto out;
 +		}
 +		if (!ret2)
 +			invalidate_mapping_pages(iocb->ki_filp->f_mapping,
 +					offset >> PAGE_SHIFT,
 +					end >> PAGE_SHIFT);
 +	}
  out:
 -	return err;
 +	return ret;
  }
 =20
  static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter =
*iter)
@@@ -724,7 -636,6 +724,7 @@@
  	struct exfat_inode_info *ei =3D EXFAT_I(inode);
  	loff_t pos =3D iocb->ki_pos;
  	loff_t valid_size;
 +	int err;
 =20
  	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
  		return -EIO;
@@@ -740,18 -651,28 +740,18 @@@
  	if (ret <=3D 0)
  		goto unlock;
 =20
 -	if (iocb->ki_flags & IOCB_DIRECT) {
 -		unsigned long align =3D pos | iov_iter_alignment(iter);
 -
 -		if (!IS_ALIGNED(align, i_blocksize(inode)) &&
 -		    !IS_ALIGNED(align, bdev_logical_block_size(inode->i_sb->s_bdev))) {
 -			ret =3D -EINVAL;
 -			goto unlock;
 -		}
 +	err =3D file_modified(iocb->ki_filp);
 +	if (err) {
 +		ret =3D err;
 +		goto unlock;
  	}
 =20
 -	if (pos > valid_size) {
 -		ret =3D exfat_extend_valid_size(inode, pos);
 -		if (ret < 0 && ret !=3D -ENOSPC) {
 -			exfat_err(inode->i_sb,
 -				"write: fail to zero from %llu to %llu(%zd)",
 -				valid_size, pos, ret);
 -		}
 -		if (ret < 0)
 -			goto unlock;
 -	}
 -
 -	ret =3D __generic_file_write_iter(iocb, iter);
 +	if (iocb->ki_flags & IOCB_DIRECT)
 +		ret =3D exfat_dio_write_iter(iocb, iter);
 +	else
 +		ret =3D iomap_file_buffered_write(iocb, iter,
 +				&exfat_write_iomap_ops, &exfat_iomap_folio_ops,
 +				NULL);
  	if (ret < 0)
  		goto unlock;
 =20
@@@ -778,52 -699,37 +778,52 @@@ unlock
  static ssize_t exfat_file_read_iter(struct kiocb *iocb, struct iov_iter *=
iter)
  {
  	struct inode *inode =3D file_inode(iocb->ki_filp);
 +	ssize_t ret;
 =20
  	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
  		return -EIO;
 =20
 -	return generic_file_read_iter(iocb, iter);
 +	inode_lock_shared(inode);
 +
 +	if (iocb->ki_flags & IOCB_DIRECT) {
 +		size_t count =3D iov_iter_count(iter);
 +
 +		if ((iocb->ki_pos | count) & (inode->i_sb->s_blocksize - 1)) {
 +			ret =3D -EINVAL;
 +			goto inode_unlock;
 +		}
 +
 +		file_accessed(iocb->ki_filp);
 +		ret =3D iomap_dio_rw(iocb, iter, &exfat_read_iomap_ops, NULL, 0,
 +				NULL, 0);
 +	} else {
 +		ret =3D generic_file_read_iter(iocb, iter);
 +	}
 +
 +inode_unlock:
 +	inode_unlock_shared(inode);
 +
 +	return ret;
  }
 =20
  static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
  {
 -	int err;
  	struct inode *inode =3D file_inode(vmf->vma->vm_file);
 -	struct exfat_inode_info *ei =3D EXFAT_I(inode);
 -	loff_t new_valid_size;
 +	vm_fault_t ret;
 =20
  	if (!inode_trylock(inode))
  		return VM_FAULT_RETRY;
 =20
 -	new_valid_size =3D ((loff_t)vmf->pgoff + 1) << PAGE_SHIFT;
 -	new_valid_size =3D min(new_valid_size, i_size_read(inode));
 -
 -	if (ei->valid_size < new_valid_size) {
 -		err =3D exfat_extend_valid_size(inode, new_valid_size);
 -		if (err < 0) {
 -			inode_unlock(inode);
 -			return vmf_fs_error(err);
 -		}
 -	}
 +	sb_start_pagefault(inode->i_sb);
 +	file_update_time(vmf->vma->vm_file);
 =20
 +	filemap_invalidate_lock_shared(inode->i_mapping);
 +	ret =3D iomap_page_mkwrite(vmf, &exfat_mkwrite_iomap_ops, NULL);
 +	filemap_invalidate_unlock_shared(inode->i_mapping);
 +	sb_end_pagefault(inode->i_sb);
  	inode_unlock(inode);
 =20
 -	return filemap_page_mkwrite(vmf);
 +	return ret;
  }
 =20
  static const struct vm_operations_struct exfat_file_vm_ops =3D {
@@@ -839,21 -745,6 +839,21 @@@ static int exfat_file_mmap_prepare(stru
  	if (unlikely(exfat_forced_shutdown(file_inode(desc->file)->i_sb)))
  		return -EIO;
 =20
 +	if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
 +		struct inode *inode =3D file_inode(file);
 +		loff_t from, to;
 +		int err;
 +
 +		from =3D ((loff_t)desc->pgoff << PAGE_SHIFT);
 +		to =3D min_t(loff_t, i_size_read(inode),
 +				from + vma_desc_size(desc));
 +		if (EXFAT_I(inode)->valid_size < to) {
 +			err =3D exfat_extend_valid_size(inode, to, false);
 +			if (err)
 +				return err;
 +		}
 +	}
 +
  	file_accessed(file);
  	desc->vm_ops =3D &exfat_file_vm_ops;
  	return 0;
@@@ -868,50 -759,8 +868,50 @@@ static ssize_t exfat_splice_read(struc
  	return filemap_splice_read(in, ppos, pipe, len, flags);
  }
 =20
 +static int exfat_file_open(struct inode *inode, struct file *filp)
 +{
 +	int err;
 +
 +	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
 +		return -EIO;
 +
 +	err =3D generic_file_open(inode, filp);
 +	if (err)
 +		return err;
 +
 +	filp->f_mode |=3D FMODE_CAN_ODIRECT;
 +
 +	return 0;
 +}
 +
 +static loff_t exfat_file_llseek(struct file *file, loff_t offset, int whe=
nce)
 +{
 +	struct inode *inode =3D file->f_mapping->host;
 +
 +	switch (whence) {
 +	case SEEK_HOLE:
 +		inode_lock_shared(inode);
 +		offset =3D iomap_seek_hole(inode, offset, &exfat_read_iomap_ops);
 +		inode_unlock_shared(inode);
 +		break;
 +	case SEEK_DATA:
 +		inode_lock_shared(inode);
 +		offset =3D iomap_seek_data(inode, offset, &exfat_read_iomap_ops);
 +		inode_unlock_shared(inode);
 +		break;
 +	default:
 +		return generic_file_llseek_size(file, offset, whence,
 +						inode->i_sb->s_maxbytes,
 +						i_size_read(inode));
 +	}
 +	if (offset < 0)
 +		return offset;
 +	return vfs_setpos(file, offset, inode->i_sb->s_maxbytes);
 +}
 +
  const struct file_operations exfat_file_operations =3D {
 -	.llseek		=3D generic_file_llseek,
 +	.open		=3D exfat_file_open,
 +	.llseek		=3D exfat_file_llseek,
  	.read_iter	=3D exfat_file_read_iter,
  	.write_iter	=3D exfat_file_write_iter,
  	.unlocked_ioctl =3D exfat_ioctl,
@@@ -922,7 -771,6 +922,7 @@@
  	.fsync		=3D exfat_file_fsync,
  	.splice_read	=3D exfat_splice_read,
  	.splice_write	=3D iter_file_splice_write,
 +	.fallocate	=3D exfat_fallocate,
  	.setlease	=3D generic_setlease,
  };
 =20
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--u1hNvFWAry1na15r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnGv/YACgkQJNaLcl1U
h9An8Af/fOfnl7TQjjciVO+0wUhoS03q4wmheIOhRrzYoR7loy57v01bXjXuZXeZ
9tlY4kf2s/ptJlmuUqZdGbjiraawhOscmRKE25Kx84XfvFs9ZHspgwDXCT/a+Tlc
y+/G5L7uDNobKEOWNuD6934BreQfys4dclS0XhIl0L3IX2RPuMMgj9Vm+UKSoSAl
mFLzUZKmzLnXUwDzQba0DrjBtjR9Q2YrCscPy446V9l6uILX6t9no2zY5uw4xko1
hmmV4lB0WZ2rmpZYlcf8KS6oTPRD6Tri+wtMyf3CWSxJUq02FeiyYS2d7OqiiCZw
Nae4mIR8x76G6zTFiAMDIqe+jnnjtw==
=Gg0c
-----END PGP SIGNATURE-----

--u1hNvFWAry1na15r--
