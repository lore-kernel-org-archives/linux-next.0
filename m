From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] fs/partitions: fix printk format warning
Date: Mon, 9 May 2011 10:38:26 -0700
Message-ID: <20110509103826.58551948.randy.dunlap@oracle.com>
References: <20110509152401.cc001ad6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110509152401.cc001ad6.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

fs/partitions/check.c:263: warning: format '%u' expects type 'unsigned int', but argument 3 has type 'long long unsigned int'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 fs/partitions/check.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20110509.orig/fs/partitions/check.c
+++ linux-next-20110509/fs/partitions/check.c
@@ -257,7 +257,7 @@ ssize_t part_discard_alignment_show(stru
 	struct hd_struct *p = dev_to_part(dev);
 	struct gendisk *disk = dev_to_disk(dev);
 
-	return sprintf(buf, "%u\n",
+	return sprintf(buf, "%llu\n",
 		       (unsigned long long)queue_limit_discard_alignment(
 							&disk->queue->limits,
 							p->start_sect));
