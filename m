From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: tip tree build warning
Date: Sun, 13 Sep 2009 22:20:54 +0200
Message-ID: <10f740e80909131320j1b4f6552qf809fbf5049375d3@mail.gmail.com>
References: <20090911185600.9641f38b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f189.google.com ([209.85.216.189]:54931 "EHLO
	mail-px0-f189.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805AbZIMUUu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 13 Sep 2009 16:20:50 -0400
In-Reply-To: <20090911185600.9641f38b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 11, 2009 at 10:56, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> Hi all,
>
> Today's linux-next build (powerpc allnoconfig) produced this warning:
>
> kernel/sched.c:122: warning: 'double_rq_lock' declared 'static' but n=
ever defined
>
> Introduced by commit 18a3885fc1ffa92c2212ff0afdf033403d5b0fa0 ("sched=
:
> Remove reciprocal for cpu_power"). =C2=A0This is a build with CONFIG_=
SMP
> undefined.

Yep. same here.

It's even more fishy:
  - double_rq_lock() is useded inside #ifdef CONFIG_PREEMPT
  - double_rq_lock() is defined inside #ifdef CONFIG_SMP
  - double_rq_lock() is used inside #ifdef CONFIG_HOTPLUG_CPU

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
