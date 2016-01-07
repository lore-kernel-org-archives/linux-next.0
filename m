From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the powerpc tree
Date: Thu, 7 Jan 2016 19:16:13 +1100
Message-ID: <20160107191613.0228560b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Neuling <mikey@neuling.org>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc64
allnoconfig) failed like this:

arch/powerpc/mm/hash_utils_64.c: In function 'get_paca_psize':
arch/powerpc/mm/hash_utils_64.c:869:19: error: 'struct paca_struct' has no member named 'context'
  return get_paca()->context.user_psize;
                   ^
arch/powerpc/mm/hash_utils_64.c:870:1: error: control reaches end of non-void function [-Werror=return-type]
 }
 ^

Caused by commit

  2fc251a8dda5 ("powerpc: Copy only required pieces of the mm_context_t to the paca")

This build has CONFIG_PPC_MM_SLICES not set ...

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 7 Jan 2016 19:07:18 +1100
Subject: [PATCH] powerpc: restore the user_psize member of the mm_context_t in
 the paca

It is used when CONFIG_PPC_MM_SLICES is not set.

Fixes: 2fc251a8dda5 ("powerpc: Copy only required pieces of the mm_context_t to the paca")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/paca.h | 2 ++
 arch/powerpc/mm/hash_utils_64.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index ef78c288c712..546540b91095 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -138,6 +138,7 @@ struct paca_struct {
 	u64 mm_ctx_low_slices_psize;
 	unsigned char mm_ctx_high_slices_psize[SLICE_ARRAY_SIZE];
 #else
+	u16 mm_ctx_user_psize;
 	u16 mm_ctx_sllp;
 #endif
 #endif
@@ -212,6 +213,7 @@ static inline void copy_mm_to_paca(mm_context_t *context)
 	memcpy(&get_paca()->mm_ctx_high_slices_psize,
 	       &context->high_slices_psize, SLICE_ARRAY_SIZE);
 #else
+	get_paca()->mm_ctx_user_psize = context->user_psize;
 	get_paca()->mm_ctx_sllp = context->sllp;
 #endif
 }
diff --git a/arch/powerpc/mm/hash_utils_64.c b/arch/powerpc/mm/hash_utils_64.c
index db744576d730..ba59d5977f34 100644
--- a/arch/powerpc/mm/hash_utils_64.c
+++ b/arch/powerpc/mm/hash_utils_64.c
@@ -866,7 +866,7 @@ static unsigned int get_paca_psize(unsigned long addr)
 #else
 unsigned int get_paca_psize(unsigned long addr)
 {
-	return get_paca()->context.user_psize;
+	return get_paca()->mm_ctx_user_psize;
 }
 #endif
 
-- 
2.6.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
