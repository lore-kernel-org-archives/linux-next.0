From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] power: fix block_io.c printk warning
Date: Mon, 3 May 2010 10:06:11 -0700
Message-ID: <20100503100611.2ca63b58.randy.dunlap@oracle.com>
References: <20100503151619.f75e3a80.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:65069 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755001Ab0ECRH5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 May 2010 13:07:57 -0400
In-Reply-To: <20100503151619.f75e3a80.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-pm@lists.linux-foundation.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warning in block_io.c:

kernel/power/block_io.c:41: warning: format '%ld' expects type 'long int', but argument 2 has type 'sector_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>
---
 kernel/power/block_io.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20100503.orig/kernel/power/block_io.c
+++ linux-next-20100503/kernel/power/block_io.c
@@ -37,8 +37,8 @@ static int submit(int rw, struct block_d
 	bio->bi_end_io = end_swap_bio_read;
 
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
-		printk(KERN_ERR "PM: Adding page to bio failed at %ld\n",
-			sector);
+		printk(KERN_ERR "PM: Adding page to bio failed at %llu\n",
+			(unsigned long long)sector);
 		bio_put(bio);
 		return -EFAULT;
 	}
