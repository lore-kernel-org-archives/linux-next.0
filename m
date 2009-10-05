From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc tree build failure
Date: Mon, 5 Oct 2009 18:43:57 +1100
Message-ID: <20091005184357.a6f41165.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36596 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758573AbZJEHog (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Oct 2009 03:44:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Dave,

Today's linux-next build (sparc64 defconfig) failed like this:

arch/sparc/oprofile/init.c: In function 'timer_start':
arch/sparc/oprofile/init.c:46: error: 'HZ' undeclared (first use in this function)

I have no idea why this just cropped up, but I have added the following
patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 5 Oct 2009 18:32:33 +1100
Subject: [PATCH] sparc: using HZ needs an include of linux/param.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/oprofile/init.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/sparc/oprofile/init.c b/arch/sparc/oprofile/init.c
index f97cb8b..62f4120 100644
--- a/arch/sparc/oprofile/init.c
+++ b/arch/sparc/oprofile/init.c
@@ -11,7 +11,8 @@
 #include <linux/oprofile.h>
 #include <linux/errno.h>
 #include <linux/init.h>
+#include <linux/param.h>	/* for HZ */
  
 #ifdef CONFIG_SPARC64
 #include <linux/notifier.h>
 #include <linux/rcupdate.h>
-- 
1.6.4.3


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
