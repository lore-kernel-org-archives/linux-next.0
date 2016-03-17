From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: ARC !THP broken in linux-next (was Re: [PATCH V2] mm/thp/migration:
 switch from flush_tlb_range to flush_pmd_tlb_range)
Date: Thu, 17 Mar 2016 15:05:52 +0530
Message-ID: <56EA7A78.6020308@synopsys.com>
References: <1455118510-15031-1-git-send-email-aneesh.kumar@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1455118510-15031-1-git-send-email-aneesh.kumar@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, akpm@linux-foundation.org, Mel Gorman <mgorman@techsingularity.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Aneesh,

On Wednesday 10 February 2016 09:05 PM, Aneesh Kumar K.V wrote:
> We remove one instace of flush_tlb_range here. That was added by
> f714f4f20e59ea6eea264a86b9a51fd51b88fc54 ("mm: numa: call MMU notifiers
> on THP migration"). But the pmdp_huge_clear_flush_notify should have
> done the require flush for us. Hence remove the extra flush.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>

linux-next fails for ARC with this - although this is not your fault.
Back then, per your request I did verify that ARC builds fine with this for
CONFIG_TRANSPARENT_HUGEPAGE worked. However I failed to check the !THP case which
is broken.

@Andrew could you please add the patch below to mm tree !

Thx,
Vineet

------------>
>From 8e31856c9b154cc152486aa411ee38b4c737c7c3 Mon Sep 17 00:00:00 2001
From: Vineet Gupta <vgupta@synopsys.com>
Date: Thu, 17 Mar 2016 15:00:59 +0530
Subject: [PATCH] ARC: thp: unbork !CONFIG_TRANSPARENT_HUGEPAGE build

linux-next for 4.6-rc1 timeline reported ARC build failures !THP

| arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined
[enabled by default]
| arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined
[enabled by default]
| arch/arc/include/asm/tlbflush.h:29:0: warning: "flush_pmd_tlb_range" redefined
[enabled by default]

Turns out that commit ("mm/thp/migration: switch from flush_tlb_range
to flush_pmd_tlb_range") triggered the issue while the problem was in
ARC code where THP specific helpers were not guarded with #ifdef.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/include/asm/tlbflush.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/tlbflush.h b/arch/arc/include/asm/tlbflush.h
index 1fe9c8c80280..f0d42f1e83f5 100644
--- a/arch/arc/include/asm/tlbflush.h
+++ b/arch/arc/include/asm/tlbflush.h
@@ -17,8 +17,10 @@ void local_flush_tlb_page(struct vm_area_struct *vma, unsigned
long page);
 void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);
 void local_flush_tlb_range(struct vm_area_struct *vma,
 			   unsigned long start, unsigned long end);
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void local_flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			       unsigned long end);
+#endif

 #ifndef CONFIG_SMP
 #define flush_tlb_range(vma, s, e)	local_flush_tlb_range(vma, s, e)
@@ -26,7 +28,9 @@ void local_flush_pmd_tlb_range(struct vm_area_struct *vma,
unsigned long start,
 #define flush_tlb_kernel_range(s, e)	local_flush_tlb_kernel_range(s, e)
 #define flush_tlb_all()			local_flush_tlb_all()
 #define flush_tlb_mm(mm)		local_flush_tlb_mm(mm)
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define flush_pmd_tlb_range(vma, s, e)	local_flush_pmd_tlb_range(vma, s, e)
+#endif
 #else
 extern void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 							 unsigned long end);
@@ -34,7 +38,8 @@ extern void flush_tlb_page(struct vm_area_struct *vma, unsigned
long page);
 extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 extern void flush_tlb_all(void);
 extern void flush_tlb_mm(struct mm_struct *mm);
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 extern void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
unsigned long end);
-
+#endif
 #endif /* CONFIG_SMP */
 #endif
-- 
2.5.0

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
