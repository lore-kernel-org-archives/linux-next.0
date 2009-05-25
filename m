From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tracing tree with the block tree
Date: Mon, 25 May 2009 16:16:40 +1000
Message-ID: <20090525161640.bb6de095.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40722 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751850AbZEYGQn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 May 2009 02:16:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <jens.axboe@oracle.com>, Li Zefan <lizf@cn.fujitsu.com>

Hi all,

Today's linux-next merge of the tracing tree got a conflict in
block/blk-sysfs.c between commit cd43e26f071524647e660706b784ebcbefbd2e44
("block: Expose stacked device queues in sysfs") from the block tree and
commit 1d54ad6da9192fed5dd3b60224d9f2dfea0dcd82 ("blktrace: add trace/
to /sys/block/sda") from the tracing tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc block/blk-sysfs.c
index 9337e17,26f9ec2..0000000
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@@ -428,7 -390,14 +429,11 @@@ int blk_register_queue(struct gendisk *
  	if (WARN_ON(!q))
  		return -ENXIO;
  
- 	ret = kobject_add(&q->kobj, kobject_get(&disk_to_dev(disk)->kobj),
+ 	ret = blk_trace_init_sysfs(dev);
+ 	if (ret)
+ 		return ret;
+ 
 -	if (!q->request_fn)
 -		return 0;
 -
+ 	ret = kobject_add(&q->kobj, kobject_get(&dev->kobj),
  			  "%s", "queue");
  	if (ret < 0)
  		return ret;
