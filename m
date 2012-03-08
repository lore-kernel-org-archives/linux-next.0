From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with Linus' tree
Date: Wed, 7 Mar 2012 23:32:20 -0800
Message-ID: <20120307233220.5a76aa3c.akpm@linux-foundation.org>
References: <20120308175307.b295b1013728a5666fe4571a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:55511 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751993Ab2CHHaS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Mar 2012 02:30:18 -0500
In-Reply-To: <20120308175307.b295b1013728a5666fe4571a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

On Thu, 8 Mar 2012 17:53:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in
> arch/x86/mm/hugetlbpage.c between commit 097d59106a8e ("vm: avoid using
> find_vma_prev() unnecessarily") from Linus' tree and commit "hugetlb:
> drop prev_vma in hugetlb_get_unmapped_area_topdown()" from the akpm tree.
> 
> I think the latter is a superset of the former, so I just dropped the
> changes from the former.

Actually they're different.  I reworked the earlier patch as below.


From: Xiao Guangrong <xiaoguangrong@linux.vnet.ibm.com>
Subject: hugetlb: drop prev_vma in hugetlb_get_unmapped_area_topdown()

After the call find_vma_prev(mm, addr, &prev_vma), the following condition
is always true:

	!prev_vma || (addr >= prev_vma->vm_end)

it can happily drop prev_vma and use find_vma() instead of find_vma_prev().

Signed-off-by: Xiao Guangrong <xiaoguangrong@linux.vnet.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Michal Hocko <mhocko@suse.cz>
Cc: Hillf Danton <dhillf@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Cc: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/x86/mm/hugetlbpage.c |   23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff -puN arch/x86/mm/hugetlbpage.c~hugetlb-drop-prev_vma-in-hugetlb_get_unmapped_area_topdown arch/x86/mm/hugetlbpage.c
--- a/arch/x86/mm/hugetlbpage.c~hugetlb-drop-prev_vma-in-hugetlb_get_unmapped_area_topdown
+++ a/arch/x86/mm/hugetlbpage.c
@@ -308,7 +308,7 @@ static unsigned long hugetlb_get_unmappe
 {
 	struct hstate *h = hstate_file(file);
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma, *prev_vma;
+	struct vm_area_struct *vma;
 	unsigned long base = mm->mmap_base, addr = addr0;
 	unsigned long largest_hole = mm->cached_hole_size;
 	int first_time = 1;
@@ -334,25 +334,16 @@ try_again:
 		 * i.e. return with success:
 		 */
 		vma = find_vma(mm, addr);
-		if (!vma)
-			return addr;
-
-		/*
-		 * new region fits between prev_vma->vm_end and
-		 * vma->vm_start, use it:
-		 */
-		prev_vma = vma->vm_prev;
-		if (addr + len <= vma->vm_start &&
-		            (!prev_vma || (addr >= prev_vma->vm_end))) {
+		if (vma)
+			prev_vma = vma->vm_prev;
+		if (!vma || addr + len <= vma->vm_start) {
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
_
