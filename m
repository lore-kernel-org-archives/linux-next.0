From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xfs tree with Linus' tree
Date: Mon, 20 Apr 2015 12:24:12 +1000
Message-ID: <20150420122412.440d6e66@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VhqFfrbFWi2G9aU7BNhXc_4"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47240 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751429AbbDTCYU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Apr 2015 22:24:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ben Myers <bpm@sgi.com>, David Chinner <david@fromorbit.com>, xfs@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

--Sig_/VhqFfrbFWi2G9aU7BNhXc_4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xfs tree got a conflict in
fs/xfs/xfs_file.c between commits 99733fa372ea
("xfs_file_aio_write_checks: switch to iocb/iov_iter") and 3309dd04cbcd
("switch generic_write_checks() to iocb and iter") from Linus' tree and
commits b9d59846f737 ("xfs: DIO write completion size updates race"),
40c63fbc55a9 ("xfs: direct IO EOF zeroing needs to drain AIO") and
0cefb29e6a63 ("xfs: using generic_file_direct_write() is unnecessary")
from the xfs tree.

I fixed it up (I have no idea if this is right - see below) and can
carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/xfs/xfs_file.c
index 1f12ad0a8585,3a5d305e60c9..000000000000
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@@ -544,22 -545,21 +544,22 @@@ xfs_zero_eof
   */
  STATIC ssize_t
  xfs_file_aio_write_checks(
 -	struct file		*file,
 -	loff_t			*pos,
 -	size_t			*count,
 +	struct kiocb		*iocb,
 +	struct iov_iter		*from,
  	int			*iolock)
  {
 +	struct file		*file =3D iocb->ki_filp;
  	struct inode		*inode =3D file->f_mapping->host;
  	struct xfs_inode	*ip =3D XFS_I(inode);
 -	int			error =3D 0;
 +	ssize_t			error =3D 0;
 +	size_t			count =3D iov_iter_count(from);
 =20
  restart:
 -	error =3D generic_write_checks(file, pos, count, S_ISBLK(inode->i_mode));
 -	if (error)
 +	error =3D generic_write_checks(iocb, from);
 +	if (error <=3D 0)
  		return error;
 =20
- 	error =3D xfs_break_layouts(inode, iolock);
+ 	error =3D xfs_break_layouts(inode, iolock, true);
  	if (error)
  		return error;
 =20
@@@ -569,21 -569,41 +569,42 @@@
  	 * write.  If zeroing is needed and we are currently holding the
  	 * iolock shared, we need to update it to exclusive which implies
  	 * having to redo all checks before.
+ 	 *
+ 	 * We need to serialise against EOF updates that occur in IO
+ 	 * completions here. We want to make sure that nobody is changing the
+ 	 * size while we do this check until we have placed an IO barrier (i.e.
+ 	 * hold the XFS_IOLOCK_EXCL) that prevents new IO from being dispatched.
+ 	 * The spinlock effectively forms a memory barrier once we have the
+ 	 * XFS_IOLOCK_EXCL so we are guaranteed to see the latest EOF value
+ 	 * and hence be able to correctly determine if we need to run zeroing.
  	 */
+ 	spin_lock(&ip->i_flags_lock);
 -	if (*pos > i_size_read(inode)) {
 +	if (iocb->ki_pos > i_size_read(inode)) {
  		bool	zero =3D false;
 =20
+ 		spin_unlock(&ip->i_flags_lock);
  		if (*iolock =3D=3D XFS_IOLOCK_SHARED) {
  			xfs_rw_iunlock(ip, *iolock);
  			*iolock =3D XFS_IOLOCK_EXCL;
  			xfs_rw_ilock(ip, *iolock);
 +			iov_iter_reexpand(from, count);
+=20
+ 			/*
+ 			 * We now have an IO submission barrier in place, but
+ 			 * AIO can do EOF updates during IO completion and hence
+ 			 * we now need to wait for all of them to drain. Non-AIO
+ 			 * DIO will have drained before we are given the
+ 			 * XFS_IOLOCK_EXCL, and so for most cases this wait is a
+ 			 * no-op.
+ 			 */
+ 			inode_dio_wait(inode);
  			goto restart;
  		}
 -		error =3D xfs_zero_eof(ip, *pos, i_size_read(inode), &zero);
 +		error =3D xfs_zero_eof(ip, iocb->ki_pos, i_size_read(inode), &zero);
  		if (error)
  			return error;
- 	}
+ 	} else
+ 		spin_unlock(&ip->i_flags_lock);
 =20
  	/*
  	 * Updating the timestamps will grab the ilock again from
@@@ -680,11 -702,11 +703,12 @@@ xfs_file_dio_aio_write
  		xfs_rw_ilock(ip, iolock);
  	}
 =20
 -	ret =3D xfs_file_aio_write_checks(file, &pos, &count, &iolock);
 +	ret =3D xfs_file_aio_write_checks(iocb, from, &iolock);
  	if (ret)
  		goto out;
 -	iov_iter_truncate(from, count);
 +	count =3D iov_iter_count(from);
 +	pos =3D iocb->ki_pos;
+ 	end =3D pos + count - 1;
 =20
  	if (mapping->nrpages) {
  		ret =3D filemap_write_and_wait_range(VFS_I(ip)->i_mapping,
@@@ -1385,8 -1449,59 +1449,57 @@@ xfs_file_llseek
  	}
  }
 =20
+ /*
+  * Locking for serialisation of IO during page faults. This results in a =
lock
+  * ordering of:
+  *
+  * mmap_sem (MM)
+  *   i_mmap_lock (XFS - truncate serialisation)
+  *     page_lock (MM)
+  *       i_lock (XFS - extent map serialisation)
+  */
+ STATIC int
+ xfs_filemap_fault(
+ 	struct vm_area_struct	*vma,
+ 	struct vm_fault		*vmf)
+ {
+ 	struct xfs_inode	*ip =3D XFS_I(vma->vm_file->f_mapping->host);
+ 	int			error;
+=20
+ 	trace_xfs_filemap_fault(ip);
+=20
+ 	xfs_ilock(ip, XFS_MMAPLOCK_SHARED);
+ 	error =3D filemap_fault(vma, vmf);
+ 	xfs_iunlock(ip, XFS_MMAPLOCK_SHARED);
+=20
+ 	return error;
+ }
+=20
+ /*
+  * mmap()d file has taken write protection fault and is being made writab=
le. We
+  * can set the page state up correctly for a writable page, which means w=
e can
+  * do correct delalloc accounting (ENOSPC checking!) and unwritten extent
+  * mapping.
+  */
+ STATIC int
+ xfs_filemap_page_mkwrite(
+ 	struct vm_area_struct	*vma,
+ 	struct vm_fault		*vmf)
+ {
+ 	struct xfs_inode	*ip =3D XFS_I(vma->vm_file->f_mapping->host);
+ 	int			error;
+=20
+ 	trace_xfs_filemap_page_mkwrite(ip);
+=20
+ 	xfs_ilock(ip, XFS_MMAPLOCK_SHARED);
+ 	error =3D block_page_mkwrite(vma, vmf, xfs_get_blocks);
+ 	xfs_iunlock(ip, XFS_MMAPLOCK_SHARED);
+=20
+ 	return error;
+ }
+=20
  const struct file_operations xfs_file_operations =3D {
  	.llseek		=3D xfs_file_llseek,
 -	.read		=3D new_sync_read,
 -	.write		=3D new_sync_write,
  	.read_iter	=3D xfs_file_read_iter,
  	.write_iter	=3D xfs_file_write_iter,
  	.splice_read	=3D xfs_file_splice_read,

--Sig_/VhqFfrbFWi2G9aU7BNhXc_4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVNGNQAAoJEMDTa8Ir7ZwV35oP/AreQVucITBQMJzLwAeFKrwA
2CFGinFu6YA+O9sAJ0EegoNhjPfoyKVw3SKTCDstxDqRWNkk2YAaivqhErVuTc8r
hyD4WKqSAWyqARODvsJCCX+lqpI8+/Midb80OYWHCyglIen93wRBAY8+L12jFNiW
WSs+0VUp0aNWVTF7pgkBb+Snfp7LIOCdJktUifT16fLrOA0G57Sis8M0M0+Jcb7w
acFG7e/AmSVH4jhcxppW4qz/te7kNIoZ2ihH+RNkU6PGeyhwHhsrZX9Xp6z4vMQm
A4E447ro4mNNyrQziS3gc9E0AYmUqf/ZCqBCzA/mk2oO0+Np85E25MP8RTcuoFN0
ow4ZXoYPEkAqXLc/naB1r0njWinC+oYmBus41uaz2hzTIGHOcu19UKA5y7gF7Lms
LR1mk1MoW+B/3i5zVfdxfmpxbnQZaFoNTBezqedek1HJHb/nxGjGZe+7SJU4zgXy
1keJDViIU35fceeuYwlAZYriYItSaSN3/B94uPz5JqKi6rqyh/F/U6YpSdNwo5+N
IMrs16WYwREOFCdiYv8qrAANjUQTXx7Y8Y7hC4WSLTBa6EwoX3rkaLrihSipX545
pS8jhb52od2hIRt0I9XWtJNXTo5ZmmHoZhQLfPPXZaxtPMRXdcswr6XkOMT4v5Lo
aNI4sVHYuriCiAM2dkEK
=4BXy
-----END PGP SIGNATURE-----

--Sig_/VhqFfrbFWi2G9aU7BNhXc_4--
