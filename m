From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the jc_docs tree
Date: Wed, 21 Jun 2017 14:18:09 +1000
Message-ID: <20170621141809.11103aab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60589 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750707AbdFUESN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Jun 2017 00:18:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  Documentation/DocBook/kernel-hacking.tmpl

between commit:

  c4fcd7cabb83 ("docs-rst: convert kernel-hacking to ReST")

from the jc_docs tree and commit:

  ac6424b981bc ("sched/wait: Rename wait_queue_t => wait_queue_entry_t")

from the tip tree.

I deleted the file and added the following fixup patch.

This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 21 Jun 2017 14:14:45 +1000
Subject: [PATCH] sched/wait: fix up for "docs-rst: convert kernel-hacking to
 ReST"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Documentation/kernel-hacking/hacking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index 1a456b60a7cf..daf3883b2694 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -498,7 +498,7 @@ Wait Queues ``include/linux/wait.h``
 A wait queue is used to wait for someone to wake you up when a certain
 condition is true. They must be used carefully to ensure there is no
 race condition. You declare a :c:type:`wait_queue_head_t`, and then processes
-which want to wait for that condition declare a :c:type:`wait_queue_t`
+which want to wait for that condition declare a :c:type:`wait_queue_entry_t`
 referring to themselves, and place that in the queue.
 
 Declaring
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
