From: Huang Shijie <shijie.huang@arm.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Wed, 9 Nov 2016 15:18:24 +0800
Message-ID: <20161109071823.GA15161@sha-win-210.asiapac.arm.com>
References: <20161109151006.7354dfae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161109151006.7354dfae@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nd@arm.com
List-Id: linux-next.vger.kernel.org

On Wed, Nov 09, 2016 at 03:10:06PM +1100, Stephen Rothwell wrote:
Hi Stephen,
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> mm/hugetlb.c:1166:21: warning: 'alloc_gigantic_page' defined but not used [-Wunused-function]
>  static struct page *alloc_gigantic_page(int nid, unsigned int order)
The warning should be fixed by the patch (or next version of this patch):
  http://marc.info/?l=linux-mm&m=147867535926059&w=2	


Thanks
Huang Shijie
