From: Mel Gorman <mgorman@techsingularity.net>
Subject: Re: linux-next: manual merge of the akpm-current tree with Linus'
 tree
Date: Mon, 24 Apr 2017 10:11:44 +0100
Message-ID: <20170424091144.63pkjdzgzbmsze6r@techsingularity.net>
References: <20170424172502.63b2c26b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170424172502.63b2c26b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Jesper Dangaard Brouer <brouer@redhat.com>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 24, 2017 at 05:25:02PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   mm/page_alloc.c
> 
> between commit:
> 
>   d34b0733b452 ("Revert "mm, page_alloc: only use per-cpu allocator for irq-safe requests"")
> 
> from Linus' tree and commit:
> 
>   f4881295a79e ("mm, page_alloc: re-enable softirq use of per-cpu page allocator")
>   e2f499864da5 ("mm-page_alloc-re-enable-softirq-use-of-per-cpu-page-allocator-checkpatch-fixes")
>   24612e65dd01 ("mm: delete NR_PAGES_SCANNED and pgdat_reclaimable()")
> 
> from the akpm-current tree.
> 

This should partially be a transient problem. The revert in Linus' tree is
now the primary patch with f4881295a79e and e2f499864da5 going away. Not
sure about 24612e65dd01

-- 
Mel Gorman
SUSE Labs
