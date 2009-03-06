From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tracing tree with the tip-core tree
Date: Fri, 6 Mar 2009 12:17:40 +1100
Message-ID: <20090306121740.0dc19811.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50509 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751464AbZCFCj4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 21:39:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Frederic Weisbecker <fweisbec@gmail.com>

Hi all,

Today's linux-next merge of the tracing tree got a conflict in
block/blktrace.c between commit 313e458f81ec3852106c5a83830fe0d4f405a71a
("alloc_percpu: add align argument to __alloc_percpu") from the tip-core
tree and commit 2db270a80b8f2238e536876cfb3987af02684df8
("tracing/blktrace: move the tracing file to kernel/trace") from the
tracing tree.

I applied the block/blktrace.c part of the former commit to
kernel/trace/blktrace.c (see below) and can carry this fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index e39679a..d24a10b 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -423,7 +423,7 @@ int do_blk_trace_setup(struct request_queue *q, char *name, dev_t dev,
 	if (!bt->sequence)
 		goto err;
 
-	bt->msg_data = __alloc_percpu(BLK_TN_MAX_MSG);
+	bt->msg_data = __alloc_percpu(BLK_TN_MAX_MSG, __alignof__(char));
 	if (!bt->msg_data)
 		goto err;
 
