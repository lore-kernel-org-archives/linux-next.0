From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slabh tree
Date: Mon, 29 Mar 2010 15:42:08 +1100
Message-ID: <20100329154208.009a8ae2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Masters <jcm@jonmasters.org>
List-Id: linux-next.vger.kernel.org

Hi Tejun,

After merging the slabh tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/misc/hwlat_detector.c: In function 'debug_sample_fread':
drivers/misc/hwlat_detector.c:713: error: implicit declaration of function 'kzalloc'
drivers/misc/hwlat_detector.c:713: warning: assignment makes pointer from integer without a cast
drivers/misc/hwlat_detector.c:755: error: implicit declaration of function 'kfree'

Caused by commit d103d3b3e8512312b5254950035366d4422a479a ("percpu: don't
implicitly include slab.h from percpu.h") from the slabh tree interacting
with commit 94366eaeaf5ac4831637de39eac48ca62afe4e2a ("hwlat_detector: A
system hardware latency detector") from the hwlat tree.

I applied the following merge fixup which should be applied to the hwlat
tree anyway, please Jon (see Documentation/SubmitChecklist Rule #1 :-))?

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Mar 2010 15:38:45 +1100
Subject: [PATCH] hwlat: using kzalloc/kfree requires the include of slab.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/misc/hwlat_detector.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/misc/hwlat_detector.c b/drivers/misc/hwlat_detector.c
index e02d8e1..a56baf4 100644
--- a/drivers/misc/hwlat_detector.c
+++ b/drivers/misc/hwlat_detector.c
@@ -50,6 +50,7 @@
 #include <linux/uaccess.h>
 #include <linux/version.h>
 #include <linux/delay.h>
+#include <linux/slab.h>
 
 #define BUF_SIZE_DEFAULT	262144UL		/* 8K*(sizeof(entry)) */
 #define BUF_FLAGS		(RB_FL_OVERWRITE)	/* no block on full */
-- 
1.7.0.3


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
