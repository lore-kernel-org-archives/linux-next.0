From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: ia64 dies in slab code on next-20120906
Date: Sun, 9 Sep 2012 08:44:39 +0200
Message-ID: <CA+icZUWzpTKp8aOTifUxUj=M8zMWj5-or+Vqmb3KdnmcEAgp+Q@mail.gmail.com>
References: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com>
	<20120907112606.7d09e84c4782b748a95e1946@canb.auug.org.au>
	<00000139a722a761-bafedf19-81a0-4922-a522-a2bb0fbb951a-000000@email.amazonses.com>
	<CA+icZUVuC+70S_zDRpNyBNvr+83Nb3J6qyGWteTDxrkvG=BAsw@mail.gmail.com>
	<00000139a7febf60-4e052ab7-7e4c-442f-8c85-c13cfd189d7e-000000@email.amazonses.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:34666 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751139Ab2IIGol (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 9 Sep 2012 02:44:41 -0400
Received: by lagy9 with SMTP id y9so510930lag.19
        for <linux-next@vger.kernel.org>; Sat, 08 Sep 2012 23:44:39 -0700 (PDT)
In-Reply-To: <00000139a7febf60-4e052ab7-7e4c-442f-8c85-c13cfd189d7e-000000@email.amazonses.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Tony Luck <tony.luck@intel.com>, linux-next@vger.kernel.org, Pekka Enberg <penberg@kernel.org>

On Sun, Sep 9, 2012 at 12:27 AM, Christoph Lameter <cl@linux.com> wrote:
> On Sat, 8 Sep 2012, Sedat Dilek wrote:
>
>> I have reported the breakage of Linux-Next (next-20120906)
>> independently on AMD64 [1], but seem to be ignored in this thread.
>
> Not on AMD64, so I did not see anything until Tony's post.
>
>> Dis you test SLAB-only?
>> Can you please test next time also with a SLUB config?
>
> Tested all 3 allocators here before the release and I did not notice
> anything wrong. AFAICT multiple other testers also saw no problem.
>
>> The next day you removed "slab/common-for-cgroups" from slab/next, why?
>
> I do not handle that tree.
>
>> You knew that it was broken (before Tony reported IA64 boot problems)?
>> On linux-mm/linux-next/LKML MLs I have not read any hints/reports
>> before the one of Tony.
>
> Tony's report was the first report that I got on this issue. There were 2
> others issues for which I also submitted patches this week.
>
>> Can you please inform people in time?
>
> I usually post too early rather than too late. There was no delay on this
> one either. Emails reflected my real time knowledge and fixes available.
>
>> I know linux-next is highly experimental, but I use all my
>> daily-builds on my system here.
>> Not virtual machine - on real bare metal!
>
> That is quite good. Thanks for your efforts.
>
>> Feel free to add as it fixes the reported issue:
>>
>>      Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
>>      Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
>
> Thanks for testing. My daughter has been in the ICU since Thursday and I
> had to guess that this was the right solution based on what I was able
> to glean on from experiences of others with the issue. Never was able to
> truly test the fix or even do a kernel build while the crisis was going
> on here. She just was moved out of the ICU an hour ago so I will be
> able to do more next week.

OK, I had to look up what ICU means... Intensive Care Unit.
Forget everything what I wrote... Health comes first.
My father is a case for nursing care... As we as a family insists on
home care, the ~22.5hrs of a day the "male nurse" is me.

- Sedat -
