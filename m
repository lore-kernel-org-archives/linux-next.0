From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: BUG: non-zero nr_pmds on freeing mm: 1
Date: Mon, 9 Feb 2015 18:06:11 +0100
Message-ID: <CA+icZUU_xYhg1kqbrb+y71EQQWNPk0vf9V2YS4dimXBA5jTYCg@mail.gmail.com>
References: <CA+icZUVTVdHc3QYD1LkWn=Xt-Zz6RcXPcjL6Xbpz0FZ6rdA5CQ@mail.gmail.com>
	<20150209164248.GA29522@node.dhcp.inet.fi>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:43300 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932961AbbBIRGM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Feb 2015 12:06:12 -0500
Received: by mail-we0-f181.google.com with SMTP id w62so10833332wes.12
        for <linux-next@vger.kernel.org>; Mon, 09 Feb 2015 09:06:11 -0800 (PST)
In-Reply-To: <20150209164248.GA29522@node.dhcp.inet.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Pat Erley <pat-lkml@erley.org>, Linux-Next <linux-next@vger.kernel.org>, kirill.shutemov@linux.intel.com, linux-mm <linux-mm@kvack.org>, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@suse.cz>, Andrew Morton <akpm@linux-foundation.org>

On Mon, Feb 9, 2015 at 5:42 PM, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> On Sat, Feb 07, 2015 at 08:33:02AM +0100, Sedat Dilek wrote:
>> On Sat, Feb 7, 2015 at 6:12 AM, Pat Erley <pat-lkml@erley.org> wrote:
>> > I'm seeing the message in $subject on my Xen DOM0 on next-20150204 on
>> > x86_64.  I haven't had time to bisect it, but have seen some discussion on
>> > similar topics here recently.  I can trigger this pretty reliably by
>> > watching Netflix.  At some point (minutes to hours) into it, the netflix
>> > video goes black (audio keeps going, so it still thinks it's working) and
>> > the error appears in dmesg.  Refreshing the page gets the video going again,
>> > and it will continue playing for some indeterminate amount of time.
>> >
>> > Kirill, I've CC'd you as looking in the logs, you've patched a false
>> > positive trigger of this very recently(patch in kernel I'm running).  Am I
>> > actually hitting a problem, or is this another false positive case? Any
>> > additional details that might help?
>> >
>> > Dmesg from system attached.
>>
>> [ CC some mm folks ]
>>
>> I have seen this, too.
>>
>> root# grep "BUG: non-zero nr_pmds on freeing mm:" /var/log/kern.log | wc -l
>> 21
>>
>> Checking my logs: On next-20150203 and next-20150204.
>>
>> I am here not in a VM environment and cannot say what causes these messages.
>
> Sorry, my fault.
>
> The patch below should fix that.
>
> From 11bce596e653302e41f819435912f01ca8cbc27e Mon Sep 17 00:00:00 2001
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Date: Mon, 9 Feb 2015 18:34:56 +0200
> Subject: [PATCH] mm: fix race on pmd accounting
>
> Do not account the pmd table to the process if other thread allocated it
> under us.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reported-by: Sedat Dilek <sedat.dilek@gmail.com>

Still building with the fix...

Please feel free to add Pat as a reporter.

     Reported-by: Pat Erley <pat-lkml@erley.org>

Is that fixing...?

commit daa1b0f29cdccae269123e7f8ae0348dbafdc3a7
"mm: account pmd page tables to the process"

If yes, please add a Fixes-tag [2]...

     Fixes: daa1b0f29cdc ("mm: account pmd page tables to the process")

I will re-test with LTP/mmap and report.

- Sedat -

[1] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=daa1b0f29cdccae269123e7f8ae0348dbafdc3a7
[2] http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches#n164

> ---
>  mm/memory.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 8ae52c918415..802adda2b0b6 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3350,17 +3350,18 @@ int __pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
>         smp_wmb(); /* See comment in __pte_alloc */
>
>         spin_lock(&mm->page_table_lock);
> -       mm_inc_nr_pmds(mm);
>  #ifndef __ARCH_HAS_4LEVEL_HACK
> -       if (pud_present(*pud))          /* Another has populated it */
> -               pmd_free(mm, new);
> -       else
> +       if (!pud_present(*pud)) {
> +               mm_inc_nr_pmds(mm);
>                 pud_populate(mm, pud, new);
> -#else
> -       if (pgd_present(*pud))          /* Another has populated it */
> +       } else  /* Another has populated it */
>                 pmd_free(mm, new);
> -       else
> +#else
> +       if (!pgd_present(*pud)) {
> +               mm_inc_nr_pmds(mm);
>                 pgd_populate(mm, pud, new);
> +       } else /* Another has populated it */
> +               pmd_free(mm, new);
>  #endif /* __ARCH_HAS_4LEVEL_HACK */
>         spin_unlock(&mm->page_table_lock);
>         return 0;
> --
>  Kirill A. Shutemov
