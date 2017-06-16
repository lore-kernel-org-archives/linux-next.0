From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 15 Jun 2017 17:35:43 -0700
Message-ID: <CAGXu5jKXNuZOqWB6pa+1L6x0k6qwXyFzba0nECCpvb07XcW+zg@mail.gmail.com>
References: <20170605170117.6a1fc15e@canb.auug.org.au> <20170615113548.3e4edcf4@canb.auug.org.au>
 <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
 <20170615121220.4331a37b0fb736ec9da4e423@linux-foundation.org>
 <CAGXu5jJJPZYnhcubfWrjj8XROAycEYsgK_AhBF-rQydeZyCwCg@mail.gmail.com> <1497571513.17727.2.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:37311 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751946AbdFPAfp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Jun 2017 20:35:45 -0400
Received: by mail-it0-f44.google.com with SMTP id m47so19534316iti.0
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2017 17:35:45 -0700 (PDT)
In-Reply-To: <1497571513.17727.2.camel@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Micay <danielmicay@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jun 15, 2017 at 5:05 PM, Daniel Micay <danielmicay@gmail.com> wrote:
> On Thu, 2017-06-15 at 16:46 -0700, Kees Cook wrote:
>> On Thu, Jun 15, 2017 at 12:12 PM, Andrew Morton
>> <akpm@linux-foundation.org> wrote:
>> > On Wed, 14 Jun 2017 18:56:30 -0700 Kees Cook <keescook@chromium.org>
>> > wrote:
>> >
>> > > > > Caused by commit
>> > > > >
>> > > > >   088a5ecf7581 ("include/linux/string.h: add the option of
>> > > > > fortified string.h functions")
>> > > > >
>> > > > > We really need to fix all the known problems it detects
>> > > > > *before*
>> > > > > merging this commit ...
>> > > > >
>> > > > > I have reverted it for today.
>> > > >
>> > > > I am still needing to revert this every day ...
>> > >
>> > > I sent a series for -mm (or maintainers) to merge that should
>> > > catch
>> > > everything. Do you want me to carry it in my kspp tree instead?
>> > > (My
>> > > original intention was to carry all the fixes and the fortify
>> > > patch in
>> > > kspp but akpm took it into -mm somewhat unexpectedly, not that I'm
>> > > complaining.)
>> >
>> > This is all getting a bit foggy in my mind.  Can we please have a
>> > full
>> > resend of everything?  Sufficient to hopefully produce a tree which
>> > has
>> > no build-time or run-time regressions?  Including the buildbot's
>> > recently-reported alpha and xtensa issues?
>>
>> It's been sent a few times (and a few fixes have been collected in
>> other trees already). What I've got in my for-next/kspp tree right now
>> is all the fixes that haven't already been picked up by other tree
>> maintainers, and I added the fortify patch itself to the end of the
>> tree too now since sfr asked for that a few hours ago.
>>
>> Merged with latest -next, this passes x86_64, i386, arm64, and powerpc
>> allmodconfig builds for me. It doesn't pass arm, though. Perhaps we
>> need to add an ARCH_HAS_FORTIFY_SOURCE to gate the all*config builds?
>>
>> Should we let the dust settle first? I'm happy to do whatever makes
>> the most sense, I'm just following what (I understand) sfr suggested
>> most recently. :)
>>
>> -Kees
>>
>
> If it needs to build and boot on every architecture, I think we should
> gate it on i386, x86_64, arm64 or powerpc where it has been tested.
>
> I think I know what has to be fixed for alpha and xtensa but there might
> be more problems. It's better to wait for someone willing / able to do
> it properly by building it themselves and doing basic runtime testing.

Sounds good. I've added ARCH_HAS_FORTIFY_SOURCE to the patch (and noted it).

-Kees

-- 
Kees Cook
Pixel Security
