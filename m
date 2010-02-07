From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] sched: Fix unused variable warning on UP (was: Re:
	linux-next: tip tree build warning)
Date: Sun, 7 Feb 2010 21:31:56 +0100
Message-ID: <10f740e81002071231j6977c6c7ie3f9e82bd0170f21@mail.gmail.com>
References: <10f740e81002071157p11b78784i8091d4790c29f30d@mail.gmail.com>
	 <1265572738.12224.278.camel@laptop>
	 <10f740e81002071226g3290d276q4c9df0e79a1e7ac0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:36711 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932394Ab0BGUcB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 7 Feb 2010 15:32:01 -0500
In-Reply-To: <10f740e81002071226g3290d276q4c9df0e79a1e7ac0@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Sun, Feb 7, 2010 at 21:26, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> On Sun, Feb 7, 2010 at 20:58, Peter Zijlstra <peterz@infradead.org> w=
rote:
>> On Sun, 2010-02-07 at 20:57 +0100, Geert Uytterhoeven wrote:
>>> On Mon, Feb 1, 2010 at 08:12, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
>>> > Today's linux-next build (powerpc allnoconfig) produced this warn=
ing:
>>> >
>>> > kernel/sched.c: In function 'wake_up_new_task':
>>> > kernel/sched.c:2631: warning: unused variable 'cpu'
>>> >
>>> > Introduced by commit fabf318e5e4bda0aca2b0d617b191884fda62703 ("s=
ched:
>>> > Fix fork vs hotplug vs cpuset namespaces").
>>>
>>> And now we have it in 2.6.33-rc7, too...
>>> Patch below (FWIW, compile-tested on m68k with CONFIG_SMP=3Dn only)=
=2E
>>>
>>> ---
>>> From cbf4f334632ade9c5ed9b88728ec82af074e4ace Mon Sep 17 00:00:00 2=
001
>>> From: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Date: Sun, 7 Feb 2010 20:47:30 +0100
>>> Subject: [PATCH] sched: Fix unused variable warning on UP
>>>
>>> Fix warning
>>>
>>> | kernel/sched.c:2650: warning: unused variable 'cpu'
>>>
>>> if CONFIG_SMP is not set.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> ---
>>> =C2=A0kernel/sched.c | =C2=A0 =C2=A03 ++-
>>> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/kernel/sched.c b/kernel/sched.c
>>> index 3a8fb30..c47561e 100644
>>> --- a/kernel/sched.c
>>> +++ b/kernel/sched.c
>>> @@ -2647,9 +2647,10 @@ void wake_up_new_task(struct task_struct *p,
>>> unsigned long clone_flags)
>>> =C2=A0{
>>> =C2=A0 =C2=A0 =C2=A0 unsigned long flags;
>>> =C2=A0 =C2=A0 =C2=A0 struct rq *rq;
>>> - =C2=A0 =C2=A0 int cpu =3D get_cpu();
>>>
>>> =C2=A0#ifdef CONFIG_SMP
>>> + =C2=A0 =C2=A0 int cpu =3D get_cpu();
>>> +
>>> =C2=A0 =C2=A0 =C2=A0 /*
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fork balancing, do it here and not ear=
lier because:
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0- cpus_allowed can change in the=
 fork path
>>
>> Which introduces a preempt imbalance... I like akpm's fix much bette=
r.
>
> Bummer, you're right. Sorry, that teaches me not to write patches
> after 2 days of FOSDEM ;-)

<trying to completely destroy my credibility>
Shouldn't put_cpu() take a (possibly dummy) `cpu' parameter, as
returned by get_cpu()?
</trying>

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
