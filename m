From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Fri, 3 Jun 2016 13:14:19 +0900
Message-ID: <20160603041351.GA10882@swordfish>
References: <20160601131122.7dbb0a65@canb.auug.org.au>
 <20160602014835.GA635@swordfish>
 <0c47a3a0-5530-b257-1c1f-28ed44ba97e6@suse.cz>
 <20160602185856.GA3854@debian>
 <20160603010036.GA464@swordfish>
 <20160603012919.GB464@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:34367 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750748AbcFCEP3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jun 2016 00:15:29 -0400
Content-Disposition: inline
In-Reply-To: <20160603012919.GB464@swordfish>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Ebru Akagunduz <ebru.akagunduz@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrea Arcangeli <aarcange@redhat.com>, Rik van Riel <riel@redhat.com>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On (06/03/16 10:29), Sergey Senozhatsky wrote:
> > 	if (allocstall == curr_allocstall && swap != 0) {
> > 		if (!__collapse_huge_page_swapin(mm, vma, address, pmd)) {
> > 			{
> > 			:	if (ret & VM_FAULT_RETRY) {
> > 			:		down_read(&mm->mmap_sem);
> > 			:		^^^^^^^^^
> 
> oh... it's in a loop
> 
> 		for (_address = address; _address < address + HPAGE_PMD_NR*PAGE_SIZE;
> 						pte++, _address += PAGE_SIZE) {
> 			ret = do_swap_page()
> 			if (ret & VM_FAULT_RETRY) {
> 				down_read(&mm->mmap_sem);
> 				^^^^^^^^^
> 				...
> 			}
> 		}
> 
> so there can be multiple sem->count++ in __collapse_huge_page_swapin(),
> and you don't know how many sem->count-- you need to do later? is this
> correct or am I hallucinating?

No, I was wrong, sorry for the noise.

it's getting unlocked in

__collapse_huge_page_swapin()
	do_swap_page()
		lock_page_or_retry()
			if (flags & FAULT_FLAG_ALLOW_RETRY)
				up_read(&mm->mmap_sem);
	return VM_FAULT_RETRY

	-ss
