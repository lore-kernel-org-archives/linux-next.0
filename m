From: John Stultz <john.stultz@linaro.org>
Subject: Re: linux-next: manual merge of the tiny tree with the tip tree
Date: Mon, 24 Nov 2014 22:30:10 -0800
Message-ID: <CALAqxLUKM7VyB6MW=-Mm+NA2pOEtD1CP3FxrmA_1gCucGon4hA@mail.gmail.com>
References: <20141125170315.13157c60@canb.auug.org.au>
	<20141125061645.GA15512@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:46913 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750841AbaKYGaM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2014 01:30:12 -0500
Received: by mail-qg0-f43.google.com with SMTP id q108so7854544qgd.2
        for <linux-next@vger.kernel.org>; Mon, 24 Nov 2014 22:30:11 -0800 (PST)
In-Reply-To: <20141125061645.GA15512@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next <linux-next@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Catalina Mocanu <catalina.mocanu@gmail.com>

On Mon, Nov 24, 2014 at 10:16 PM, Ingo Molnar <mingo@kernel.org> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> Hi Josh,
>>
>> Today's linux-next merge of the tiny tree got a conflict in
>> kernel/time/Makefile between commit fd866e2b116b ("time: Rename
>> udelay_test.c to test_udelay.c") from the tip tree and commit
>> d1f6d68d03ea ("kernel: time: Compile out NTP support") from the tiny
>> tree.
>
> So I think a timer subsystem commit d1f6d68d03ea with this
> magnitude of linecount increase:
>
>  Signed-off-by: Catalina Mocanu <catalina.mocanu@gmail.com>
>  [josh: Handle CONFIG_COMPAT=y.]
>  Reviewed-by: Josh Triplett <josh@joshtriplett.org>
>  Signed-off-by: Josh Triplett <josh@joshtriplett.org>
>  ---
>   drivers/pps/Kconfig        |  2 +-
>   include/linux/timex.h      | 15 +++++++++++++--
>   init/Kconfig               | 10 ++++++++++
>   kernel/compat.c            |  8 ++++++--
>   kernel/sys_ni.c            |  4 ++++
>   kernel/time/Makefile       |  3 ++-
>   kernel/time/ntp_internal.h | 28 ++++++++++++++++++++++++++++
>   kernel/time/posix-timers.c |  2 ++
>   kernel/time/time.c         |  2 ++
>   kernel/time/timekeeping.c  |  2 ++
>   10 files changed, 70 insertions(+), 6 deletions(-)
>
> at minimum needs the ack of timer folks, before it can be
> committed to Git. Or is the tiny tree plan to submit all
> patches to the appropriate subsystem or gather acks, before
> sending it upstream?

Yea.  From first glance d1f6d68d03ea looks fairly broken.

Returning 0 for ntp_tick_length() (which should be the current tick
length in NTP_SCALE_SHIFT shifted ns), seems like it would cause major
timekeeping problems.

thanks
-john
