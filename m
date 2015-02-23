From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [GIT PULL] locking fixes
Date: Mon, 23 Feb 2015 09:35:34 +0100
Message-ID: <54EAE656.9000504@de.ibm.com>
References: <20150220133756.GA30528@gmail.com> <CA+55aFy5sxUO7Hfjq70cyjhQqOE_j6nKsJf7v0iSGg=srLPBcw@mail.gmail.com> <CA+55aFwT8TCfOh25FH-MP8FB2EBg-gexmU9Cn9beBAx+TQ1N4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp15.uk.ibm.com ([195.75.94.111]:43723 "EHLO
	e06smtp15.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751748AbbBWIfk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Feb 2015 03:35:40 -0500
Received: from /spool/local
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
	Mon, 23 Feb 2015 08:35:39 -0000
In-Reply-To: <CA+55aFwT8TCfOh25FH-MP8FB2EBg-gexmU9Cn9beBAx+TQ1N4Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-next <linux-next@vger.kernel.org>, KVM list <kvm@vger.kernel.org>

Am 21.02.2015 um 02:51 schrieb Linus Torvalds:
> So here's my try at fixing READ_ONCE() so that it is happy with 'cons=
t' sources.
>=20
> It is entirely untested. Comments/testing?
>=20
> Christian, I guess I could just have forced a cast instead of the
> union. I'd like you to take a look at this, because right now it's
> holding up me pulling from Ingo.

Sorry for the too late for rc1 answer, but I was traveling the last 4
days.

Hmm, some autocasting feels better, but I could not come up with a prop=
er
solution that works for all cases (e.g. I tried "__auto_type __val =3D =
x"
or "typeof(x * 0)" to make this lvalue and rvalue, but all variants fai=
led
in one or the other way).
Unless I can come up with a better solution your union patch is probabl=
y
the best way to go and rc1 seems to work.

>=20
> And Ingo, I think you need to add some kind of test for "horrible new
> warnings". I think your pull request *worked*, but the tens of lines
> of new warnings it generates is unacceptable, and will just cause me
> to undo the pull if I notice in time (like I did this time).

I was getting several complaints from the linux-next buildbots about ne=
w
sparse warnings, compile warning and so on when doing this rework, e.g.
commit c5b19946eb76c675 ("kernel: Fix sparse warning for ACCESS_ONCE")
fixes two of those warnings.
So I am somewhat surprised that I never saw this as I am also following=
 the
KVM list. turns out that arch/x86/kernel/kvm.c does not CC the kvm list
in get_maintainers.pl.

Maybe I should push something like that to Paolo/Marcelo.


--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5574,6 +5574,7 @@ S:	Supported
 F:	Documentation/*/kvm*.txt
 F:	Documentation/virtual/kvm/
 F:	arch/*/kvm/
+F:	arch/x86/kernel/kvm.c
 F:	arch/*/include/asm/kvm*
 F:	include/linux/kvm*
 F:	include/uapi/linux/kvm*

Christian




>=20
>                             Linus
>=20
> On Fri, Feb 20, 2015 at 4:03 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>> How does this work for you at all?
>>
>> On Fri, Feb 20, 2015 at 5:37 AM, Ingo Molnar <mingo@kernel.org> wrot=
e:
>>> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
>>> index 94f643484300..e354cc6446ab 100644
>>> --- a/arch/x86/kernel/kvm.c
>>> +++ b/arch/x86/kernel/kvm.c
>>> @@ -803,8 +808,8 @@ static void kvm_unlock_kick(struct arch_spinloc=
k *lock, __ticket_t ticket)
>>>         add_stats(RELEASED_SLOW, 1);
>>>         for_each_cpu(cpu, &waiting_cpus) {
>>>                 const struct kvm_lock_waiting *w =3D &per_cpu(klock=
_waiting, cpu);
>>> -               if (ACCESS_ONCE(w->lock) =3D=3D lock &&
>>> -                   ACCESS_ONCE(w->want) =3D=3D ticket) {
>>> +               if (READ_ONCE(w->lock) =3D=3D lock &&
>>> +                   READ_ONCE(w->want) =3D=3D ticket) {
>>>                         add_stats(RELEASED_SLOW_KICKED, 1);
>>>                         kvm_kick_cpu(cpu);
>>>                         break;
>>
>> I get horrible compile warnings from this, because of how 'w' is a
>> pointer to a 'const' structure, which then causes things like
>>
>>     include/linux/compiler.h:262:39: warning: passing argument 1 of
>> =91__read_once_size=92 discards =91const=92 qualifier from pointer t=
arget type
>>       ({ typeof(x) __val; __read_once_size(&x, &__val, sizeof(__val)=
); __val; })
>>
>> which is fairly hard to avoid (looks like it might need a union)
>>
>>                        Linus
