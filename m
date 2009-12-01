From: Tejun Heo <tj@kernel.org>
Subject: [PATCH] percpu: add missing per_cpu_ptr_to_phys() definition for
 UP
Date: Wed, 02 Dec 2009 08:42:34 +0900
Message-ID: <4B15A9EA.3090108@kernel.org>
References: <4B1560C2.8040603@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:53498 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751352AbZLAXlM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Dec 2009 18:41:12 -0500
In-Reply-To: <4B1560C2.8040603@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Vivek Goyal <vgoyal@redhat.com>

Commit 3b034b0d084221596bf35c8d893e1d4d5477b9cc implemented
per_cpu_ptr_to_phys() but forgot to add UP definition.  Add UP
definition which is simple wrapper around __pa().

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Vivek Goyal <vgoyal@redhat.com>
Reported-by: Randy Dunlap <randy.dunlap@oracle.com>
---
Hello,

> drivers/base/cpu.c: line 100: fails to build when CONFIG_SMP=n:
> 
> 	addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpunum));
> 
> Can you suggest a fix for that, please?

Oops, right, UP definition was missing.  This patch should do it.

Thanks.

 include/linux/percpu.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 6ac984f..8e4ead6 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -180,6 +180,11 @@ static inline void free_percpu(void *p)
 	kfree(p);
 }
 
+static inline phys_addr_t per_cpu_ptr_to_phys(void *addr)
+{
+	return __pa(addr);
+}
+
 static inline void __init setup_per_cpu_areas(void) { }
 
 static inline void *pcpu_lpage_remapped(void *kaddr)
-- 
1.6.4.2
