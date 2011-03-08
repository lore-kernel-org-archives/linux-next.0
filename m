From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for March 8 (BROKEN: arch/x86/kernel/entry_32.S?
 Debian's binutils/as?)
Date: Tue, 8 Mar 2011 21:33:48 +0100
Message-ID: <AANLkTimBMP1jiuEEUwmKKVNZcZnrkFxFA_YBcLmkEFJM@mail.gmail.com>
References: <AANLkTin2H9=NWp5G6N6_e=bxBTh2eS1dbUxOjT6xX98C@mail.gmail.com>
	<AANLkTik_Cb7tXheZNOBjqnoQc4MSL1LnDtFGFP5mqZRi@mail.gmail.com>
	<AANLkTinBv__n7k3Z=EJWv1fdQScyB7AJV0SsYJE0mCwQ@mail.gmail.com>
	<AANLkTiknsT1iQzUQ_oBiOORaqWBFyk2BaLq_xu9C5E_G@mail.gmail.com>
	<1299605269.29313.1427511237@webmail.messagingengine.com>
	<AANLkTi=6YstJxad41knR4Q9WN3wYKikPv-g1i3kg3HS1@mail.gmail.com>
	<1299615939.25628.1427572905@webmail.messagingengine.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:51057 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755597Ab1CHUdu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Mar 2011 15:33:50 -0500
Received: by qyk7 with SMTP id 7so3229074qyk.19
        for <linux-next@vger.kernel.org>; Tue, 08 Mar 2011 12:33:49 -0800 (PST)
In-Reply-To: <1299615939.25628.1427572905@webmail.messagingengine.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander van Heukelum <heukelum@fastmail.fm>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next <linux-next@vger.kernel.org>, psomas@cslab.ece.ntua.gr, Jan Beulich <JBeulich@novell.com>, "H. Peter Anvin" <hpa@zytor.com>, "H.J. Lu" <hjl.tools@gmail.com>

On Tue, Mar 8, 2011 at 9:25 PM, Alexander van Heukelum
<heukelum@fastmail.fm> wrote:
> On Tue, 08 Mar 2011 18:53 +0100, "Sedat Dilek" <sedat.dilek@googlemai=
l.com> wrote:
>> On Tue, Mar 8, 2011 at 6:27 PM, Alexander van Heukelum
>> <heukelum@fastmail.fm> wrote:
>> > On Tue, 08 Mar 2011 16:42 +0100, "Sedat Dilek" <sedat.dilek@google=
mail.com> wrote:
>> >> On 3/8/11, Sedat Dilek <sedat.dilek@googlemail.com> wrote:
>> >> > On 3/8/11, H.J. Lu <hjl.tools@gmail.com> wrote:
>> >> >> On Tue, Mar 8, 2011 at 2:44 AM, Sedat Dilek <sedat.dilek@googl=
email.com>
>> >> >> wrote:
>> >> >>> Hi,
>> >> >>>
>> >> >>> my build of linux-next (next-20110308, the same with the one =
from
>> >> >>> yesterday) is broken.
>> >> >>> (I translated the German output.)
>> >> >>>
>> >> >>> [ build.log ]
>> >> >>> =C2=A0AS =C2=A0 =C2=A0 =C2=A0arch/x86/kernel/entry_32.o
>> >> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i=
386_none/arch/x86/kernel/entry_32.S:
>> >> >>> Assembler messages:
>> >> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i=
386_none/arch/x86/kernel/entry_32.S:1421:
>> >> >>> Error: .size expression does not evaluate to a constant
>> >> >>> make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1 (Error 1)
>> >> >>> make[5]: *** [arch/x86/kernel] Fehler 2 (Error 2)
>> >> >>> make[4]: *** [arch/x86] Fehler 2 (Error 2)
>> >> >>> make[4]: *** Warte auf noch nicht beendete Prozesse... (Waiti=
ng for
>> >> >>> unfinished jobs...)
>> >> >>>
>> >> >>
>> >> >> This is a kernel bug. =C2=A0Please use the latest binutils fro=
m CVS.
>> >> >> It will tell you which symbol causes this.
>> >> >>
>> >> >>
>> >> >> --
>> >> >> H.J.
>> >> >>
>> >> >
>> >> > Yeah, I have cherry-picked these two upstream commits before yo=
u have
>> >> > mentionned it...
>> >> >
>> >> > 0001-Mention-symbol-name-in-non-constant-.size-expression.patch
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0(Cherry-picked from commit b9521fc0b=
e7945fc842ce1197e241a023378125d)
>> >> > 0002-Revert-the-last-change-on-gas-elf-bad-size.err.patch
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0(Cherry-picked from commit cbd141bb6=
9f791de7ea1581abe7afb34f0c61288)
>> >> >
>> >> > ... and have built with them a new binutils Debian package.
>> >> >
>> >> > The error looks now like this (sorry for the German output):
>> >> > ...
>> >> > =C2=A0 AS =C2=A0 =C2=A0 =C2=A0arch/x86/kernel/entry_32.o
>> >> > /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i38=
6_none/arch/x86/kernel/entry_32.S:
>> >> > Assembler messages:
>> >> > /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i38=
6_none/arch/x86/kernel/entry_32.S:1421:
>> >> > Error: .size expression with symbol `apf_page_fault' does not e=
valuate
>> >> > to a constant
>> >> > make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1
>> >> > make[5]: *** [arch/x86/kernel] Fehler 2
>> >> > make[5]: *** Warte auf noch nicht beendete Prozesse...
>> >> >
>> >> > Anyway, before more riddling around it would be very helpful to=
 have a
>> >> > clear pointer if there is a fix around... That building, testin=
g and
>> >> > installing took me now several hours.
>> >> > And... yeah, backports to 2.21-branch appreciated.
>> >> >
>> >> > - Sedat -
>> >> >
>> >>
>> >> After a quick look into the source, it seems attached patch fixes=
 the
>> >> issue.
>> >> Is that OK?
>> >
>> > Hi Sedat,
>> >
>> > The patch ( https://lkml.org/lkml/2011/3/8/203 ) is ok, feel free =
to add
>> > Acked-by: Alexander van Heukelum <heukelum@fastmail.fm>
>> >
>> > Better description might be something like:
>> >
>> > i386: Fix mismatched ENTRY/END pair.
>> >
>> > Under CONFIG_KVM_GUEST=3Dy, the following part of entry_32.S cause=
s a compile failure.
>> >
>> > 1409 #ifdef CONFIG_KVM_GUEST
>> > 1410 ENTRY(async_page_fault)
>> > 1411 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RING0_EC_FRAME
>> > 1412 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pushl $do_async_page_fault
>> > 1413 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFI_ADJUST_CFA_OFFSET 4
>> > 1414 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp error_code
>> > 1415 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFI_ENDPROC
>> > 1416 END(apf_page_fault)
>> > 1417 #endif
>> >
>> > Replace apf_page_fault with async_page_fault, as intended.
>> >
>> > Greetings,
>> > =C2=A0 =C2=A0Alexander
>> >
>> >> - Sedat -
>> >>
>> >> Email had 1 attachment:
>> >> + 0001-x86-Fix-build-failure-with-binutils-as-from-upstream.patch
>> >> =C2=A0 1k (text/x-patch)
>> >
>>
>> As I said, quick view on the code, quick fix :-).
>>
>> Your description is definitive more meaningful.
>> I can refresh my patch and add your ACK.
>>
>> Anyway, I continued after dinner and with the above patch I ran into
>> the next problem:
>> [ build.log ]
>> ...
>> =C2=A0 AS =C2=A0 =C2=A0 =C2=A0arch/x86/kernel/acpi/wakeup_rm.o
>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_non=
e/arch/x86/kernel/acpi/wakeup_rm.S:
>> Assembler messages:
>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_non=
e/arch/x86/kernel/acpi/wakeup_rm.S:12:
>> Error: .size expression with symbol `wakeup_code_start' does not
>> evaluate to a constant
>
> No idea what's wrong there. But my version of wakeup_rm.S has only 10=
 lines...
>
> =C2=A0 =C2=A0 1 =C2=A0/*
> =C2=A0 =C2=A0 2 =C2=A0 * Wrapper script for the realmode binary as a =
transport object
> =C2=A0 =C2=A0 3 =C2=A0 * before copying to low memory.
> =C2=A0 =C2=A0 4 =C2=A0 */
> =C2=A0 =C2=A0 5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.section ".rodata",=
"a"
> =C2=A0 =C2=A0 6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.globl =C2=A0wakeup=
_code_start, wakeup_code_end
> =C2=A0 =C2=A0 7 =C2=A0wakeup_code_start:
> =C2=A0 =C2=A0 8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.incbin "arch/x86/k=
ernel/acpi/realmode/wakeup.bin"
> =C2=A0 =C2=A0 9 =C2=A0wakeup_code_end:
> =C2=A0 =C2=A010 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size =C2=A0 wakeup=
_code_start, .-wakeup_code_start
>
> And it compiles just fine.
> The fix for entry_32.S is valid, though, and necessary for mainline.
>
> Greetings,
> =C2=A0 =C2=A0Alexander
>
>> I am unsure how to fix that and open for feedback.
>>
>> - Sedat -
>>
>

The file in linux-next (next-20110308) looks different (the above code
looks more logical to me)

[ arch/x86/kernel/acpi/wakeup_rm.S ]

/*
 * Wrapper script for the realmode binary as a transport object
 * before copying to low memory.
 */
#include <asm/page_types.h>

        .section ".x86_trampoline","a"
        .balign PAGE_SIZE
        .globl  acpi_wakeup_code
acpi_wakeup_code:
        .incbin "arch/x86/kernel/acpi/realmode/wakeup.bin"
        .size   wakeup_code_start, .-wakeup_code_start

Any ideas?

- Sedat -
