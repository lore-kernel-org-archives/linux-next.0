From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for May 7 (openrisc, sparc qemu BUG due to
 'hrtimer: Get rid of hrtimer softirq')
Date: Fri, 8 May 2015 08:36:42 +0200
Message-ID: <CAMuHMdUJ6D9W3=BGq=mw0PQwcF8sHbec1iVKr2XhwQp3h=7nQQ@mail.gmail.com>
References: <20150507164715.4eec2e84@canb.auug.org.au>
	<20150508015422.GB26772@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:36099 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751238AbbEHGgn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2015 02:36:43 -0400
In-Reply-To: <20150508015422.GB26772@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Bonn <jonas@southpole.se>, linux <linux@lists.openrisc.net>, Thomas Gleixner <tglx@linutronix.de>, "David S. Miller" <davem@davemloft.net>

On Fri, May 8, 2015 at 3:54 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Thu, May 07, 2015 at 04:47:15PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20150506:
>>
>> The ext4 tree gained a build failure so I used the version from
>> next-20150506.
>>
>> The vfs tree gained a conflict against the f2fs tree.
>>
>> The rcu tree gained conflicts against the tip tree.
>>
>> Non-merge commits (relative to Linus' tree): 2460
>>  2454 files changed, 114321 insertions(+), 47105 deletions(-)
>>
>> ----------------------------------------------------------------------------
>>
> Seen when running openrisc target in qemu:
>
> Switched to clocksource openrisc_timer
> BUG: failure at kernel/irq_work.c:135/irq_work_run_list()!
> Kernel panic - not syncing: BUG!
> ---[ end Kernel panic - not syncing: BUG!
>
>
> A similar crash with the same BUG is seen with sparc smp qemu tests.
>
> kernel BUG at kernel/irq_work.c:135!

https://lkml.org/lkml/2015/5/7/433

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
