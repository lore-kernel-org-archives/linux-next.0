From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: md tree build failure
Date: Wed, 15 Oct 2008 20:09:21 +1100
Message-ID: <20081015200921.ce510804.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58977 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752459AbYJOJOu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 05:14:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org

Hi Neil,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/md/raid1.c: In function 'sync_request':
drivers/md/raid1.c:1759: error: implicit declaration of function 'msleep_interruptible'
make[3]: *** [drivers/md/raid1.o] Error 1
make[3]: *** Waiting for unfinished jobs....
drivers/md/raid10.c: In function 'sync_request':
drivers/md/raid10.c:1749: error: implicit declaration of function 'msleep_interruptible'
make[3]: *** [drivers/md/raid10.o] Error 1
drivers/md/md.c: In function 'md_do_sync':
drivers/md/md.c:5915: error: implicit declaration of function 'msleep'

Caused by commit 6caa3b0bbdb474647f6bdd8a958ffc46f78d8d58 ("md: Remove
unnecessary #includes, #defines, and function declarations").  I added
the following patch.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 15 Oct 2008 20:05:50 +1100
Subject: [PATCH] md: msleep need include of linux/delay.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/md/md.c     |    1 +
 drivers/md/raid1.c  |    1 +
 drivers/md/raid10.c |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 4c89836..abc82f2 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -45,6 +45,7 @@
 #include <linux/random.h>
 #include <linux/reboot.h>
 #include <linux/file.h>
+#include <linux/delay.h>
 
 #define MAJOR_NR MD_MAJOR
 
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index b976442..9c788e2 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -32,6 +32,7 @@
  */
 
 #include "dm-bio-list.h"
+#include <linux/delay.h>
 #include <linux/raid/raid1.h>
 #include <linux/raid/bitmap.h>
 
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 8bdc9bf..7d7f345 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -19,6 +19,7 @@
  */
 
 #include "dm-bio-list.h"
+#include <linux/delay.h>
 #include <linux/raid/raid10.h>
 #include <linux/raid/bitmap.h>
 
-- 
1.5.6.5
