From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: next-20160225 build: 2 failures 44 warnings (next-20160225)
Date: Fri, 26 Feb 2016 13:37:51 +0300
Message-ID: <20160226103751.GA86588@black.fi.intel.com>
References: <E1aYsmb-0006qb-76@optimist>
 <20160226094928.608520d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:26870 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751569AbcBZKh5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Feb 2016 05:37:57 -0500
Content-Disposition: inline
In-Reply-To: <20160226094928.608520d4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sudeep Holla <sudeep.holla@arm.com>
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Fri, Feb 26, 2016 at 09:49:28AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 25 Feb 2016 10:04:29 +0000 Build bot for Mark Brown <broonie@kernel.org> wrote:
> >
> > 	arm64-allmodconfig
> > ../arch/arm64/mm/hugetlbpage.c:127:42: error: macro "pte_alloc_map" passed 4 arguments, but takes just 3
> > ../arch/arm64/mm/hugetlbpage.c:127:9: error: 'pte_alloc_map' undeclared (first use in this function)
> 
> Caused by an interaction between commit
> 
>   b9c9252f278d ("mm: cleanup *pte_alloc* interfaces")
> 
> from the akpm-current tree and commit
> 
>   66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bit")
> 
> from Linus' tree (added before v4.5-rc1).
> 
> I will add a fix patch today that removes the second argument from the
> new pte_alloc_map() call added by the latter commit.

Sudeep Holla has posted patch for this.

http://lkml.kernel.org/r/1456414385-13775-1-git-send-email-sudeep.holla@arm.com

> 
> Again, grep is your friend ... (yes, I realise that the akpm-current
> tree patch was probably written against v4.4 (or some such)).
> -- 
> Cheers,
> Stephen Rothwell

-- 
 Kirill A. Shutemov
