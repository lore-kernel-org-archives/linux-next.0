From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the random tree
Date: Mon,  7 Oct 2013 17:18:46 +0200
Message-ID: <1381159127-11067-4-git-send-email-treding@nvidia.com>
References: <1381159127-11067-1-git-send-email-treding@nvidia.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:47715 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752588Ab3JGPUv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Oct 2013 11:20:51 -0400
In-Reply-To: <1381159127-11067-1-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Today's linux-next merge of the random tree got a conflict in:

	drivers/char/random.c

caused by commits 5573604 (random: push extra entropy to the output pools)
and 0244ad0 (Remove GENERIC_HARDIRQ config option). I fixed it up (see
below). Please verify that the resolution looks correct.

Thanks,
Thierry
---
diff --cc drivers/char/random.c
index 7737b5b,f126bd2..7cfc146
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@@ -255,8 -255,12 +255,9 @@@
  #include <linux/fips.h>
  #include <linux/ptrace.h>
  #include <linux/kmemcheck.h>
 +#include <linux/irq.h>
+ #include <linux/workqueue.h>
  
 -#ifdef CONFIG_GENERIC_HARDIRQS
 -# include <linux/irq.h>
 -#endif
 -
  #include <asm/processor.h>
  #include <asm/uaccess.h>
  #include <asm/irq.h>
