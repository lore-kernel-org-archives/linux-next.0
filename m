From: Xiao Guangrong <xiaoguangrong@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the akpm tree with Linus' tree
Date: Thu, 08 Mar 2012 17:59:02 +0800
Message-ID: <4F5882E6.8080202@linux.vnet.ibm.com>
References: <20120308175307.b295b1013728a5666fe4571a@canb.auug.org.au> <20120307233220.5a76aa3c.akpm@linux-foundation.org> <20120308184105.5b03ec90bcddf90562181277@canb.auug.org.au> <20120307235012.847af577.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp08.au.ibm.com ([202.81.31.141]:39533 "EHLO
	e23smtp08.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751644Ab2CHJ7U (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Mar 2012 04:59:20 -0500
Received: from /spool/local
	by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <xiaoguangrong@linux.vnet.ibm.com>;
	Thu, 8 Mar 2012 09:56:56 +1000
In-Reply-To: <20120307235012.847af577.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

On 03/08/2012 03:50 PM, Andrew Morton wrote:


> Doh.  The author reviewed that for me too!
> 
> I'll drop it - please rework, retest and resend?
> 


Andrew, the patch has been reworked.

Subject: [PATCH] hugetlb: drop prev_vma in hugetlb_get_unmapped_area_topdown()

After the call find_vma_prev(mm, addr, &prev_vma), the following condition
is always true:

	!prev_vma || (addr >= prev_vma->vm_end)

it can happily drop prev_vma and use find_vma() instead of find_vma_prev().

Signed-off-by: Xiao Guangrong <xiaoguangrong@linux.vnet.ibm.com>
---
 arch/x86/mm/hugetlbpage.c |   18 +++++-------------
 1 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 8ecbb4b..0c1701b 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -308,7 +308,7 @@ static unsigned long hugetlb_get_unmapped_area_topdown(struct file *file,
 {
 	struct hstate *h = hstate_file(file);
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma, *prev_vma;
+	struct vm_area_struct *vma;
 	unsigned long base = mm->mmap_base, addr = addr0;
 	unsigned long largest_hole = mm->cached_hole_size;
 	int first_time = 1;
@@ -337,22 +337,14 @@ try_again:
 		if (!vma)
 			return addr;

-		/*
-		 * new region fits between prev_vma->vm_end and
-		 * vma->vm_start, use it:
-		 */
-		prev_vma = vma->vm_prev;
-		if (addr + len <= vma->vm_start &&
-		            (!prev_vma || (addr >= prev_vma->vm_end))) {
+		if (addr + len <= vma->vm_start) {
 			/* remember the address as a hint for next time */
 		        mm->cached_hole_size = largest_hole;
 		        return (mm->free_area_cache = addr);
-		} else {
+		} else if (mm->free_area_cache == vma->vm_end) {
 			/* pull free_area_cache down to the first hole */
-		        if (mm->free_area_cache == vma->vm_end) {
-				mm->free_area_cache = vma->vm_start;
-				mm->cached_hole_size = largest_hole;
-			}
+			mm->free_area_cache = vma->vm_start;
+			mm->cached_hole_size = largest_hole;
 		}

 		/* remember the largest hole we saw so far */
-- 
1.7.7.6
