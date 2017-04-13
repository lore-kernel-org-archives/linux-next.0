From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/4] mm/hmm: make it explicitly non-modular
Date: Wed, 12 Apr 2017 20:30:11 -0400
Message-ID: <20170413003014.4052-2-paul.gortmaker@windriver.com>
References: <20170413003014.4052-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:33397 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751587AbdDMAcV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Apr 2017 20:32:21 -0400
In-Reply-To: <20170413003014.4052-1-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Evgeny Baskakov <ebaskakov@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Mark Hairgrove <mhairgrove@nvidia.com>, Sherry Cheung <SCheung@nvidia.com>, Subhash Gutti <sgutti@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>

The Kconfig currently controlling compilation of this code is:

mm/Kconfig:config HMM
mm/Kconfig:     bool

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init translates to device_initcall in the non-modular
case, the init ordering remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Evgeny Baskakov <ebaskakov@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Mark Hairgrove <mhairgrove@nvidia.com>
Cc: Sherry Cheung <SCheung@nvidia.com>
Cc: Subhash Gutti <sgutti@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 mm/hmm.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index f567a8b3b079..8200cf275fb9 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -19,12 +19,12 @@
  */
 #include <linux/mm.h>
 #include <linux/hmm.h>
+#include <linux/init.h>
 #include <linux/rmap.h>
 #include <linux/swap.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/mmzone.h>
-#include <linux/module.h>
 #include <linux/pagemap.h>
 #include <linux/swapops.h>
 #include <linux/hugetlb.h>
@@ -1192,14 +1192,5 @@ static int __init hmm_init(void)
 	}
 	return 0;
 }
-
-static void __exit hmm_exit(void)
-{
-	unregister_chrdev_region(hmm_device_devt, HMM_DEVICE_MAX);
-	class_destroy(hmm_device_class);
-}
-
-module_init(hmm_init);
-module_exit(hmm_exit);
-MODULE_LICENSE("GPL");
+device_initcall(hmm_init);
 #endif /* IS_ENABLED(CONFIG_HMM_DEVMEM) */
-- 
2.11.0
