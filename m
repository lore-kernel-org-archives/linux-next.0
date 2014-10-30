From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 30 Oct 2014 14:30:39 +0530
Message-ID: <87lhny7wzs.fsf@linux.vnet.ibm.com>
References: <20141030161921.0e204257@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141030161921.0e204257@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Andrew,
>
> After merging the akpm tree, today's linux-next build (arm multi_v7_defconfig)
> produced this warning:
>
> In file included from include/linux/mm.h:52:0,
>                  from mm/gup.c:7:
> arch/arm/include/asm/pgtable.h:184:0: warning: "pgd_huge" redefined
>  #define pgd_huge(pgd)  (0)
>  ^
> In file included from mm/gup.c:6:0:
> include/linux/hugetlb.h:183:0: note: this is the location of the previous definition
>  #define pgd_huge(x) 0
>  ^
>
> Introduced by commit fee025d5dd4e ("mm: update generic gup
> implementation to handle hugepage directory").


Should be fixed by.
http://mid.gmane.org/1414570785-18966-1-git-send-email-aneesh.kumar@linux.vnet.ibm.com
IIUC the changes are going via powerpc tree. So not sure how it gets updated.

-aneesh
