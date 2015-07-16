From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 16 Jul 2015 15:32:40 +1000
Message-ID: <20150716153240.4faff811@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33633 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752068AbbGPFcm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2015 01:32:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Chris Metcalf <cmetcalf@ezchip.com>, Thomas Gleixner <tglx@linutronix.de>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: ".smpboot_register_percpu_thread_cpumask" [drivers/infiniband/hw/ehca/ib_ehca.ko] undefined!

Caused by commit

  2b07b4da35a9 ("smpboot: allow passing the cpumask on per-cpu thread registration")

I have added the following build faix for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 16 Jul 2015 15:30:05 +1000
Subject: [PATCH] smpboot: fix for allow passing the cpumask on per-cpu thread registration

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/smpboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/smpboot.c b/kernel/smpboot.c
index d99a41d25b0c..a818cbc73e14 100644
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -308,7 +308,7 @@ out:
 	put_online_cpus();
 	return ret;
 }
-EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
+EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread_cpumask);
 
 /**
  * smpboot_unregister_percpu_thread - Unregister a per_cpu thread related to hotplug
-- 
2.1.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
