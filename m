From: Tejun Heo <htejun@gmail.com>
Subject: [PATCH] percpu: add dummy pcpu_lpage_remapped() for !CONFIG_SMP
Date: Wed, 15 Jul 2009 23:39:09 +0900
Message-ID: <4A5DEA0D.8050706@gmail.com>
References: <20090706162632.fdde002e.sfr@canb.auug.org.au>	<20090706095343.df21d4c9.rdunlap@xenotime.net>	<20090709102248.01e2312c.randy.dunlap@oracle.com>	<20090715094720.GA6674@linux.vnet.ibm.com> <20090715195807.f0d1a7ea.sfr@canb.auug.org.au> <4A5DA937.6040605@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.231]:52860 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750797AbZGOOjQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2009 10:39:16 -0400
In-Reply-To: <4A5DA937.6040605@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Randy Dunlap <randy.dunlap@oracle.com>

!CONFIG_SMP was missing pcpu_lpage_remapped() definition causing build
failure.  Add dummy implementation.  This was discovered by linux-next
testing.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
---
Yeap, it was missing dummy definition on !CONFIG_SMP.  This patch
fixes it.  Committed to percpu#for-next.  Thanks.

 include/linux/percpu.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 8ce91af..e134c82 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -184,6 +184,11 @@ static inline void free_percpu(void *p)

 static inline void __init setup_per_cpu_areas(void) { }

+static inline void *pcpu_lpage_remapped(void *kaddr)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_SMP */

 #define alloc_percpu(type)	(type *)__alloc_percpu(sizeof(type), \
-- 
1.6.0.2
