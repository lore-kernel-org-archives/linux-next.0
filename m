From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm, thp: fix locking inconsistency in collapse_huge_page
Date: Mon, 6 Jun 2016 15:05:19 +0200
Message-ID: <12918dcd-a695-c6f4-e06f-69141c5f357f@suse.cz>
References: <0c47a3a0-5530-b257-1c1f-28ed44ba97e6@suse.cz>
 <1464956884-4644-1-git-send-email-ebru.akagunduz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1464956884-4644-1-git-send-email-ebru.akagunduz@gmail.com>
Sender: owner-linux-mm@kvack.org
To: Ebru Akagunduz <ebru.akagunduz@gmail.com>, akpm@linux-foundation.org
Cc: sergey.senozhatsky.work@gmail.com, mhocko@kernel.org, kirill.shutemov@linux.intel.com, sfr@canb.auug.org.au, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, riel@redhat.com, aarcange@redhat.com
List-Id: linux-next.vger.kernel.org

On 06/03/2016 02:28 PM, Ebru Akagunduz wrote:
> After creating revalidate vma function, locking inconsistency occured
> due to directing the code path to wrong label. This patch directs
> to correct label and fix the inconsistency.
>
> Related commit that caused inconsistency:
> http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=da4360877094368f6dfe75bbe804b0f0a5d575b0
>
> Signed-off-by: Ebru Akagunduz <ebru.akagunduz@gmail.com>

I think this does fix the inconsistency, thanks.

But looking at collapse_huge_page() as of latest -next, I wonder if 
there's another problem:

pmd = mm_find_pmd(mm, address);
...
up_read(&mm->mmap_sem);
down_write(&mm->mmap_sem);
hugepage_vma_revalidate(mm, address);
...
pte = pte_offset_map(pmd, address);

What guarantees that 'pmd' is still valid?

Vlastimil

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
