From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Thu, 23 Oct 2008 15:52:28 +1100
Message-ID: <20081023155228.c8fa9da8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38677 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751874AbYJWFCH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 01:02:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, ppc-dev <linuxppc-dev@ozlabs.org>, Mike Travis <travis@sgi.com>

Hi Rusty,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

arch/powerpc/platforms/cell/spu_base.c: In function 'mm_needs_global_tlbie':
arch/powerpc/platforms/cell/spu_base.c:117: error: implicit declaration of function '__cpus_setall'

Caused by commit 20ec1a8465bd6d2e7e68fa5a7b09309c920b4792
("cpumask:add-struct-cpumask") which removed __cpus_setall from
include/linux/cpumask.h.

I applied the hack patch below (which is probably not what we want).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 23 Oct 2008 15:36:21 +1100
Subject: [PATCH] powerpc/spu: cpumask updates fallout.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/platforms/cell/spu_base.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spu_base.c b/arch/powerpc/platforms/cell/spu_base.c
index a5bdb89..a876904 100644
--- a/arch/powerpc/platforms/cell/spu_base.c
+++ b/arch/powerpc/platforms/cell/spu_base.c
@@ -111,10 +111,13 @@ void spu_flush_all_slbs(struct mm_struct *mm)
  */
 static inline void mm_needs_global_tlbie(struct mm_struct *mm)
 {
-	int nr = (NR_CPUS > 1) ? NR_CPUS : NR_CPUS + 1;
-
 	/* Global TLBIE broadcast required with SPEs. */
-	__cpus_setall(&mm->cpu_vm_mask, nr);
+	if (NR_CPUS > 1)
+		cpumask_setall(&mm->cpu_vm_mask);
+	else {
+		cpumask_set_cpu(0, &mm->cpu_vm_mask);
+		cpumask_set_cpu(1, &mm->cpu_vm_mask);
+	}
 }
 
 void spu_associate_mm(struct spu *spu, struct mm_struct *mm)
-- 
1.5.6.5
