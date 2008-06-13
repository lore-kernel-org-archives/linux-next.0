From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: block/rcu merge build failure
Date: Fri, 13 Jun 2008 17:13:51 +1000
Message-ID: <20080613171351.9ad7e1df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59397 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751536AbYFMHN6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jun 2008 03:13:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org

Hi Jens,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

kernel/smp.c: In function 'generic_smp_call_function_interrupt':
kernel/smp.c:106: error: implicit declaration of function 'list_for_each_entry_rcu'

This is caused by the merge of the rcu tree (contained in sched tree)
with the block tree.  I have applied the following patch which I will
carry as part of the block tree merge commit.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From b840cba6063223fd497ef59d8734764469b86a9e Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 13 Jun 2008 17:07:02 +1000
Subject: [PATCH] block: fix up rculist split fallout

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/smp.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index d7653fd..a0c9cb0 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/percpu.h>
 #include <linux/rcupdate.h>
+#include <linux/rculist.h>
 #include <linux/smp.h>
 
 static DEFINE_PER_CPU(struct call_single_queue, call_single_queue);
-- 
1.5.5.4

