From: Pat Erley <pat-lkml@erley.org>
Subject: Re: BUG: non-zero nr_pmds on freeing mm: 1
Date: Sat, 07 Feb 2015 02:56:40 -0600
Message-ID: <54D5D348.70408@erley.org>
References: <CA+icZUVTVdHc3QYD1LkWn=Xt-Zz6RcXPcjL6Xbpz0FZ6rdA5CQ@mail.gmail.com> <CA+icZUVt_8wquKTq=A0tE7erL5iqQ7KsVDiJg_2CXd0Fu-VkcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from erley.org ([97.107.129.9]:54889 "EHLO remote.erley.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751815AbbBGI4p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 7 Feb 2015 03:56:45 -0500
In-Reply-To: <CA+icZUVt_8wquKTq=A0tE7erL5iqQ7KsVDiJg_2CXd0Fu-VkcQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Linux-Next <linux-next@vger.kernel.org>, kirill.shutemov@linux.intel.com, linux-mm <linux-mm@kvack.org>, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@suse.cz>, Andrew Morton <akpm@linux-foundation.org>

On 02/07/2015 02:42 AM, Sedat Dilek wrote:
> On Sat, Feb 7, 2015 at 8:33 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> On Sat, Feb 7, 2015 at 6:12 AM, Pat Erley <pat-lkml@erley.org> wrote:
>>> I'm seeing the message in $subject on my Xen DOM0 on next-20150204 on
>>> x86_64.  I haven't had time to bisect it, but have seen some discussion on
>>> similar topics here recently.  I can trigger this pretty reliably by
>>> watching Netflix.  At some point (minutes to hours) into it, the netflix
>>> video goes black (audio keeps going, so it still thinks it's working) and
>>> the error appears in dmesg.  Refreshing the page gets the video going again,
>>> and it will continue playing for some indeterminate amount of time.
>>>
>>> Kirill, I've CC'd you as looking in the logs, you've patched a false
>>> positive trigger of this very recently(patch in kernel I'm running).  Am I
>>> actually hitting a problem, or is this another false positive case? Any
>>> additional details that might help?
>>>
>>> Dmesg from system attached.
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
>>
>
> I checked a bit the logs and commits in mm.git and linux-next.git.
>
> [1] lists:
>
> Kirill A. Shutemov (1): mm: do not use mm->nr_pmds on !MMU configurations
>
> NOTE: next-20150204 has this commit, but next-20150203 not (seen the
> BUG: line in both releases).
>
> Looking at Kirill's commit...
>
> At my 1st quick look I thought Kirill mixed mm_nr_pmds_init() in the
> case of defined(__PAGETABLE_PMD_FOLDED), but I was wrong.
>
> @@ -1440,13 +1440,15 @@ static inline int __pud_alloc(struct mm_struct
> *mm, pgd_t *pgd,
> ...
> #if defined(__PAGETABLE_PMD_FOLDED) || !defined(CONFIG_MMU)
> ...
> static inline void mm_nr_pmds_init(struct mm_struct *mm)
> {
>    atomic_long_set(&mm->nr_pmds, 0);
> }
> ...
> #else
> ...
> static inline void mm_nr_pmds_init(struct mm_struct *mm) {}
> ...
> #endif
>
> So, I drop my idea of reverting Kirill's commit.
>
> Pat, not sure how often you build linux-next.
> When doing a daily linux-next testing... Before bisecting I normally
> checked which version of linux-next was the last good and which one
> was the first bad.
> I cannot say which strategy is better.
> But you seem to have a reliable test with watching Netflix.
>
> Regards,
> - Sedat -
>
> [1] http://git.kernel.org/cgit/linux/kernel/git/mhocko/mm.git/tag/?id=mmotm-2015-02-03-16-38
> [2] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=e060ff1f1f00caab403bd208ffa78ed1b7ee0c4d

Yeah, I only recently found a patch that lets me boot xen on a recent 
-next kernel:

diff --git a/arch/x86/kernel/cpu/microcode/core.c 
b/arch/x86/kernel/cpu/microcode/core.c
index 15c2909..36a8361 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -552,7 +552,7 @@ static int __init microcode_init(void)
         int error;

         if (paravirt_enabled() || dis_ucode_ldr)
-               return 0;
+               return -EINVAL;

         if (c->x86_vendor == X86_VENDOR_INTEL)
                 microcode_ops = init_intel_microcode();

that I found on it's way to upstream.  The last 'known good' Xen setup 
for me was a 3.18.0 rc6 kernel.  I only use Xen to experiment with, so I 
don't boot every kernel with Xen enabled, only when I'm working on 
learning it.  So as far as a bisect window goes, that's a pretty large 
one.  I'll wait to see if anyone else chimes in before attempting the 
bisect(mostly because it's 3am here, and they'll all likely have a 
chance to see this chain of e-mails before I can get going on the bisect 
tomorrow).  I'll also check to see if I can trigger it on this kernel 
without booting in xen.

Thanks,
Pat Erley
