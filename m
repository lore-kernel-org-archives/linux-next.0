From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 1 Aug 2017 15:29:13 +1000
Message-ID: <20170801152913.7fcfbf26@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/kernel/rtas.c: In function 'rtas_online_cpus_mask':
arch/powerpc/kernel/rtas.c:917:37: error: 'GFP_KENREL' undeclared (first use in this function)
   if (!alloc_cpumask_var(&tmp_mask, GFP_KENREL))
                                     ^

Caused by commit

  404170cf1c4c ("mm: treewide: remove GFP_TEMPORARY allocation flag")

I added the following patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 1 Aug 2017 15:25:33 +1000
Subject: [PATCH] mm: treewide: remove GFP_TEMPORARY allocation flag fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/rtas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 90d27dcd0da8..1643e9e53655 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -914,7 +914,7 @@ int rtas_online_cpus_mask(cpumask_var_t cpus)
 	if (ret) {
 		cpumask_var_t tmp_mask;
 
-		if (!alloc_cpumask_var(&tmp_mask, GFP_KENREL))
+		if (!alloc_cpumask_var(&tmp_mask, GFP_KERNEL))
 			return ret;
 
 		/* Use tmp_mask to preserve cpus mask from first failure */
-- 
2.13.2

-- 
Cheers,
Stephen Rothwell
