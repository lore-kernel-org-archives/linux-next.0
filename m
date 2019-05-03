From: Amir Goldstein <amir73il@gmail.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the block tree
Date: Fri, 3 May 2019 08:35:06 -0400
Message-ID: <CAOQ4uxikyWj5DMcCLt6kVzLeQt8dg=wMvaXE5vOfbDLaNiqJnw@mail.gmail.com>
References: <20190503191033.6c56e4c0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503191033.6c56e4c0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, May 3, 2019 at 5:10 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   fs/sync.c
>
> between commit:
>
>   22f96b3808c1 ("fs: add sync_file_range() helper")
>
> from the block tree and commit:
>
>   9a8d18789a18 ("fs/sync.c: sync_file_range(2) may use WB_SYNC_ALL writeback")
>
> from the akpm-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>

Fix looks technically correct, but it would have been better if the fat
comment moved to the fat helper and then replace
s/sys_sync_file_range/ksys_sync_file_range with
s/sys_sync_file_range/sync_file_range

It is probably best if either maintainer took both patches through his tree
and if move and update the comment from "sys_sync_file_range" be done
as part of the helper function patch.

Thanks,
Amir.

> --
> Cheers,
> Stephen Rothwell
>
> diff --cc fs/sync.c
> index 01e82170545a,9e8cd90e890f..000000000000
> --- a/fs/sync.c
> +++ b/fs/sync.c
> @@@ -292,10 -348,16 +292,16 @@@ int sync_file_range(struct file *file,
>         }
>
>         if (flags & SYNC_FILE_RANGE_WRITE) {
> +               int sync_mode = WB_SYNC_NONE;
> +
> +               if ((flags & SYNC_FILE_RANGE_WRITE_AND_WAIT) ==
> +                            SYNC_FILE_RANGE_WRITE_AND_WAIT)
> +                       sync_mode = WB_SYNC_ALL;
> +
>                 ret = __filemap_fdatawrite_range(mapping, offset, endbyte,
> -                                                WB_SYNC_NONE);
> +                                                sync_mode);
>                 if (ret < 0)
>  -                      goto out_put;
>  +                      goto out;
>         }
>
>         if (flags & SYNC_FILE_RANGE_WAIT_AFTER)
> @@@ -305,68 -369,6 +311,71 @@@ out
>         return ret;
>   }
>
>  +/*
> -  * sys_sync_file_range() permits finely controlled syncing over a segment of
> ++ * ksys_sync_file_range() permits finely controlled syncing over a segment of
>  + * a file in the range offset .. (offset+nbytes-1) inclusive.  If nbytes is
> -  * zero then sys_sync_file_range() will operate from offset out to EOF.
> ++ * zero then ksys_sync_file_range() will operate from offset out to EOF.
>  + *
>  + * The flag bits are:
>  + *
>  + * SYNC_FILE_RANGE_WAIT_BEFORE: wait upon writeout of all pages in the range
>  + * before performing the write.
>  + *
>  + * SYNC_FILE_RANGE_WRITE: initiate writeout of all those dirty pages in the
>  + * range which are not presently under writeback. Note that this may block for
>  + * significant periods due to exhaustion of disk request structures.
>  + *
>  + * SYNC_FILE_RANGE_WAIT_AFTER: wait upon writeout of all pages in the range
>  + * after performing the write.
>  + *
>  + * Useful combinations of the flag bits are:
>  + *
>  + * SYNC_FILE_RANGE_WAIT_BEFORE|SYNC_FILE_RANGE_WRITE: ensures that all pages
> -  * in the range which were dirty on entry to sys_sync_file_range() are placed
> ++ * in the range which were dirty on entry to ksys_sync_file_range() are placed
>  + * under writeout.  This is a start-write-for-data-integrity operation.
>  + *
>  + * SYNC_FILE_RANGE_WRITE: start writeout of all dirty pages in the range which
>  + * are not presently under writeout.  This is an asynchronous flush-to-disk
>  + * operation.  Not suitable for data integrity operations.
>  + *
>  + * SYNC_FILE_RANGE_WAIT_BEFORE (or SYNC_FILE_RANGE_WAIT_AFTER): wait for
>  + * completion of writeout of all pages in the range.  This will be used after an
>  + * earlier SYNC_FILE_RANGE_WAIT_BEFORE|SYNC_FILE_RANGE_WRITE operation to wait
>  + * for that operation to complete and to return the result.
>  + *
> -  * SYNC_FILE_RANGE_WAIT_BEFORE|SYNC_FILE_RANGE_WRITE|SYNC_FILE_RANGE_WAIT_AFTER:
> ++ * SYNC_FILE_RANGE_WAIT_BEFORE|SYNC_FILE_RANGE_WRITE|SYNC_FILE_RANGE_WAIT_AFTER
> ++ * (a.k.a. SYNC_FILE_RANGE_WRITE_AND_WAIT):
>  + * a traditional sync() operation.  This is a write-for-data-integrity operation
>  + * which will ensure that all pages in the range which were dirty on entry to
> -  * sys_sync_file_range() are committed to disk.
> ++ * ksys_sync_file_range() are committed to disk.  It should be noted that disk
> ++ * caches are not flushed by this call, so there are no guarantees here that the
> ++ * data will be available on disk after a crash.
>  + *
>  + *
>  + * SYNC_FILE_RANGE_WAIT_BEFORE and SYNC_FILE_RANGE_WAIT_AFTER will detect any
>  + * I/O errors or ENOSPC conditions and will return those to the caller, after
>  + * clearing the EIO and ENOSPC flags in the address_space.
>  + *
>  + * It should be noted that none of these operations write out the file's
>  + * metadata.  So unless the application is strictly performing overwrites of
>  + * already-instantiated disk blocks, there are no guarantees here that the data
>  + * will be available after a crash.
>  + */
>  +int ksys_sync_file_range(int fd, loff_t offset, loff_t nbytes,
>  +                       unsigned int flags)
>  +{
>  +      int ret;
>  +      struct fd f;
>  +
>  +      ret = -EBADF;
>  +      f = fdget(fd);
>  +      if (f.file)
>  +              ret = sync_file_range(f.file, offset, nbytes, flags);
>  +
>  +      fdput(f);
>  +      return ret;
>  +}
>  +
>   SYSCALL_DEFINE4(sync_file_range, int, fd, loff_t, offset, loff_t, nbytes,
>                                 unsigned int, flags)
>   {
