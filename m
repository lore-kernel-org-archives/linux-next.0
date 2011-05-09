From: Tao Ma <tm@tao.ma>
Subject: Re: linux-next: build warning after merge of the block tree
Date: Mon,  9 May 2011 13:55:37 +0800
Message-ID: <1304920537-3975-1-git-send-email-tm@tao.ma>
References: <20110509134931.6d822e05.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:45568 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751703Ab1EIF4m (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 May 2011 01:56:42 -0400
In-Reply-To: <20110509134931.6d822e05.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: axboe@kernel.dk
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jens,

Sorry for the trouble. Here is the fix.

>From 60bf0c0972c0d0d237e30e1f1c79356f4aefa138 Mon Sep 17 00:00:00 2001
From: Tao Ma <boyu.mt@taobao.com>
Date: Mon, 9 May 2011 13:39:49 +0800
Subject: [PATCH] block: Change wrong type cast in part_discard_alignment_show.

Use 'unsigned int' instead of 'unsigned long long' introduced by commit
"block: Remove extra discard_alignment from hd_struct".

Signed-off-by: Tao Ma <boyu.mt@taobao.com>
---
 fs/partitions/check.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/partitions/check.c b/fs/partitions/check.c
index b7e16bc..b2bae85 100644
--- a/fs/partitions/check.c
+++ b/fs/partitions/check.c
@@ -258,7 +258,7 @@ ssize_t part_discard_alignment_show(struct device *dev,
 	struct gendisk *disk = dev_to_disk(dev);
 
 	return sprintf(buf, "%u\n",
-		       (unsigned long long)queue_limit_discard_alignment(
+		       (unsigned int)queue_limit_discard_alignment(
 							&disk->queue->limits,
 							p->start_sect));
 }
-- 
1.7.4
