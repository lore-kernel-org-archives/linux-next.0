From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-config tree with Linus' tree
Date: Thu, 18 Nov 2010 12:46:37 +1100
Message-ID: <20101118124637.15571689.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57174 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753071Ab0KRBql (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Nov 2010 20:46:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Arnd,

Today's linux-next merge of the bkl-config tree got a conflict in
include/linux/smp_lock.h between commit
7957f0a857754c555e07f58a3fb83ac29501478c ("Fix build failure due to
hwirq.h needing smp_lock.h") from Linus' tree and commit
69baedf9d18ea86cc3b9916f5eeac9d089d3a117 ("BKL: mark lock_kernel as
deprecated") from the bkl-config tree.

Just context changes.  If fixed it up (see below) and can carry the fix
for as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/smp_lock.h
index 3a19882,9590a0c..0000000
--- a/include/linux/smp_lock.h
+++ b/include/linux/smp_lock.h
@@@ -55,7 -47,7 +45,6 @@@ __releases(kernel_lock)
  #ifdef CONFIG_BKL /* provoke build bug if not set */
  #define lock_kernel()
  #define unlock_kernel()
- #define cycle_kernel_lock()			do { } while(0)
 -#define kernel_locked()				1
  #endif /* CONFIG_BKL */
  
  #define release_kernel_lock(task)		do { } while(0)
