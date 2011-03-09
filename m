From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for March 8 (BROKEN: arch/x86/kernel/entry_32.S?
 Debian's binutils/as?)
Date: Wed, 9 Mar 2011 11:16:30 +0100
Message-ID: <AANLkTinLAZubVih-y6=EsGnd0yLmFDUcG10u-EbozUS0@mail.gmail.com>
References: <AANLkTin2H9=NWp5G6N6_e=bxBTh2eS1dbUxOjT6xX98C@mail.gmail.com>
	<AANLkTik_Cb7tXheZNOBjqnoQc4MSL1LnDtFGFP5mqZRi@mail.gmail.com>
	<AANLkTinBv__n7k3Z=EJWv1fdQScyB7AJV0SsYJE0mCwQ@mail.gmail.com>
	<AANLkTiknsT1iQzUQ_oBiOORaqWBFyk2BaLq_xu9C5E_G@mail.gmail.com>
	<1299605269.29313.1427511237@webmail.messagingengine.com>
	<AANLkTi=6YstJxad41knR4Q9WN3wYKikPv-g1i3kg3HS1@mail.gmail.com>
	<1299615939.25628.1427572905@webmail.messagingengine.com>
	<AANLkTimBMP1jiuEEUwmKKVNZcZnrkFxFA_YBcLmkEFJM@mail.gmail.com>
	<AANLkTikpMAXfG5aNWo8x7pKKppaQiE-U8qjFaG0B2azV@mail.gmail.com>
	<20110309085150.GC21294@elte.hu>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:45261 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751834Ab1CIKQc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2011 05:16:32 -0500
In-Reply-To: <20110309085150.GC21294@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, Alexander van Heukelum <heukelum@fastmail.fm>, linux-next <linux-next@vger.kernel.org>, psomas@cslab.ece.ntua.gr, Jan Beulich <JBeulich@novell.com>, "H. Peter Anvin" <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On Wed, Mar 9, 2011 at 9:51 AM, Ingo Molnar <mingo@elte.hu> wrote:
>
> * H.J. Lu <hjl.tools@gmail.com> wrote:
>
>> On Tue, Mar 8, 2011 at 12:33 PM, Sedat Dilek <sedat.dilek@googlemail=
=2Ecom> wrote:
>> > On Tue, Mar 8, 2011 at 9:25 PM, Alexander van Heukelum
>> > <heukelum@fastmail.fm> wrote:
>> >> On Tue, 08 Mar 2011 18:53 +0100, "Sedat Dilek" <sedat.dilek@googl=
email.com> wrote:
>> >>> On Tue, Mar 8, 2011 at 6:27 PM, Alexander van Heukelum
>> >>> <heukelum@fastmail.fm> wrote:
>> >>> > On Tue, 08 Mar 2011 16:42 +0100, "Sedat Dilek" <sedat.dilek@go=
oglemail.com> wrote:
>> >>> >> On 3/8/11, Sedat Dilek <sedat.dilek@googlemail.com> wrote:
>> >>> >> > On 3/8/11, H.J. Lu <hjl.tools@gmail.com> wrote:
>> >>> >> >> On Tue, Mar 8, 2011 at 2:44 AM, Sedat Dilek <sedat.dilek@g=
ooglemail.com>
>> >>> >> >> wrote:
>> >>> >> >>> Hi,
>> >>> >> >>>
>> >>> >> >>> my build of linux-next (next-20110308, the same with the =
one from
>> >>> >> >>> yesterday) is broken.
>> >>> >> >>> (I translated the German output.)
>> >>> >> >>>
>> >>> >> >>> [ build.log ]
>> >>> >> >>> =C2=A0AS =C2=A0 =C2=A0 =C2=A0arch/x86/kernel/entry_32.o
>> >>> >> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/sour=
ce_i386_none/arch/x86/kernel/entry_32.S:
>> >>> >> >>> Assembler messages:
>> >>> >> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/sour=
ce_i386_none/arch/x86/kernel/entry_32.S:1421:
>> >>> >> >>> Error: .size expression does not evaluate to a constant
>> >>> >> >>> make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1 (Error=
 1)
>> >>> >> >>> make[5]: *** [arch/x86/kernel] Fehler 2 (Error 2)
>> >>> >> >>> make[4]: *** [arch/x86] Fehler 2 (Error 2)
>> >>> >> >>> make[4]: *** Warte auf noch nicht beendete Prozesse... (W=
aiting for
>> >>> >> >>> unfinished jobs...)
>> >>> >> >>>
>> >>> >> >>
>> >>> >> >> This is a kernel bug. =C2=A0Please use the latest binutils=
 from CVS.
>> >>> >> >> It will tell you which symbol causes this.
>> >>> >> >>
>> >>> >> >>
>> >>> >> >> --
>> >>> >> >> H.J.
>> >>> >> >>
>> >>> >> >
>> >>> >> > Yeah, I have cherry-picked these two upstream commits befor=
e you have
>> >>> >> > mentionned it...
>> >>> >> >
>> >>> >> > 0001-Mention-symbol-name-in-non-constant-.size-expression.p=
atch
>> >>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0(Cherry-picked from commit b9521=
fc0be7945fc842ce1197e241a023378125d)
>> >>> >> > 0002-Revert-the-last-change-on-gas-elf-bad-size.err.patch
>> >>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0(Cherry-picked from commit cbd14=
1bb69f791de7ea1581abe7afb34f0c61288)
>> >>> >> >
>> >>> >> > ... and have built with them a new binutils Debian package.
>> >>> >> >
>> >>> >> > The error looks now like this (sorry for the German output)=
:
>> >>> >> > ...
>> >>> >> > =C2=A0 AS =C2=A0 =C2=A0 =C2=A0arch/x86/kernel/entry_32.o
>> >>> >> > /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source=
_i386_none/arch/x86/kernel/entry_32.S:
>> >>> >> > Assembler messages:
>> >>> >> > /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source=
_i386_none/arch/x86/kernel/entry_32.S:1421:
>> >>> >> > Error: .size expression with symbol `apf_page_fault' does n=
ot evaluate
>> >>> >> > to a constant
>> >>> >> > make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1
>> >>> >> > make[5]: *** [arch/x86/kernel] Fehler 2
>> >>> >> > make[5]: *** Warte auf noch nicht beendete Prozesse...
>> >>> >> >
>> >>> >> > Anyway, before more riddling around it would be very helpfu=
l to have a
>> >>> >> > clear pointer if there is a fix around... That building, te=
sting and
>> >>> >> > installing took me now several hours.
>> >>> >> > And... yeah, backports to 2.21-branch appreciated.
>> >>> >> >
>> >>> >> > - Sedat -
>> >>> >> >
>> >>> >>
>> >>> >> After a quick look into the source, it seems attached patch f=
ixes the
>> >>> >> issue.
>> >>> >> Is that OK?
>> >>> >
>> >>> > Hi Sedat,
>> >>> >
>> >>> > The patch ( https://lkml.org/lkml/2011/3/8/203 ) is ok, feel f=
ree to add
>> >>> > Acked-by: Alexander van Heukelum <heukelum@fastmail.fm>
>> >>> >
>> >>> > Better description might be something like:
>> >>> >
>> >>> > i386: Fix mismatched ENTRY/END pair.
>> >>> >
>> >>> > Under CONFIG_KVM_GUEST=3Dy, the following part of entry_32.S c=
auses a compile failure.
>> >>> >
>> >>> > 1409 #ifdef CONFIG_KVM_GUEST
>> >>> > 1410 ENTRY(async_page_fault)
>> >>> > 1411 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RING0_EC_FRAME
>> >>> > 1412 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pushl $do_async_page_fault
>> >>> > 1413 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFI_ADJUST_CFA_OFFSET 4
>> >>> > 1414 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp error_code
>> >>> > 1415 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFI_ENDPROC
>> >>> > 1416 END(apf_page_fault)
>> >>> > 1417 #endif
>> >>> >
>> >>> > Replace apf_page_fault with async_page_fault, as intended.
>> >>> >
>> >>> > Greetings,
>> >>> > =C2=A0 =C2=A0Alexander
>> >>> >
>> >>> >> - Sedat -
>> >>> >>
>> >>> >> Email had 1 attachment:
>> >>> >> + 0001-x86-Fix-build-failure-with-binutils-as-from-upstream.p=
atch
>> >>> >> =C2=A0 1k (text/x-patch)
>> >>> >
>> >>>
>> >>> As I said, quick view on the code, quick fix :-).
>> >>>
>> >>> Your description is definitive more meaningful.
>> >>> I can refresh my patch and add your ACK.
>> >>>
>> >>> Anyway, I continued after dinner and with the above patch I ran =
into
>> >>> the next problem:
>> >>> [ build.log ]
>> >>> ...
>> >>> =C2=A0 AS =C2=A0 =C2=A0 =C2=A0arch/x86/kernel/acpi/wakeup_rm.o
>> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386=
_none/arch/x86/kernel/acpi/wakeup_rm.S:
>> >>> Assembler messages:
>> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386=
_none/arch/x86/kernel/acpi/wakeup_rm.S:12:
>> >>> Error: .size expression with symbol `wakeup_code_start' does not
>> >>> evaluate to a constant
>> >>
>> >> No idea what's wrong there. But my version of wakeup_rm.S has onl=
y 10 lines...
>> >>
>> >> =C2=A0 =C2=A0 1 =C2=A0/*
>> >> =C2=A0 =C2=A0 2 =C2=A0 * Wrapper script for the realmode binary a=
s a transport object
>> >> =C2=A0 =C2=A0 3 =C2=A0 * before copying to low memory.
>> >> =C2=A0 =C2=A0 4 =C2=A0 */
>> >> =C2=A0 =C2=A0 5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.section ".roda=
ta","a"
>> >> =C2=A0 =C2=A0 6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.globl =C2=A0wa=
keup_code_start, wakeup_code_end
>> >> =C2=A0 =C2=A0 7 =C2=A0wakeup_code_start:
>> >> =C2=A0 =C2=A0 8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.incbin "arch/x=
86/kernel/acpi/realmode/wakeup.bin"
>> >> =C2=A0 =C2=A0 9 =C2=A0wakeup_code_end:
>> >> =C2=A0 =C2=A010 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size =C2=A0 wa=
keup_code_start, .-wakeup_code_start
>> >>
>> >> And it compiles just fine.
>> >> The fix for entry_32.S is valid, though, and necessary for mainli=
ne.
>> >>
>> >> Greetings,
>> >> =C2=A0 =C2=A0Alexander
>> >>
>> >>> I am unsure how to fix that and open for feedback.
>> >>>
>> >>> - Sedat -
>> >>>
>> >>
>> >
>> > The file in linux-next (next-20110308) looks different (the above =
code
>> > looks more logical to me)
>> >
>> > [ arch/x86/kernel/acpi/wakeup_rm.S ]
>> >
>> > /*
>> > =C2=A0* Wrapper script for the realmode binary as a transport obje=
ct
>> > =C2=A0* before copying to low memory.
>> > =C2=A0*/
>> > #include <asm/page_types.h>
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0.section ".x86_trampoline","a"
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0.balign PAGE_SIZE
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0.globl =C2=A0acpi_wakeup_code
>> > acpi_wakeup_code:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0.incbin "arch/x86/kernel/acpi/realmode/=
wakeup.bin"
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0.size =C2=A0 wakeup_code_start, .-wakeu=
p_code_start
>> >
>>
>> Those are simply wrong. =C2=A02.6.38-rc8 is OK.
>
> 2.6.37-rc8 is not OK: for example commit 631bc4878220932fe67fc46fc7cf=
7cccdb1ec597 is
> already upstream and if you enable KVM you see a broken kernel build =
with new
> binutils. This is from 2.6.38-rc8:
>
> =C2=A0#ifdef CONFIG_KVM_GUEST
> =C2=A0ENTRY(async_page_fault)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0RING0_EC_FRAME
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pushl $do_async_page_fault
> =C2=A0 =C2=A0 =C2=A0 =C2=A0CFI_ADJUST_CFA_OFFSET 4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0jmp error_code
> =C2=A0 =C2=A0 =C2=A0 =C2=A0CFI_ENDPROC
> =C2=A0END(apf_page_fault)
> =C2=A0#endif
>
> Yes, the .size directive not matching up is technically a bug, but it=
 was not
> checked by binutils before, for *years* - and you cannot just flip a =
switch and
> break who knows how much code.
>
> You need to at least emit a warning for some time to give people a *c=
hance* to fix
> bugs - not just stuff an incompatible binutils down their throat and =
break the
> kernel build for thousands of commits and break bisection.
>
> This binutils change is breaking numerous upstream kernel builds (and=
 is making
> bisection with new binutils impossible) for no particular good reason=
: binutils was
> capable to figure out the symbol name before this change.
>
> At minimum you need to *understand* that what you are doing is an inc=
ompatible
> change and is disruptive to others ...
>
> Thanks,
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Ingo
>

OK, I am not a toolchain expert, but this recent changes to upstream
binutils were helpful to find at least the problematic place in the
code (fix see [1]).
I only needed a blink of an eye to catch it.
binutils 2.21 GIT has this change "PR gas/12519" which was not "perfect=
".
With the patch in upstream (see [2], which should be cherry-picked for
2.21-GIT as I did for my debianized binutils), there is more
"verbosity", now.
We have now an advantage as we know what's going on *before* final
binutils-2.21 release.

What are you expecting from binutils developers?
Shall they revert the above PR (yes, I also build a binutils with a
revert of it)?

The next place in code (I am on linux-next) could also be found easily
and with some help of x86 folks it could be fixed [2], too.

Can you please explain the "incompatibility" and "breakage" with older
kernels (especially for bisecting sounds awful)?
(I am just curious and the several builds of binutils and linux-next
kernels I did yesterday should not be for nothing :-).)

If I can help (like testing or whatever), please let me know.

- Sedat -

[1] https://patchwork.kernel.org/patch/619081/
[2] http://sourceware.org/ml/binutils/2011-03/msg00078.html
[3] https://patchwork.kernel.org/patch/619611/
