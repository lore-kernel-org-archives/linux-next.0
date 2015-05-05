From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: Coresight tree to -next please
Date: Tue, 5 May 2015 08:33:28 -0600
Message-ID: <CANLsYkxxt2vEMVJE9WH+ZoHVV+6OUW4qLsMsi8QeX_Nn+vtPng@mail.gmail.com>
References: <CANLsYky=XeD6ednBkgv4Qe3=a7RUa6bW9-9X2DKKCmUXUwKsyA@mail.gmail.com>
	<20150505104834.47f528ba@canb.auug.org.au>
	<CANLsYkyjBEGJ=L52GWqUPeY5egsceK34phSdFcaoLUxZxxnXfA@mail.gmail.com>
	<20150506002703.3fa4618f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35072 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S2993189AbbEEOd3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2015 10:33:29 -0400
Received: by oign205 with SMTP id n205so148831651oig.2
        for <linux-next@vger.kernel.org>; Tue, 05 May 2015 07:33:28 -0700 (PDT)
In-Reply-To: <20150506002703.3fa4618f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On 5 May 2015 at 08:27, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Mathieu,
>
> On Tue, 5 May 2015 08:22:20 -0600 Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>>
>> On 4 May 2015 at 18:48, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > I used git://git.linaro.org/kernel/coresight.git, and added it from
>> > today.
>>
>> Perfect - did you use the "next" branch?
>
> Yes.
>
>> > Is this tree to be submitted directly to Linus, or via some
>> > other tree? (just gives me a clue as to where to positiion it in the
>> > merge list)
>>
>> I take patches in my next tree and about twice per cycle will send a
>> tally to GKH for inclusion in his char-misc-next branch.  As such when
>> he takes my patches there should be some duplication between the
>> coresight next branch and his char-misc-next.  Do you see this as a
>> problem?
>
> It can cause conflicts if you send patches to Greg and keep them in
> your tree (if there are further changes to the same files in either
> tree).

Right, but I _never_ change patches once they've been published.

> Much better would be to ask him to pull your tree (or a subset)
> that way you have the same commits (as opposed to patches) in both
> trees.

I see your point.

Thanks for your time,
Mathieu

>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
