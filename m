From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Fri, 3 Jun 2016 10:29:19 +0900
Message-ID: <20160603012919.GB464@swordfish>
References: <20160601131122.7dbb0a65@canb.auug.org.au>
 <20160602014835.GA635@swordfish>
 <0c47a3a0-5530-b257-1c1f-28ed44ba97e6@suse.cz>
 <20160602185856.GA3854@debian>
 <20160603010036.GA464@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20160603010036.GA464@swordfish>
Sender: owner-linux-mm@kvack.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Ebru Akagunduz <ebru.akagunduz@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrea Arcangeli <aarcange@redhat.com>, Rik van Riel <riel@redhat.com>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On (06/03/16 10:00), Sergey Senozhatsky wrote:
> a good find by Vlastimil.
> 
> Ebru, can you also re-visit __collapse_huge_page_swapin()? it's called
> from collapse_huge_page() under the down_read(&mm->mmap_sem), is there
> any reason to do the nested down_read(&mm->mmap_sem)?
> 
> collapse_huge_page()
> ...
> 	down_read(&mm->mmap_sem);
> 	result = hugepage_vma_revalidate(mm, vma, address);
> 	if (result)
> 		goto out;
> 
> 	pmd = mm_find_pmd(mm, address);
> 	if (!pmd) {
> 		result = SCAN_PMD_NULL;
> 		goto out;
> 	}
> 
> 	if (allocstall == curr_allocstall && swap != 0) {
> 		if (!__collapse_huge_page_swapin(mm, vma, address, pmd)) {
> 			{
> 			:	if (ret & VM_FAULT_RETRY) {
> 			:		down_read(&mm->mmap_sem);
> 			:		^^^^^^^^^

oh... it's in a loop

		for (_address = address; _address < address + HPAGE_PMD_NR*PAGE_SIZE;
						pte++, _address += PAGE_SIZE) {
			ret = do_swap_page()
			if (ret & VM_FAULT_RETRY) {
				down_read(&mm->mmap_sem);
				^^^^^^^^^
				...
			}
		}

so there can be multiple sem->count++ in __collapse_huge_page_swapin(),
and you don't know how many sem->count-- you need to do later? is this
correct or am I hallucinating?

	-ss

> 			:		if (hugepage_vma_revalidate(mm, vma, address))
> 			:			return false;
> 			:	}
> 			}
> 
> 			up_read(&mm->mmap_sem);
> 			goto out;
> 		}
> 	}
> 
> 	up_read(&mm->mmap_sem);
> 
> 
> 
> so if __collapse_huge_page_swapin() retruns true we have:
> 	- down_read() twice, up_read() once?
> 
> the locking rules here are a bit confusing. (I didn't have my morning coffee yet).
> 
> 	-ss
> 

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
