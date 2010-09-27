From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-trivial tree with the block
 tree
Date: Mon, 27 Sep 2010 14:45:19 +1000
Message-ID: <20100927144519.25cd3afa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59360 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751038Ab0I0EpZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Sep 2010 00:45:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vivek Goyal <vgoyal@redhat.com>, Jens Axboe <axboe@kernel.dk>

Hi Arnd,

Today's linux-next merge of the bkl-trivial tree got a conflict in
drivers/block/ataflop.c between commit
639e2f2aa76eefaf22078dccbbf2f3483f587aa7 ("atari floppy: Stop sharing
request queue across multiple gendisks") from the block tree and commit
5778067afcfd8b718ffc3744c25fdd194fc886a1 ("block: autoconvert trivial BKL
users to private mutex") from the bkl-trivial tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/block/ataflop.c
index 0f4eec4,8c021bb..0000000
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@@ -79,8 -79,9 +79,9 @@@
  
  #undef DEBUG
  
+ static DEFINE_MUTEX(ataflop_mutex);
 -static struct request_queue *floppy_queue;
  static struct request *fd_request;
 +static int fdc_queue;
  
  /* Disk types: DD, HD, ED */
  static struct atari_disk_type {
