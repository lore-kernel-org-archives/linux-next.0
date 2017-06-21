From: Dennis Zhou <dennisz@fb.com>
Subject: [PATCH 1/1] percpu: resolve err may not be initialized in pcpu_alloc
Date: Wed, 21 Jun 2017 11:51:09 -0400
Message-ID: <20170621155108.GA89068@dennisz-mbp.dhcp.thefacebook.com>
References: <20170621152020.47cacaf6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:47939 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751988AbdFUQdq (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Jun 2017 12:33:46 -0400
Content-Disposition: inline
In-Reply-To: <20170621152020.47cacaf6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

>From 4a42ecc735cff0015cc73c3d87edede631f4b885 Mon Sep 17 00:00:00 2001
From: Dennis Zhou <dennisz@fb.com>
Date: Wed, 21 Jun 2017 08:07:15 -0700

Add error message to out of space failure for atomic allocations in
percpu allocation path to fix -Wmaybe-uninitialized.

Signed-off-by: Dennis Zhou <dennisz@fb.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/percpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/percpu.c b/mm/percpu.c
index a5bc363..bd4130a 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -956,8 +956,10 @@ static void __percpu *pcpu_alloc(size_t size, size_t align, bool reserved,
 	 * tasks to create chunks simultaneously.  Serialize and create iff
 	 * there's still no empty chunk after grabbing the mutex.
 	 */
-	if (is_atomic)
+	if (is_atomic) {
+		err = "atomic alloc failed, no space left";
 		goto fail;
+	}
 
 	if (list_empty(&pcpu_slot[pcpu_nr_slots - 1])) {
 		chunk = pcpu_create_chunk();
-- 
2.9.3
