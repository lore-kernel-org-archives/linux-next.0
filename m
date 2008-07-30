From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Wed, 30 Jul 2008 15:30:28 +1000
Message-ID: <20080730153028.95226354.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49090 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753270AbYG3Fac (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Jul 2008 01:30:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Cc: linux-next@vger.kernel.org, Ankita Garg <ankita@in.ibm.com>, Vivek Goyal <vgoyal@redhat.com>, Haren Myneni <hbabu@us.ibm.com>, kexec@lists.infradead.org

Hi Ananth,

Today's linux-next build (powerpc allyesconfig) failed like this:

tests/lkdtm.c:182: error: expected ')' before '*' token

I have no idea why this fails now when it did not before.

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 30 Jul 2008 15:24:53 +1000
Subject: [PATCH] tests: lkdtm needs ide.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 tests/lkdtm.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/tests/lkdtm.c b/tests/lkdtm.c
index 2a40d18..856f060 100644
--- a/tests/lkdtm.c
+++ b/tests/lkdtm.c
@@ -52,6 +52,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/hrtimer.h>
+#include <linux/ide.h>
 #include <scsi/scsi_cmnd.h>
 
 #define NUM_CPOINTS 8
-- 
1.5.6.3
