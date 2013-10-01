From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the random tree
Date: Tue,  1 Oct 2013 13:07:22 +0200
Message-ID: <1380625644-11331-6-git-send-email-treding@nvidia.com>
References: <20131001110344.GA20249@ulmo.nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131001110344.GA20249@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the random tree got a conflict in:

	init/main.c

I fixed it up (see below). Please check if the resolution looks correct.

Thanks,
Thierry
---
diff --cc init/main.c
index 7cc4b78,586cd33..379090f
--- a/init/main.c
+++ b/init/main.c
@@@ -75,7 -75,7 +75,8 @@@
  #include <linux/blkdev.h>
  #include <linux/elevator.h>
  #include <linux/sched_clock.h>
 +#include <linux/context_tracking.h>
+ #include <linux/random.h>
  
  #include <asm/io.h>
  #include <asm/bugs.h>
