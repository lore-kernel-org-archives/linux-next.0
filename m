From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Subject: Re: +
 mm-x86-add-support-for-pud-sized-transparent-hugepages-fix-fix.patch added
 to -mm tree
Date: Tue, 21 Feb 2017 19:12:06 +0200
Message-ID: <20170221171206.GA4397@box1>
References: <58a4bc95.wUw3v0FZUCnAXeFL%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33109 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753514AbdBURMR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Feb 2017 12:12:17 -0500
Content-Disposition: inline
In-Reply-To: <58a4bc95.wUw3v0FZUCnAXeFL%akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: dave.jiang@intel.com, mm-commits@vger.kernel.org, linux-next@vger.kernel.org

On Wed, Feb 15, 2017 at 12:39:49PM -0800, akpm@linux-foundation.org wrote:
> 
> The patch titled
>      Subject: mm,x86: fix SMP x86 32bit build for native_pud_clear()
> has been added to the -mm tree.  Its filename is
>      mm-x86-add-support-for-pud-sized-transparent-hugepages-fix-fix.patch
> 
> This patch should soon appear at
>     http://ozlabs.org/~akpm/mmots/broken-out/mm-x86-add-support-for-pud-sized-transparent-hugepages-fix-fix.patch
> and later at
>     http://ozlabs.org/~akpm/mmotm/broken-out/mm-x86-add-support-for-pud-sized-transparent-hugepages-fix-fix.patch
> 
> Before you just go and hit "reply", please:
>    a) Consider who else should be cc'ed
>    b) Prefer to cc a suitable mailing list as well
>    c) Ideally: find the original patch on the mailing list and do a
>       reply-to-all to that, adding suitable additional cc's
> 
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
> 
> The -mm tree is included into linux-next and is updated
> there every 3-4 working days
> 
> ------------------------------------------------------
> From: Dave Jiang <dave.jiang@intel.com>
> Subject: mm,x86: fix SMP x86 32bit build for native_pud_clear()
> 
> The fix introduced by e4decc90 to fix the UP case for 32bit x86, however
> that broke the SMP case that was working previously. Add ifdef so the dummy
> function only show up for 32bit UP case only.
> 
> Fix: e4decc90 mm,x86: native_pud_clear missing on i386 build
> 
> Link: http://lkml.kernel.org/r/148719066814.31111.3239231168815337012.stgit@djiang5-desk3.ch.intel.com
> Signed-off-by: Dave Jiang <dave.jiang@intel.com>
> Reported-by: Alexander Kapshuk <alexander.kapshuk@gmail.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  arch/x86/include/asm/pgtable-3level.h |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff -puN arch/x86/include/asm/pgtable-3level.h~mm-x86-add-support-for-pud-sized-transparent-hugepages-fix-fix arch/x86/include/asm/pgtable-3level.h
> --- a/arch/x86/include/asm/pgtable-3level.h~mm-x86-add-support-for-pud-sized-transparent-hugepages-fix-fix
> +++ a/arch/x86/include/asm/pgtable-3level.h
> @@ -121,9 +121,11 @@ static inline void native_pmd_clear(pmd_
>  	*(tmp + 1) = 0;
>  }
>  
> +#ifndef CONFIG_SMP
>  static inline void native_pud_clear(pud_t *pudp)
>  {
>  }
> +#endif
>  
>  static inline void pud_clear(pud_t *pudp)
>  {
> _
> 
> Patches currently in -mm which might be from dave.jiang@intel.com are
> 
> mm-dax-make-pmd_fault-and-friends-to-be-the-same-as-fault.patch
> mm-dax-make-pmd_fault-and-friends-to-be-the-same-as-fault-v7.patch
> mm-dax-move-pmd_fault-to-take-only-vmf-parameter.patch
> mm-fs-reduce-fault-page_mkwrite-and-pfn_mkwrite-to-take-only-vmf.patch
> mmfsdax-change-pmd_fault-to-huge_fault.patch
> mmfsdax-change-pmd_fault-to-huge_fault-fix.patch
> mm-x86-add-support-for-pud-sized-transparent-hugepages-fix.patch
> mm-x86-add-support-for-pud-sized-transparent-hugepages-fix-fix.patch
> dax-support-for-transparent-pud-pages-for-device-dax.patch
> mm-replace-fault_flag_size-with-parameter-to-huge_fault.patch
> 

Just a quick note to let you know that the patch included in next-20170221 did fix the problem I reported.

Thanks once again.
