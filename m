From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Wed, 9 Nov 2016 13:21:53 -0800
Message-ID: <20161109132153.60da86bfe834249ef7b294e9@linux-foundation.org>
References: <20161109151006.7354dfae@canb.auug.org.au>
        <20161109071823.GA15161@sha-win-210.asiapac.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161109071823.GA15161@sha-win-210.asiapac.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Huang Shijie <shijie.huang@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nd@arm.com
List-Id: linux-next.vger.kernel.org

On Wed, 9 Nov 2016 15:18:24 +0800 Huang Shijie <shijie.huang@arm.com> wrote:

> On Wed, Nov 09, 2016 at 03:10:06PM +1100, Stephen Rothwell wrote:
> Hi Stephen,
> > Hi Andrew,
> > 
> > After merging the akpm-current tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> > 
> > mm/hugetlb.c:1166:21: warning: 'alloc_gigantic_page' defined but not used [-Wunused-function]
> >  static struct page *alloc_gigantic_page(int nid, unsigned int order)
> The warning should be fixed by the patch (or next version of this patch):
>   http://marc.info/?l=linux-mm&m=147867535926059&w=2	

I'll drop "mm/hugetlb.c: rename some allocation functions" for now. 
Please change it to fix this warning then add it to the surplus-page
series when resending that.
