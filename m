From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with Linus' tree
Date: Tue, 10 Nov 2015 12:24:38 +1100
Message-ID: <20151110122438.30cae894@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53834 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750727AbbKJBYk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Nov 2015 20:24:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@fb.com>

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  block/ioctl.c

between commits:

  d8e4bb8103df ("block: cleanup blkdev_ioctl")
  bbd3e064362e ("block: add an API for Persistent Reservations")

from Linus' tree and commit:

  49bfa9c5511e ("block: enable dax for raw block devices")
  abcc9ebd68ab ("block, dax: opt-in control for raw block dax support")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

Is that new stuff in the nvdimm tree really meant for v4.4?  If not,
please remove it until -rc1 has been released.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc block/ioctl.c
index 0918aed2d847,a353bcd29987..000000000000
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@@ -406,115 -295,135 +406,162 @@@ static inline int is_unrecognized_ioctl
  		ret == -ENOIOCTLCMD;
  }
  
+ #ifdef CONFIG_FS_DAX
+ bool blkdev_dax_capable(struct block_device *bdev)
+ {
+ 	struct gendisk *disk = bdev->bd_disk;
+ 
+ 	if (!disk->fops->direct_access)
+ 		return false;
+ 
+ 	/*
+ 	 * If the partition is not aligned on a page boundary, we can't
+ 	 * do dax I/O to it.
+ 	 */
+ 	if ((bdev->bd_part->start_sect % (PAGE_SIZE / 512))
+ 			|| (bdev->bd_part->nr_sects % (PAGE_SIZE / 512)))
+ 		return false;
+ 
+ 	return true;
+ }
+ 
+ static int blkdev_set_dax(struct block_device *bdev, int n)
+ {
+ 	int rc = 0;
+ 
+ 	if (n)
+ 		n = S_DAX;
+ 
+ 	if (n && !blkdev_dax_capable(bdev))
+ 		return -ENOTTY;
+ 
+ 	mutex_lock(&bdev->bd_inode->i_mutex);
+ 	if (bdev->bd_map_count == 0)
+ 		inode_set_flags(bdev->bd_inode, n, S_DAX);
+ 	else
+ 		rc = -EBUSY;
+ 	mutex_unlock(&bdev->bd_inode->i_mutex);
+ 	return rc;
+ }
+ #else
+ static int blkdev_set_dax(struct block_device *bdev, int n)
+ {
+ 	if (n)
+ 		return -ENOTTY;
+ 	return 0;
+ }
+ #endif
+ 
 -/*
 - * always keep this in sync with compat_blkdev_ioctl()
 - */
 -int blkdev_ioctl(struct block_device *bdev, fmode_t mode, unsigned cmd,
 -			unsigned long arg)
 +static int blkdev_flushbuf(struct block_device *bdev, fmode_t mode,
 +		unsigned cmd, unsigned long arg)
  {
 -	struct gendisk *disk = bdev->bd_disk;
 -	struct backing_dev_info *bdi;
 -	loff_t size;
 -	int ret, n;
 -	unsigned int max_sectors;
 +	int ret;
  
 -	switch(cmd) {
 -	case BLKFLSBUF:
 -		if (!capable(CAP_SYS_ADMIN))
 -			return -EACCES;
 +	if (!capable(CAP_SYS_ADMIN))
 +		return -EACCES;
  
 -		ret = __blkdev_driver_ioctl(bdev, mode, cmd, arg);
 -		if (!is_unrecognized_ioctl(ret))
 -			return ret;
 +	ret = __blkdev_driver_ioctl(bdev, mode, cmd, arg);
 +	if (!is_unrecognized_ioctl(ret))
 +		return ret;
  
 -		fsync_bdev(bdev);
 -		invalidate_bdev(bdev);
 -		return 0;
 +	fsync_bdev(bdev);
 +	invalidate_bdev(bdev);
 +	return 0;
 +}
  
 -	case BLKROSET:
 -		ret = __blkdev_driver_ioctl(bdev, mode, cmd, arg);
 -		if (!is_unrecognized_ioctl(ret))
 -			return ret;
 -		if (!capable(CAP_SYS_ADMIN))
 -			return -EACCES;
 -		if (get_user(n, (int __user *)(arg)))
 -			return -EFAULT;
 -		set_device_ro(bdev, n);
 -		return 0;
 +static int blkdev_roset(struct block_device *bdev, fmode_t mode,
 +		unsigned cmd, unsigned long arg)
 +{
 +	int ret, n;
  
 -	case BLKDISCARD:
 -	case BLKSECDISCARD: {
 -		uint64_t range[2];
 +	ret = __blkdev_driver_ioctl(bdev, mode, cmd, arg);
 +	if (!is_unrecognized_ioctl(ret))
 +		return ret;
 +	if (!capable(CAP_SYS_ADMIN))
 +		return -EACCES;
 +	if (get_user(n, (int __user *)arg))
 +		return -EFAULT;
 +	set_device_ro(bdev, n);
 +	return 0;
 +}
  
 -		if (!(mode & FMODE_WRITE))
 -			return -EBADF;
 +static int blkdev_getgeo(struct block_device *bdev,
 +		struct hd_geometry __user *argp)
 +{
 +	struct gendisk *disk = bdev->bd_disk;
 +	struct hd_geometry geo;
 +	int ret;
  
 -		if (copy_from_user(range, (void __user *)arg, sizeof(range)))
 -			return -EFAULT;
 +	if (!argp)
 +		return -EINVAL;
 +	if (!disk->fops->getgeo)
 +		return -ENOTTY;
  
 -		return blk_ioctl_discard(bdev, range[0], range[1],
 -					 cmd == BLKSECDISCARD);
 -	}
 -	case BLKZEROOUT: {
 -		uint64_t range[2];
 +	/*
 +	 * We need to set the startsect first, the driver may
 +	 * want to override it.
 +	 */
 +	memset(&geo, 0, sizeof(geo));
 +	geo.start = get_start_sect(bdev);
 +	ret = disk->fops->getgeo(bdev, &geo);
 +	if (ret)
 +		return ret;
 +	if (copy_to_user(argp, &geo, sizeof(geo)))
 +		return -EFAULT;
 +	return 0;
 +}
  
 -		if (!(mode & FMODE_WRITE))
 -			return -EBADF;
 +/* set the logical block size */
 +static int blkdev_bszset(struct block_device *bdev, fmode_t mode,
 +		int __user *argp)
 +{
 +	int ret, n;
  
 -		if (copy_from_user(range, (void __user *)arg, sizeof(range)))
 -			return -EFAULT;
 +	if (!capable(CAP_SYS_ADMIN))
 +		return -EACCES;
 +	if (!argp)
 +		return -EINVAL;
 +	if (get_user(n, argp))
 +		return -EFAULT;
  
 -		return blk_ioctl_zeroout(bdev, range[0], range[1]);
 +	if (!(mode & FMODE_EXCL)) {
 +		bdgrab(bdev);
 +		if (blkdev_get(bdev, mode | FMODE_EXCL, &bdev) < 0)
 +			return -EBUSY;
  	}
  
 -	case HDIO_GETGEO: {
 -		struct hd_geometry geo;
 +	ret = set_blocksize(bdev, n);
 +	if (!(mode & FMODE_EXCL))
 +		blkdev_put(bdev, mode | FMODE_EXCL);
 +	return ret;
 +}
  
 -		if (!arg)
 -			return -EINVAL;
 -		if (!disk->fops->getgeo)
 -			return -ENOTTY;
 -
 -		/*
 -		 * We need to set the startsect first, the driver may
 -		 * want to override it.
 -		 */
 -		memset(&geo, 0, sizeof(geo));
 -		geo.start = get_start_sect(bdev);
 -		ret = disk->fops->getgeo(bdev, &geo);
 -		if (ret)
 -			return ret;
 -		if (copy_to_user((struct hd_geometry __user *)arg, &geo,
 -					sizeof(geo)))
 -			return -EFAULT;
 -		return 0;
 -	}
 +/*
 + * always keep this in sync with compat_blkdev_ioctl()
 + */
 +int blkdev_ioctl(struct block_device *bdev, fmode_t mode, unsigned cmd,
 +			unsigned long arg)
 +{
 +	struct backing_dev_info *bdi;
 +	void __user *argp = (void __user *)arg;
 +	loff_t size;
++	int n;
 +	unsigned int max_sectors;
 +
 +	switch (cmd) {
 +	case BLKFLSBUF:
 +		return blkdev_flushbuf(bdev, mode, cmd, arg);
 +	case BLKROSET:
 +		return blkdev_roset(bdev, mode, cmd, arg);
 +	case BLKDISCARD:
 +		return blk_ioctl_discard(bdev, mode, arg, 0);
 +	case BLKSECDISCARD:
 +		return blk_ioctl_discard(bdev, mode, arg,
 +				BLKDEV_DISCARD_SECURE);
 +	case BLKZEROOUT:
 +		return blk_ioctl_zeroout(bdev, mode, arg);
 +	case HDIO_GETGEO:
 +		return blkdev_getgeo(bdev, argp);
  	case BLKRAGET:
  	case BLKFRAGET:
  		if (!arg)
@@@ -567,21 -493,25 +614,34 @@@
  	case BLKTRACESTOP:
  	case BLKTRACESETUP:
  	case BLKTRACETEARDOWN:
 -		ret = blk_trace_ioctl(bdev, cmd, (char __user *) arg);
 -		break;
 +		return blk_trace_ioctl(bdev, cmd, argp);
+ 	case BLKDAXSET:
+ 		if (!capable(CAP_SYS_ADMIN))
+ 			return -EACCES;
+ 
+ 		if (get_user(n, (int __user *)(arg)))
+ 			return -EFAULT;
+ 		n = !!n;
+ 		if (n == !!(bdev->bd_inode->i_flags & S_DAX))
+ 			return 0;
+ 
+ 		return blkdev_set_dax(bdev, n);
+ 	case BLKDAXGET:
+ 		return put_int(arg, !!(bdev->bd_inode->i_flags & S_DAX));
 -		break;
 +	case IOC_PR_REGISTER:
 +		return blkdev_pr_register(bdev, argp);
 +	case IOC_PR_RESERVE:
 +		return blkdev_pr_reserve(bdev, argp);
 +	case IOC_PR_RELEASE:
 +		return blkdev_pr_release(bdev, argp);
 +	case IOC_PR_PREEMPT:
 +		return blkdev_pr_preempt(bdev, argp, false);
 +	case IOC_PR_PREEMPT_ABORT:
 +		return blkdev_pr_preempt(bdev, argp, true);
 +	case IOC_PR_CLEAR:
 +		return blkdev_pr_clear(bdev, argp);
  	default:
 -		ret = __blkdev_driver_ioctl(bdev, mode, cmd, arg);
 +		return __blkdev_driver_ioctl(bdev, mode, cmd, arg);
  	}
 -	return ret;
  }
  EXPORT_SYMBOL_GPL(blkdev_ioctl);
