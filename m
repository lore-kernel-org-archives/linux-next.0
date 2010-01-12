From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with Linus' tree
Date: Tue, 12 Jan 2010 13:13:25 +1100
Message-ID: <20100112131325.f8ebb1c9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41471 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752264Ab0ALCN0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jan 2010 21:13:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
include/linux/kmemcheck.h between commit
e992cd9b72a18122bd5c958715623057f110793f ("kmemcheck: make bitfield
annotations truly no-ops when disabled") from Linus' tree and commit
a5fddb6f013523418c30cd795b0f8ecf49505952
("misc:remove-MAYBE_BUILD_BUG_ON") from the rr tree.

I fixed it up (see below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --git a/include/linux/kmemcheck.h b/include/linux/kmemcheck.h
index 08d7dc4..39f8453 100644
--- a/include/linux/kmemcheck.h
+++ b/include/linux/kmemcheck.h
@@ -76,7 +76,7 @@ bool kmemcheck_is_obj_initialized(unsigned long addr, size_t size);
 									\
 		_n = (long) &((ptr)->name##_end)			\
 			- (long) &((ptr)->name##_begin);		\
-		MAYBE_BUILD_BUG_ON(_n < 0);				\
+		BUILD_BUG_ON(_n < 0);					\
 									\
 		kmemcheck_mark_initialized(&((ptr)->name##_begin), _n);	\
 	} while (0)
