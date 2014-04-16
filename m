From: Mel Gorman <mgorman@suse.de>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 16 Apr 2014 20:21:35 +0100
Message-ID: <20140416192135.GY7292@suse.de>
References: <20140416151956.b3388ef9c11c6c58b535186f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140416151956.b3388ef9c11c6c58b535186f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Apr 16, 2014 at 03:19:56PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from mm/vmscan.c:50:0:
> include/linux/swapops.h: In function 'is_swap_pte':
> include/linux/swapops.h:57:2: error: implicit declaration of function 'pte_present_nonuma' [-Werror=implicit-function-declaration]
>   return !pte_none(pte) && !pte_present_nonuma(pte) && !pte_file(pte);
>   ^
> 
> Caused by commit 851fe3337768 ("x86: define _PAGE_NUMA by reusing
> software bits on the PMD and PTE levels").  This build does not have
> CONFIG_NUMA_BALANCING set.
> 
> I have reverted that commit for today.

Thanks Stephen. A patch that should address the problem is on its way to
Andrew.

-- 
Mel Gorman
SUSE Labs
