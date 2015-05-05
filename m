From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: Coresight tree to -next please
Date: Tue, 5 May 2015 08:22:20 -0600
Message-ID: <CANLsYkyjBEGJ=L52GWqUPeY5egsceK34phSdFcaoLUxZxxnXfA@mail.gmail.com>
References: <CANLsYky=XeD6ednBkgv4Qe3=a7RUa6bW9-9X2DKKCmUXUwKsyA@mail.gmail.com>
	<20150505104834.47f528ba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:33969 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S2993162AbbEEOWV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2015 10:22:21 -0400
Received: by obfe9 with SMTP id e9so139565556obf.1
        for <linux-next@vger.kernel.org>; Tue, 05 May 2015 07:22:20 -0700 (PDT)
In-Reply-To: <20150505104834.47f528ba@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On 4 May 2015 at 18:48, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Mathieu,
>
> On Mon, 4 May 2015 16:19:30 -0600 Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>>
>> I am the maintainer of the coresight sub-system [1] and I would like
>> to ask you to add my next tree [2] to the list of trees you are using
>> to build linux-next.
>>
>> [1]. drivers/hwtracing/coresight
>> [2]. https://git.linaro.org/kernel/coresight.git (next)
>
> I used git://git.linaro.org/kernel/coresight.git, and added it from
> today.

Perfect - did you use the "next" branch?

> Is this tree to be submitted directly to Linus, or via some
> other tree? (just gives me a clue as to where to positiion it in the
> merge list)

I take patches in my next tree and about twice per cycle will send a
tally to GKH for inclusion in his char-misc-next branch.  As such when
he takes my patches there should be some duplication between the
coresight next branch and his char-misc-next.  Do you see this as a
problem?

>
> Thanks for adding your subsystem tree as a participant of linux-next.
> As you may know, this is not a judgment of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window.
>
> You will need to ensure that the patches/commits in your tree/series
> have been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and
>      * destined for the current or next Linux merge window.
>
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
>
> --
> Cheers,
> Stephen Rothwell
> sfr@canb.auug.org.au
