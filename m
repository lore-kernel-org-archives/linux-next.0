From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 19 Jun 2017 13:28:48 -0700
Message-ID: <CAGXu5j+b1JwD50A__DFO7FMf871fY=1d9HpDntAt7gfOasp3sA@mail.gmail.com>
References: <20170605170117.6a1fc15e@canb.auug.org.au> <20170615113548.3e4edcf4@canb.auug.org.au>
 <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
 <20170615121220.4331a37b0fb736ec9da4e423@linux-foundation.org>
 <CAGXu5jJJPZYnhcubfWrjj8XROAycEYsgK_AhBF-rQydeZyCwCg@mail.gmail.com> <20170616101743.f2e5c255612b2e3e7ee596e2@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:36261 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751868AbdFSU2t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jun 2017 16:28:49 -0400
Received: by mail-it0-f51.google.com with SMTP id m47so2465157iti.1
        for <linux-next@vger.kernel.org>; Mon, 19 Jun 2017 13:28:49 -0700 (PDT)
In-Reply-To: <20170616101743.f2e5c255612b2e3e7ee596e2@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Micay <danielmicay@gmail.com>

On Fri, Jun 16, 2017 at 10:17 AM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Thu, 15 Jun 2017 16:46:33 -0700 Kees Cook <keescook@chromium.org> wrote:
>
>> On Thu, Jun 15, 2017 at 12:12 PM, Andrew Morton
>> <akpm@linux-foundation.org> wrote:
>> > On Wed, 14 Jun 2017 18:56:30 -0700 Kees Cook <keescook@chromium.org> wrote:
>> >
>> >> >> Caused by commit
>> >> >>
>> >> >>   088a5ecf7581 ("include/linux/string.h: add the option of fortified string.h functions")
>> >> >>
>> >> >> We really need to fix all the known problems it detects *before*
>> >> >> merging this commit ...
>> >> >>
>> >> >> I have reverted it for today.
>> >> >
>> >> > I am still needing to revert this every day ...
>> >>
>> >> I sent a series for -mm (or maintainers) to merge that should catch
>> >> everything. Do you want me to carry it in my kspp tree instead? (My
>> >> original intention was to carry all the fixes and the fortify patch in
>> >> kspp but akpm took it into -mm somewhat unexpectedly, not that I'm
>> >> complaining.)
>> >
>> > This is all getting a bit foggy in my mind.  Can we please have a full
>> > resend of everything?  Sufficient to hopefully produce a tree which has
>> > no build-time or run-time regressions?  Including the buildbot's
>> > recently-reported alpha and xtensa issues?
>>
>> It's been sent a few times (and a few fixes have been collected in
>> other trees already). What I've got in my for-next/kspp tree right now
>> is all the fixes that haven't already been picked up by other tree
>> maintainers, and I added the fortify patch itself to the end of the
>> tree too now since sfr asked for that a few hours ago.
>
> I think it's best to try to keep everything in a single tree, with
> maintainer acks where possible.
>
> I do this stuff all the time - please just send everything at me when
> we think we have all the fixes and I'll sort it out.

I'll send you the series now and remove it from my kspp tree.

-Kees

-- 
Kees Cook
Pixel Security
