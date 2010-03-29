From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slabh tree
Date: Mon, 29 Mar 2010 16:02:48 +1100
Message-ID: <20100329160248.e15e7836.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60409 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750898Ab0C2GNc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 02:13:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>, Martin Hicks <mort@sgi.com>

Hi Tejun,

After merging the slabh tree, today's linux-next build (x86_64
allmodconfig) failed like this:

kernel/debug/kdb/kdb_support.c: In function 'kdb_strdup':
kernel/debug/kdb/kdb_support.c:309: error: implicit declaration of function 'kmalloc'
kernel/debug/kdb/kdb_support.c:309: warning: initialization makes pointer from integer without a cast
kernel/debug/kdb/kdb_support.c: In function 'debug_kfree':
kernel/debug/kdb/kdb_support.c:810: error: implicit declaration of function 'kfree'

Caused by commit d103d3b3e8512312b5254950035366d4422a479a ("percpu: don't
implicitly include slab.h from percpu.h") from the slabh tree interacting
with commit 5572dd736e5577dfefafe2ad3b54760e8323e33d ("kdb: core for kgdb
back end (1 of 2)") from the kgdb tree.

I applied the following merge fixup patch which should be applied to the
kdbg tree (see Documentation/SubmitChecklist Rule #1 :-)).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Mar 2010 15:49:05 +1100
Subject: [PATCH] kgdb: use of kmalloc/kfree requires the include of slab.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/debug/kdb/kdb_support.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
index 788dbfe..45344d5 100644
--- a/kernel/debug/kdb/kdb_support.c
+++ b/kernel/debug/kdb/kdb_support.c
@@ -24,6 +24,7 @@
 #include <linux/delay.h>
 #include <linux/uaccess.h>
 #include <linux/kdb.h>
+#include <linux/slab.h>
 #include "kdb_private.h"
 
 /*
-- 
1.7.0.3

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
