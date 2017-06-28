From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Wed, 28 Jun 2017 13:43:10 +1000
Message-ID: <20170628134310.3a605636@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53609 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753701AbdF1DnN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Jun 2017 23:43:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Gustavo Padovan <gustavo@padovan.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jeffy Chen <jeffy.chen@rock-chips.com>

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

net/bluetooth/hidp/core.c:1241:39: error: unknown type name 'wait_queue_t'
 static int hidp_session_wake_function(wait_queue_t *wait,
                                       ^
In file included from include/linux/mmzone.h:9:0,
                 from include/linux/gfp.h:5,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from net/bluetooth/hidp/core.c:25:
net/bluetooth/hidp/core.c: In function 'hidp_session_thread':
net/bluetooth/hidp/core.c:1259:30: error: 'hidp_session_wake_function' undeclared (first use in this function)
  DEFINE_WAIT_FUNC(ctrl_wait, hidp_session_wake_function);
                              ^
include/linux/wait.h:954:12: note: in definition of macro 'DEFINE_WAIT_FUNC'
   .func  = function,     \
            ^
net/bluetooth/hidp/core.c:1259:30: note: each undeclared identifier is reported only once for each function it appears in
  DEFINE_WAIT_FUNC(ctrl_wait, hidp_session_wake_function);
                              ^
include/linux/wait.h:954:12: note: in definition of macro 'DEFINE_WAIT_FUNC'
   .func  = function,     \
            ^

Caused by commit

  ac6424b981bc ("sched/wait: Rename wait_queue_t => wait_queue_entry_t")

interacting with commit

  5da8e47d849d ("Bluetooth: hidp: fix possible might sleep error in hidp_session_thread")

from the bluetooth tree.  I should have fixed this up in the merge, sorry.
I added the following merge fix for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 28 Jun 2017 13:36:04 +1000
Subject: [PATCH] Bluetooth: hidp: fix for "sched/wait: Rename wait_queue_t =>
 wait_queue_entry_t"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 net/bluetooth/hidp/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hidp/core.c b/net/bluetooth/hidp/core.c
index 472b3907b1b0..002743ea509c 100644
--- a/net/bluetooth/hidp/core.c
+++ b/net/bluetooth/hidp/core.c
@@ -1238,7 +1238,7 @@ static void hidp_session_run(struct hidp_session *session)
 	smp_mb__after_atomic();
 }
 
-static int hidp_session_wake_function(wait_queue_t *wait,
+static int hidp_session_wake_function(wait_queue_entry_t *wait,
 				      unsigned int mode,
 				      int sync, void *key)
 {
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
