From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 10 Nov 2016 13:56:57 +1100
Message-ID: <20161110135657.2fbe73df@canb.auug.org.au>
References: <20161109151006.7354dfae@canb.auug.org.au>
        <20161109071823.GA15161@sha-win-210.asiapac.arm.com>
        <20161109132153.60da86bfe834249ef7b294e9@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40303 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754688AbcKJC47 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Nov 2016 21:56:59 -0500
In-Reply-To: <20161109132153.60da86bfe834249ef7b294e9@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Huang Shijie <shijie.huang@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nd@arm.com

Hi Andrew,

On Wed, 9 Nov 2016 13:21:53 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 9 Nov 2016 15:18:24 +0800 Huang Shijie <shijie.huang@arm.com> wrote:
> 
> > On Wed, Nov 09, 2016 at 03:10:06PM +1100, Stephen Rothwell wrote:
> > Hi Stephen,  
> > > Hi Andrew,
> > > 
> > > After merging the akpm-current tree, today's linux-next build (powerpc
> > > ppc64_defconfig) produced this warning:
> > > 
> > > mm/hugetlb.c:1166:21: warning: 'alloc_gigantic_page' defined but not used [-Wunused-function]
> > >  static struct page *alloc_gigantic_page(int nid, unsigned int order)  
> > The warning should be fixed by the patch (or next version of this patch):
> >   http://marc.info/?l=linux-mm&m=147867535926059&w=2	  
> 
> I'll drop "mm/hugetlb.c: rename some allocation functions" for now. 
> Please change it to fix this warning then add it to the surplus-page
> series when resending that.

I have dropped it from linux-next today.

-- 
Cheers,
Stephen Rothwell
