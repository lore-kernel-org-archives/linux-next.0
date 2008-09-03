From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Wed, 3 Sep 2008 15:55:10 +1000
Message-ID: <20080903155510.514c67e3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42366 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752543AbYICFzW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Sep 2008 01:55:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

Hi Jens,

Today's linux-next merge of the block tree got a conflicts in
block/genhd.c between commits bb23b431db7405f6d79f989ad0236bf6428ba1cb
("remove blk_register_filter and blk_unregister_filter in gendisk") and
ddef43a843f620c6742a06633739887a901ec06b ("block: restore original
behavior of /proc/partition when there's no partition") from Linus' tree
and commits 8d5ceff5828d044eeb93656093f50e6f522f9d71 ("block: implement
and use {disk|part}_to_dev()") and
f21bb156d79de8404a0e04eb311141a01b459c92 ("block: use class_dev_iterator
instead of class_for_each_device()") from the block tree.

I fixed them up (see below) and can carry the fixes while needed.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc block/genhd.c
index c114a43,9c27e15..0000000
--- a/block/genhd.c
+++ b/block/genhd.c
@@@ -183,17 -484,41 +484,40 @@@ static int exact_lock(dev_t devt, void 
  void add_disk(struct gendisk *disk)
  {
  	struct backing_dev_info *bdi;
+ 	dev_t devt;
  	int retval;
  
+ 	/* minors == 0 indicates to use ext devt from part0 and should
+ 	 * be accompanied with EXT_DEVT flag.  Make sure all
+ 	 * parameters make sense.
+ 	 */
+ 	WARN_ON(disk->minors && !(disk->major || disk->first_minor));
+ 	WARN_ON(!disk->minors && !(disk->flags & GENHD_FL_EXT_DEVT));
+ 
  	disk->flags |= GENHD_FL_UP;
- 	blk_register_region(MKDEV(disk->major, disk->first_minor),
- 			    disk->minors, NULL, exact_match, exact_lock, disk);
+ 
+ 	retval = blk_alloc_devt(&disk->part0, &devt);
+ 	if (retval) {
+ 		WARN_ON(1);
+ 		return;
+ 	}
+ 	disk_to_dev(disk)->devt = devt;
+ 
+ 	/* ->major and ->first_minor aren't supposed to be
+ 	 * dereferenced from here on, but set them just in case.
+ 	 */
+ 	disk->major = MAJOR(devt);
+ 	disk->first_minor = MINOR(devt);
+ 
+ 	blk_register_region(disk_devt(disk), disk->minors, NULL,
+ 			    exact_match, exact_lock, disk);
  	register_disk(disk);
  	blk_register_queue(disk);
 -	blk_register_filter(disk);
  
  	bdi = &disk->queue->backing_dev_info;
- 	bdi_register_dev(bdi, MKDEV(disk->major, disk->first_minor));
- 	retval = sysfs_create_link(&disk->dev.kobj, &bdi->dev->kobj, "bdi");
+ 	bdi_register_dev(bdi, disk_devt(disk));
+ 	retval = sysfs_create_link(&disk_to_dev(disk)->kobj, &bdi->dev->kobj,
+ 				   "bdi");
  	WARN_ON(retval);
  }
  
@@@ -202,11 -527,11 +526,10 @@@ EXPORT_SYMBOL(del_gendisk);	/* in parti
  
  void unlink_gendisk(struct gendisk *disk)
  {
- 	sysfs_remove_link(&disk->dev.kobj, "bdi");
 -	blk_unregister_filter(disk);
+ 	sysfs_remove_link(&disk_to_dev(disk)->kobj, "bdi");
  	bdi_unregister(&disk->queue->backing_dev_info);
  	blk_unregister_queue(disk);
- 	blk_unregister_region(MKDEV(disk->major, disk->first_minor),
- 			      disk->minors);
+ 	blk_unregister_region(disk_devt(disk), disk->minors);
  }
  
  /**
@@@ -319,51 -683,37 +681,48 @@@ static void *disk_seqf_next(struct seq_
  	return NULL;
  }
  
- static int find_next(struct device *dev, void *data)
+ static void disk_seqf_stop(struct seq_file *seqf, void *v)
  {
- 	if (dev->type == &disk_type)
- 		return 1;
- 	return 0;
- }
+ 	struct class_dev_iter *iter = seqf->private;
  
- static void *part_next(struct seq_file *part, void *v, loff_t *pos)
- {
- 	struct gendisk *gp = v;
- 	struct device *dev;
- 	++*pos;
- 	dev = class_find_device(&block_class, &gp->dev, NULL, find_next);
- 	if (dev) {
- 		put_device(dev);
- 		return dev_to_disk(dev);
+ 	/* stop is called even after start failed :-( */
+ 	if (iter) {
+ 		class_dev_iter_exit(iter);
+ 		kfree(iter);
  	}
- 	return NULL;
  }
  
- static void part_stop(struct seq_file *part, void *v)
+ static void *show_partition_start(struct seq_file *seqf, loff_t *pos)
  {
- 	mutex_unlock(&block_class_lock);
+ 	static void *p;
+ 
+ 	p = disk_seqf_start(seqf, pos);
+ 	if (!IS_ERR(p) && p)
+ 		seq_puts(seqf, "major   minor   #blocks  name\n\n");
+ 	return p;
  }
  
- static int show_partition(struct seq_file *part, void *v)
+ static int show_partition(struct seq_file *seqf, void *v)
  {
  	struct gendisk *sgp = v;
- 	int n;
+ 	struct disk_part_iter piter;
+ 	struct hd_struct *part;
  	char buf[BDEVNAME_SIZE];
  
 +	/*
 +	 * Print header if start told us to do.  This is to preserve
 +	 * the original behavior of not printing header if no
 +	 * partition exists.  This hackery will be removed later with
 +	 * class iteration clean up.
 +	 */
 +	if (part->private) {
 +		seq_puts(part, "major minor  #blocks  name\n\n");
 +		part->private = NULL;
 +	}
 +
  	/* Don't show non-partitionable removeable devices or empty devices */
- 	if (!get_capacity(sgp) ||
- 			(sgp->minors == 1 && (sgp->flags & GENHD_FL_REMOVABLE)))
+ 	if (!get_capacity(sgp) || (!disk_partitionable(sgp) &&
+ 				   (sgp->flags & GENHD_FL_REMOVABLE)))
  		return 0;
  	if (sgp->flags & GENHD_FL_SUPPRESS_PARTITION_INFO)
  		return 0;
