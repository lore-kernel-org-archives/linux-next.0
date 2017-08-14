From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Mon, 14 Aug 2017 20:54:25 +0200
Message-ID: <20170814185425.GM6524@worktop.programming.kicks-ass.net>
References: <20170811175326.36d546dc@canb.auug.org.au>
 <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
 <20170811214556.322b3c4e@canb.auug.org.au>
 <20170811115607.p2vgqcp7w3wurhvw@gmail.com>
 <20170811140450.irhxa2bhdpmmhhpv@hirez.programming.kicks-ass.net>
 <20170814030914.GC25427@bbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170814030914.GC25427@bbox>
Sender: linux-kernel-owner@vger.kernel.org
To: Minchan Kim <minchan@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nadav Amit <namit@vmware.com>, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Mon, Aug 14, 2017 at 12:09:14PM +0900, Minchan Kim wrote:
> @@ -446,9 +450,7 @@ void tlb_finish_mmu(struct mmu_gather *tlb,
>  	 *
>  	 */
>  	bool force = mm_tlb_flush_nested(tlb->mm);
> -
>  	arch_tlb_finish_mmu(tlb, start, end, force);
> -	dec_tlb_flush_pending(tlb->mm);
>  }

No, I think this breaks all the mm_tlb_flush_pending() users. They need
the decrement to not be visible until the TLB flush is complete.
