From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: block tree build failure
Date: Wed, 03 Sep 2008 19:29:28 +0200
Message-ID: <48BEC978.3050507@kernel.org>
References: <20080903161526.636b6d0d.sfr@canb.auug.org.au>	<20080903063419.GK20055@kernel.dk>	<20080903000418.aa2434fe.akpm@linux-foundation.org>	<20080903070723.GL20055@kernel.dk>	<20080903090558.de8510e8.akpm@linux-foundation.org>	<48BEBAE0.4050305@kernel.org> <20080903093245.da237b40.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080606060300050300070703"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:49944 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752057AbYICRbH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Sep 2008 13:31:07 -0400
In-Reply-To: <20080903093245.da237b40.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jens Axboe <jens.axboe@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

This is a multi-part message in MIME format.
--------------080606060300050300070703
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Andrew Morton wrote:
> On Wed, 03 Sep 2008 18:27:12 +0200 Tejun Heo <tj@kernel.org> wrote:
> 
>> Andrew Morton wrote:
>>> @@ -674,6 +674,8 @@ static void *disk_seqf_next(struct seq_f
>>>  	struct device *dev;
>>>  
>>>  	(*pos)++;
>>> +	if (seqf->private == NULL)
>>> +		return NULL;
>>>  	dev = class_dev_iter_next(seqf->private);
>>>  	if (dev)
>>>  		return dev_to_disk(dev);
>> Ehh... next can't be called with NULL private.
> 
> My computer disagreed ;)
> 
>>  Where can I take a look
>> at the merged tree?  There have been two separate changes to that area
>> of code.  Ad-hoc behavior fix for 2.6.27 and general clean up scheduled
>> for 2.6.28 and the two use seqf->private for different purposes.  Maybe
>> the two got mixed up?
> 
> It's linux-next-20080903

Hmmm... Can't see how it can happen and can't reproduce it either.
seqf->private is initialized from disk_seqf_start().  If allocation
fails, it returns ERR_PTR(-ENOMEM).  On error return from start, both
seq_file::seq_read and seq_file::traverse() immediately calls ->stop()
and fails, so ->next can't really be called with null ->private.

Just to make sure, I made disk_seqf_start() fail and it works (or
rather fails) as expected.

Argggghh... strange.  Can you please try the attached patch and post
the log?

Thanks.

-- 
tejun

--------------080606060300050300070703
Content-Type: text/x-patch;
 name="genhd-next-dbg.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="genhd-next-dbg.patch"

diff --git a/block/genhd.c b/block/genhd.c
index ed926b7..b76c56b 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -655,8 +655,11 @@ static void *disk_seqf_start(struct seq_file *seqf, loff_t *pos)
 	struct device *dev;
 
 	iter = kmalloc(sizeof(*iter), GFP_KERNEL);
-	if (!iter)
+	if (!iter) {
+		printk("XXX disk_seqf_start: -ENOMEM\n");
 		return ERR_PTR(-ENOMEM);
+	}
+	printk("XXX disk_seqf_start: iter=%p pos=%lld\n", iter, (long long)*pos);
 
 	seqf->private = iter;
 	class_dev_iter_init(iter, &block_class, NULL, &disk_type);
@@ -673,6 +676,8 @@ static void *disk_seqf_next(struct seq_file *seqf, void *v, loff_t *pos)
 {
 	struct device *dev;
 
+	printk("XXX disk_seqf_next: iter=%p pos=%lld\n",
+	       seqf->private, (long long)*pos);
 	(*pos)++;
 	dev = class_dev_iter_next(seqf->private);
 	if (dev)
@@ -685,6 +690,7 @@ static void disk_seqf_stop(struct seq_file *seqf, void *v)
 {
 	struct class_dev_iter *iter = seqf->private;
 
+	printk("XXX disk_seqf_stop: iter=%p\n", seqf->private);
 	/* stop is called even after start failed :-( */
 	if (iter) {
 		class_dev_iter_exit(iter);
@@ -697,7 +703,7 @@ static void *show_partition_start(struct seq_file *seqf, loff_t *pos)
 	static void *p;
 
 	p = disk_seqf_start(seqf, pos);
-	if (!IS_ERR(p) && p)
+	if (!IS_ERR(p) && p && !*pos)
 		seq_puts(seqf, "major minor  #blocks  name\n\n");
 	return p;
 }

--------------080606060300050300070703--
