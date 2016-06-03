From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Fri, 3 Jun 2016 16:15:51 +0900
Message-ID: <20160603071551.GA453@swordfish>
References: <20160601131122.7dbb0a65@canb.auug.org.au>
 <20160602014835.GA635@swordfish>
 <20160602092113.GH1995@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20160602092113.GH1995@dhcp22.suse.cz>
Sender: owner-linux-mm@kvack.org
To: Michal Hocko <mhocko@kernel.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>
List-Id: linux-next.vger.kernel.org

Hello,

On (06/02/16 11:21), Michal Hocko wrote:
[..]
> @@ -2863,6 +2854,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages,
>  
>  		collect_mm_slot(mm_slot);
>  	}
> +	mmput(mm);
>  
>  	return progress;
>  }

this possibly sleeping mmput() is called from
under the spin_lock(&khugepaged_mm_lock).

there is also a trivial build fixup needed
(move collect_mm_slot() before __khugepaged_exit()).


it's quite hard to trigger the bug (somehow), so I can't
follow up with more information as of now.

	-ss

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
