From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [bisected a4615d11] Memory DLPAR triggers
 WARN_ONCE() in mm/page_vma_mapped.c
Date: Tue, 03 Oct 2017 14:38:30 +0530
Message-ID: <1507021710.3792.3.camel@abdul.in.ibm.com>
References: <1505123773.10243.9.camel@abdul>
         <FCEFC0A6-D32A-424C-9858-7C996956F4C0@cs.rutgers.edu>
         <1505281695.9665.5.camel@abdul.in.ibm.com>
         <08A52087-D1D6-45C9-A660-154EB6BF780B@cs.rutgers.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49414 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751194AbdJCJIi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Oct 2017 05:08:38 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9394aY5141260
        for <linux-next@vger.kernel.org>; Tue, 3 Oct 2017 05:08:38 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2dc6q1jdgc-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 03 Oct 2017 05:08:35 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <abdhalee@linux.vnet.ibm.com>;
        Tue, 3 Oct 2017 05:08:35 -0400
In-Reply-To: <08A52087-D1D6-45C9-A660-154EB6BF780B@cs.rutgers.edu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Zi Yan <zi.yan@cs.rutgers.edu>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Anshuman Khandual <khandual@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

On Fri, 2017-09-29 at 10:07 -0400, Zi Yan wrote:
> Hi Abdul,
> 
> I just want to follow up with this.
> 
> Did you have a chance to test my patch? Does it fix your original problem?

Yes I did test the patch. it fixes the warning.

Reported-and-tested-by:  Abdul Haleem <abdhalee@linux.vnet.ibm.com>

Thanks for the fix.

--
Regard's

Abdul Haleem
IBM Linux Technology Centre

> 
> On 13 Sep 2017, at 1:48, abdul wrote:
> 
> > On Mon, 2017-09-11 at 10:53 -0400, Zi Yan wrote:
> >> Hi Abdul,
> >>
> >> Can you try this patch below? I think I missed that pmd entries
> >> can be zapped, so the WARN_ONCE is unnecessary.
> >>
> >> Thanks.
> >>
> >> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> >> index 6a03946469a9..eb462e7db0a9 100644
> >> --- a/mm/page_vma_mapped.c
> >> +++ b/mm/page_vma_mapped.c
> >> @@ -167,8 +167,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
> >>                                                 return not_found(pvmw);
> >>                                         return true;
> >>                                 }
> >> -                       } else
> >> -                               WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
> >> +                       }
> >>                         return not_found(pvmw);
> >>                 } else {
> >>                         /* THP pmd was split under us: handle on pte level */
> >>
> >> --
> >> Best Regards
> >> Yan Zi
