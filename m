From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Date: Fri, 3 May 2019 19:10:33 +1000
Message-ID: <20190503191033.6c56e4c0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/50NvD80NcihNTNGKrEpz2Nq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/50NvD80NcihNTNGKrEpz2Nq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/sync.c

between commit:

  22f96b3808c1 ("fs: add sync_file_range() helper")

from the block tree and commit:

  9a8d18789a18 ("fs/sync.c: sync_file_range(2) may use WB_SYNC_ALL writebac=
k")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/sync.c
index 01e82170545a,9e8cd90e890f..000000000000
--- a/fs/sync.c
+++ b/fs/sync.c
@@@ -292,10 -348,16 +292,16 @@@ int sync_file_range(struct file *file,=20
  	}
 =20
  	if (flags & SYNC_FILE_RANGE_WRITE) {
+ 		int sync_mode =3D WB_SYNC_NONE;
+=20
+ 		if ((flags & SYNC_FILE_RANGE_WRITE_AND_WAIT) =3D=3D
+ 			     SYNC_FILE_RANGE_WRITE_AND_WAIT)
+ 			sync_mode =3D WB_SYNC_ALL;
+=20
  		ret =3D __filemap_fdatawrite_range(mapping, offset, endbyte,
- 						 WB_SYNC_NONE);
+ 						 sync_mode);
  		if (ret < 0)
 -			goto out_put;
 +			goto out;
  	}
 =20
  	if (flags & SYNC_FILE_RANGE_WAIT_AFTER)
@@@ -305,68 -369,6 +311,71 @@@ out
  	return ret;
  }
 =20
 +/*
-  * sys_sync_file_range() permits finely controlled syncing over a segment=
 of
++ * ksys_sync_file_range() permits finely controlled syncing over a segmen=
t of
 + * a file in the range offset .. (offset+nbytes-1) inclusive.  If nbytes =
is
-  * zero then sys_sync_file_range() will operate from offset out to EOF.
++ * zero then ksys_sync_file_range() will operate from offset out to EOF.
 + *
 + * The flag bits are:
 + *
 + * SYNC_FILE_RANGE_WAIT_BEFORE: wait upon writeout of all pages in the ra=
nge
 + * before performing the write.
 + *
 + * SYNC_FILE_RANGE_WRITE: initiate writeout of all those dirty pages in t=
he
 + * range which are not presently under writeback. Note that this may bloc=
k for
 + * significant periods due to exhaustion of disk request structures.
 + *
 + * SYNC_FILE_RANGE_WAIT_AFTER: wait upon writeout of all pages in the ran=
ge
 + * after performing the write.
 + *
 + * Useful combinations of the flag bits are:
 + *
 + * SYNC_FILE_RANGE_WAIT_BEFORE|SYNC_FILE_RANGE_WRITE: ensures that all pa=
ges
-  * in the range which were dirty on entry to sys_sync_file_range() are pl=
aced
++ * in the range which were dirty on entry to ksys_sync_file_range() are p=
laced
 + * under writeout.  This is a start-write-for-data-integrity operation.
 + *
 + * SYNC_FILE_RANGE_WRITE: start writeout of all dirty pages in the range =
which
 + * are not presently under writeout.  This is an asynchronous flush-to-di=
sk
 + * operation.  Not suitable for data integrity operations.
 + *
 + * SYNC_FILE_RANGE_WAIT_BEFORE (or SYNC_FILE_RANGE_WAIT_AFTER): wait for
 + * completion of writeout of all pages in the range.  This will be used a=
fter an
 + * earlier SYNC_FILE_RANGE_WAIT_BEFORE|SYNC_FILE_RANGE_WRITE operation to=
 wait
 + * for that operation to complete and to return the result.
 + *
-  * SYNC_FILE_RANGE_WAIT_BEFORE|SYNC_FILE_RANGE_WRITE|SYNC_FILE_RANGE_WAIT=
_AFTER:
++ * SYNC_FILE_RANGE_WAIT_BEFORE|SYNC_FILE_RANGE_WRITE|SYNC_FILE_RANGE_WAIT=
_AFTER
++ * (a.k.a. SYNC_FILE_RANGE_WRITE_AND_WAIT):
 + * a traditional sync() operation.  This is a write-for-data-integrity op=
eration
 + * which will ensure that all pages in the range which were dirty on entr=
y to
-  * sys_sync_file_range() are committed to disk.
++ * ksys_sync_file_range() are committed to disk.  It should be noted that=
 disk
++ * caches are not flushed by this call, so there are no guarantees here t=
hat the
++ * data will be available on disk after a crash.
 + *
 + *
 + * SYNC_FILE_RANGE_WAIT_BEFORE and SYNC_FILE_RANGE_WAIT_AFTER will detect=
 any
 + * I/O errors or ENOSPC conditions and will return those to the caller, a=
fter
 + * clearing the EIO and ENOSPC flags in the address_space.
 + *
 + * It should be noted that none of these operations write out the file's
 + * metadata.  So unless the application is strictly performing overwrites=
 of
 + * already-instantiated disk blocks, there are no guarantees here that th=
e data
 + * will be available after a crash.
 + */
 +int ksys_sync_file_range(int fd, loff_t offset, loff_t nbytes,
 +			 unsigned int flags)
 +{
 +	int ret;
 +	struct fd f;
 +
 +	ret =3D -EBADF;
 +	f =3D fdget(fd);
 +	if (f.file)
 +		ret =3D sync_file_range(f.file, offset, nbytes, flags);
 +
 +	fdput(f);
 +	return ret;
 +}
 +
  SYSCALL_DEFINE4(sync_file_range, int, fd, loff_t, offset, loff_t, nbytes,
  				unsigned int, flags)
  {

--Sig_/50NvD80NcihNTNGKrEpz2Nq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzMBYkACgkQAVBC80lX
0GxNMwf/Qu+4OIxyC18LTMWiLlq/v2yt//xaEHH3u8b0ZI3i8IWdw0RQ/BUWDyHr
AWSuSnoS6NNxL0dN5a8TxtEuRwz+0bDosc8McDv4DvyPNU4EByq4BQR7vqoif97G
GDCX+rlb2Toa+ZbSwePvxvWTxqTi36OxoQ/4Okr8tASkjsd/j2nwU3LySjA8QBdR
jCIVQwdxt4gglBXrhUNIJSIO3stAKJjHtrDSLAIhxz80eC5D9R3oswoJMQ5IzYhX
9u0Dj0qNae951Xnm/s0Z9hNRs4Zq3POJJoHQo3BGvPQD7QpdyYZWGAABdtzst33U
LA94Y7DRU1eG+ouiNGUvY6RHzj6KgA==
=29qT
-----END PGP SIGNATURE-----

--Sig_/50NvD80NcihNTNGKrEpz2Nq--
