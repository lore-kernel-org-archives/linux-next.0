From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slabh tree
Date: Mon, 29 Mar 2010 16:28:50 +1100
Message-ID: <20100329162850.24bb2beb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60430 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753005Ab0C2GNj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 02:13:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bryan Wu <cooloney@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, Barry Song <21cnbao@gmail.com>, Mike Frysinger <vapier@gentoo.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi Tejun,

After merging the slabh tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/input/misc/ad714x.c: In function 'ad714x_probe':
drivers/input/misc/ad714x.c:1087: error: implicit declaration of function 'kzalloc'
drivers/input/misc/ad714x.c:1091: warning: assignment makes pointer from integer without a cast
drivers/input/misc/ad714x.c:1266: error: implicit declaration of function 'kfree'

Caused by commit d103d3b3e8512312b5254950035366d4422a479a ("percpu: don't
implicitly include slab.h from percpu.h") from the slabh tree interacting
with commit a9afb42434d88906ba9e99ef88d7aebfddaf24a4 ("Input: add Analog Devices AD714x captouch input driver") from the input tree.

I applied the following merge fixup patch which should be applied to the
input tree (see Documentation/SubmitChecklist Rule #1 :-)).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Mar 2010 16:14:15 +1100
Subject: [PATCH] Input: ad714x: use of kzalloc/kfree requires the include of slab.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/input/misc/ad714x.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/input/misc/ad714x.c b/drivers/input/misc/ad714x.c
index f8c4e45..0fe27ba 100644
--- a/drivers/input/misc/ad714x.c
+++ b/drivers/input/misc/ad714x.c
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/interrupt.h>
+#include <linux/slab.h>
 #include <linux/input/ad714x.h>
 #include "ad714x.h"
 
-- 
1.7.0.3

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
