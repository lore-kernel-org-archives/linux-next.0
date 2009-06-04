From: Neil Brown <neilb@suse.de>
Subject: Re: linux-next: md tree build failure
Date: Thu, 4 Jun 2009 14:06:43 +1000
Message-ID: <18983.18515.445191.401600@notabene.brown>
References: <20090525153346.758483fc.sfr@canb.auug.org.au>
	<20090525061552.GH11363@kernel.dk>
	<20090601144218.26810ec8.sfr@canb.auug.org.au>
	<yq163fga654.fsf@sermon.lab.mkp.net>
	<39efa6d3788eec04b0bc86b02d988c8f.squirrel@neil.brown.name>
	<yq1prdm6jn1.fsf@sermon.lab.mkp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:45950 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750724AbZFDEGV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Jun 2009 00:06:21 -0400
In-Reply-To: message from Martin K. Petersen on Wednesday June 3
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org

On Wednesday June 3, martin.petersen@oracle.com wrote:
> 
> James often rebases against Jens' tree because there's frequently
> dependencies between between block and SCSI during the merge.  I suggest
> you do the same.

OK, I've just rebased my for-next tree against Jens' for-next, and
fixed the compile error with this incremental patch

--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -240,7 +240,7 @@ static int create_strip_zones(mddev_t *mddev)
         * now since we have the hard sector sizes, we can make sure
         * chunk size is a multiple of that sector size
         */
-       if (mddev->chunk_size % mddev->queue->hardsect_size) {
+       if (mddev->chunk_size % queue_logical_block_size(mddev->queue)) {
                printk(KERN_ERR "%s chunk_size of %d not valid\n",
                       mdname(mddev),
                       mddev->chunk_size);


I assume that is the preferred usage?

Thanks,
NeilBrown
