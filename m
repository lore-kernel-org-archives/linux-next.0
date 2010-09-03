From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 2/3] percpu: reduce PCPU_MIN_UNIT_SIZE to 32k
Date: Fri, 03 Sep 2010 18:26:09 +0200
Message-ID: <4C8121A1.8060809@kernel.org>
References: <20100824120714.8918f8de.sfr@canb.auug.org.au> <4C740450.3030000@cs.helsinki.fi> <alpine.DEB.2.00.1008241256280.4763@router.home> <4C741029.7090300@cs.helsinki.fi> <alpine.DEB.2.00.1008241352240.5388@router.home> <4C74D1D7.4080608@kernel.org> <4C74DB05.7000101@cs.helsinki.fi> <alpine.DEB.2.00.1008250846590.13026@router.home> <4C762734.1030402@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:47890 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752655Ab0ICQ0m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 3 Sep 2010 12:26:42 -0400
In-Reply-To: <4C762734.1030402@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

In preparation of enabling percpu allocator for UP, reduce
PCPU_MIN_UNIT_SIZE to 32k.  On UP, the first chunk doesn't have to
include static percpu variables and chunk size can be smaller which is
important as UP percpu allocator will use contiguous kernel memory to
populate chunks.

PCPU_MIN_UNIT_SIZE also determines the maximum supported allocation
size but 32k should still be enough.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 include/linux/percpu.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 49466b1..fc8130a 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -42,7 +42,7 @@
 #ifdef CONFIG_SMP

 /* minimum unit size, also is the maximum supported allocation size */
-#define PCPU_MIN_UNIT_SIZE		PFN_ALIGN(64 << 10)
+#define PCPU_MIN_UNIT_SIZE		PFN_ALIGN(32 << 10)

 /*
  * Percpu allocator can serve percpu allocations before slab is
-- 
1.7.1
