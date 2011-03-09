From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for March 8 (BROKEN:
 arch/x86/kernel/entry_32.S? Debian's binutils/as?)
Date: Wed, 9 Mar 2011 09:51:50 +0100
Message-ID: <20110309085150.GC21294@elte.hu>
References: <AANLkTin2H9=NWp5G6N6_e=bxBTh2eS1dbUxOjT6xX98C@mail.gmail.com>
 <AANLkTik_Cb7tXheZNOBjqnoQc4MSL1LnDtFGFP5mqZRi@mail.gmail.com>
 <AANLkTinBv__n7k3Z=EJWv1fdQScyB7AJV0SsYJE0mCwQ@mail.gmail.com>
 <AANLkTiknsT1iQzUQ_oBiOORaqWBFyk2BaLq_xu9C5E_G@mail.gmail.com>
 <1299605269.29313.1427511237@webmail.messagingengine.com>
 <AANLkTi=6YstJxad41knR4Q9WN3wYKikPv-g1i3kg3HS1@mail.gmail.com>
 <1299615939.25628.1427572905@webmail.messagingengine.com>
 <AANLkTimBMP1jiuEEUwmKKVNZcZnrkFxFA_YBcLmkEFJM@mail.gmail.com>
 <AANLkTikpMAXfG5aNWo8x7pKKppaQiE-U8qjFaG0B2azV@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:50920 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752874Ab1CIIwF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Mar 2011 03:52:05 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTikpMAXfG5aNWo8x7pKKppaQiE-U8qjFaG0B2azV@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H.J. Lu" <hjl.tools@gmail.com>
Cc: sedat.dilek@gmail.com, Sedat Dilek <sedat.dilek@googlemail.com>, Alexander van Heukelum <heukelum@fastmail.fm>, linux-next <linux-next@vger.kernel.org>, psomas@cslab.ece.ntua.gr, Jan Beulich <JBeulich@novell.com>, "H. Peter Anvin" <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org


* H.J. Lu <hjl.tools@gmail.com> wrote:

> On Tue, Mar 8, 2011 at 12:33 PM, Sedat Dilek <sedat.dilek@googlemail.=
com> wrote:
> > On Tue, Mar 8, 2011 at 9:25 PM, Alexander van Heukelum
> > <heukelum@fastmail.fm> wrote:
> >> On Tue, 08 Mar 2011 18:53 +0100, "Sedat Dilek" <sedat.dilek@google=
mail.com> wrote:
> >>> On Tue, Mar 8, 2011 at 6:27 PM, Alexander van Heukelum
> >>> <heukelum@fastmail.fm> wrote:
> >>> > On Tue, 08 Mar 2011 16:42 +0100, "Sedat Dilek" <sedat.dilek@goo=
glemail.com> wrote:
> >>> >> On 3/8/11, Sedat Dilek <sedat.dilek@googlemail.com> wrote:
> >>> >> > On 3/8/11, H.J. Lu <hjl.tools@gmail.com> wrote:
> >>> >> >> On Tue, Mar 8, 2011 at 2:44 AM, Sedat Dilek <sedat.dilek@go=
oglemail.com>
> >>> >> >> wrote:
> >>> >> >>> Hi,
> >>> >> >>>
> >>> >> >>> my build of linux-next (next-20110308, the same with the o=
ne from
> >>> >> >>> yesterday) is broken.
> >>> >> >>> (I translated the German output.)
> >>> >> >>>
> >>> >> >>> [ build.log ]
> >>> >> >>> =A0AS =A0 =A0 =A0arch/x86/kernel/entry_32.o
> >>> >> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/sourc=
e_i386_none/arch/x86/kernel/entry_32.S:
> >>> >> >>> Assembler messages:
> >>> >> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/sourc=
e_i386_none/arch/x86/kernel/entry_32.S:1421:
> >>> >> >>> Error: .size expression does not evaluate to a constant
> >>> >> >>> make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1 (Error =
1)
> >>> >> >>> make[5]: *** [arch/x86/kernel] Fehler 2 (Error 2)
> >>> >> >>> make[4]: *** [arch/x86] Fehler 2 (Error 2)
> >>> >> >>> make[4]: *** Warte auf noch nicht beendete Prozesse... (Wa=
iting for
> >>> >> >>> unfinished jobs...)
> >>> >> >>>
> >>> >> >>
> >>> >> >> This is a kernel bug. =A0Please use the latest binutils fro=
m CVS.
> >>> >> >> It will tell you which symbol causes this.
> >>> >> >>
> >>> >> >>
> >>> >> >> --
> >>> >> >> H.J.
> >>> >> >>
> >>> >> >
> >>> >> > Yeah, I have cherry-picked these two upstream commits before=
 you have
> >>> >> > mentionned it...
> >>> >> >
> >>> >> > 0001-Mention-symbol-name-in-non-constant-.size-expression.pa=
tch
> >>> >> > =A0 =A0 =A0 =A0(Cherry-picked from commit b9521fc0be7945fc84=
2ce1197e241a023378125d)
> >>> >> > 0002-Revert-the-last-change-on-gas-elf-bad-size.err.patch
> >>> >> > =A0 =A0 =A0 =A0(Cherry-picked from commit cbd141bb69f791de7e=
a1581abe7afb34f0c61288)
> >>> >> >
> >>> >> > ... and have built with them a new binutils Debian package.
> >>> >> >
> >>> >> > The error looks now like this (sorry for the German output):
> >>> >> > ...
> >>> >> > =A0 AS =A0 =A0 =A0arch/x86/kernel/entry_32.o
> >>> >> > /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_=
i386_none/arch/x86/kernel/entry_32.S:
> >>> >> > Assembler messages:
> >>> >> > /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_=
i386_none/arch/x86/kernel/entry_32.S:1421:
> >>> >> > Error: .size expression with symbol `apf_page_fault' does no=
t evaluate
> >>> >> > to a constant
> >>> >> > make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1
> >>> >> > make[5]: *** [arch/x86/kernel] Fehler 2
> >>> >> > make[5]: *** Warte auf noch nicht beendete Prozesse...
> >>> >> >
> >>> >> > Anyway, before more riddling around it would be very helpful=
 to have a
> >>> >> > clear pointer if there is a fix around... That building, tes=
ting and
> >>> >> > installing took me now several hours.
> >>> >> > And... yeah, backports to 2.21-branch appreciated.
> >>> >> >
> >>> >> > - Sedat -
> >>> >> >
> >>> >>
> >>> >> After a quick look into the source, it seems attached patch fi=
xes the
> >>> >> issue.
> >>> >> Is that OK?
> >>> >
> >>> > Hi Sedat,
> >>> >
> >>> > The patch ( https://lkml.org/lkml/2011/3/8/203 ) is ok, feel fr=
ee to add
> >>> > Acked-by: Alexander van Heukelum <heukelum@fastmail.fm>
> >>> >
> >>> > Better description might be something like:
> >>> >
> >>> > i386: Fix mismatched ENTRY/END pair.
> >>> >
> >>> > Under CONFIG_KVM_GUEST=3Dy, the following part of entry_32.S ca=
uses a compile failure.
> >>> >
> >>> > 1409 #ifdef CONFIG_KVM_GUEST
> >>> > 1410 ENTRY(async_page_fault)
> >>> > 1411 =A0 =A0 =A0 =A0 RING0_EC_FRAME
> >>> > 1412 =A0 =A0 =A0 =A0 pushl $do_async_page_fault
> >>> > 1413 =A0 =A0 =A0 =A0 CFI_ADJUST_CFA_OFFSET 4
> >>> > 1414 =A0 =A0 =A0 =A0 jmp error_code
> >>> > 1415 =A0 =A0 =A0 =A0 CFI_ENDPROC
> >>> > 1416 END(apf_page_fault)
> >>> > 1417 #endif
> >>> >
> >>> > Replace apf_page_fault with async_page_fault, as intended.
> >>> >
> >>> > Greetings,
> >>> > =A0 =A0Alexander
> >>> >
> >>> >> - Sedat -
> >>> >>
> >>> >> Email had 1 attachment:
> >>> >> + 0001-x86-Fix-build-failure-with-binutils-as-from-upstream.pa=
tch
> >>> >> =A0 1k (text/x-patch)
> >>> >
> >>>
> >>> As I said, quick view on the code, quick fix :-).
> >>>
> >>> Your description is definitive more meaningful.
> >>> I can refresh my patch and add your ACK.
> >>>
> >>> Anyway, I continued after dinner and with the above patch I ran i=
nto
> >>> the next problem:
> >>> [ build.log ]
> >>> ...
> >>> =A0 AS =A0 =A0 =A0arch/x86/kernel/acpi/wakeup_rm.o
> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_=
none/arch/x86/kernel/acpi/wakeup_rm.S:
> >>> Assembler messages:
> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_=
none/arch/x86/kernel/acpi/wakeup_rm.S:12:
> >>> Error: .size expression with symbol `wakeup_code_start' does not
> >>> evaluate to a constant
> >>
> >> No idea what's wrong there. But my version of wakeup_rm.S has only=
 10 lines...
> >>
> >> =A0 =A0 1 =A0/*
> >> =A0 =A0 2 =A0 * Wrapper script for the realmode binary as a transp=
ort object
> >> =A0 =A0 3 =A0 * before copying to low memory.
> >> =A0 =A0 4 =A0 */
> >> =A0 =A0 5 =A0 =A0 =A0 =A0 =A0.section ".rodata","a"
> >> =A0 =A0 6 =A0 =A0 =A0 =A0 =A0.globl =A0wakeup_code_start, wakeup_c=
ode_end
> >> =A0 =A0 7 =A0wakeup_code_start:
> >> =A0 =A0 8 =A0 =A0 =A0 =A0 =A0.incbin "arch/x86/kernel/acpi/realmod=
e/wakeup.bin"
> >> =A0 =A0 9 =A0wakeup_code_end:
> >> =A0 =A010 =A0 =A0 =A0 =A0 =A0.size =A0 wakeup_code_start, .-wakeup=
_code_start
> >>
> >> And it compiles just fine.
> >> The fix for entry_32.S is valid, though, and necessary for mainlin=
e.
> >>
> >> Greetings,
> >> =A0 =A0Alexander
> >>
> >>> I am unsure how to fix that and open for feedback.
> >>>
> >>> - Sedat -
> >>>
> >>
> >
> > The file in linux-next (next-20110308) looks different (the above c=
ode
> > looks more logical to me)
> >
> > [ arch/x86/kernel/acpi/wakeup_rm.S ]
> >
> > /*
> > =A0* Wrapper script for the realmode binary as a transport object
> > =A0* before copying to low memory.
> > =A0*/
> > #include <asm/page_types.h>
> >
> > =A0 =A0 =A0 =A0.section ".x86_trampoline","a"
> > =A0 =A0 =A0 =A0.balign PAGE_SIZE
> > =A0 =A0 =A0 =A0.globl =A0acpi_wakeup_code
> > acpi_wakeup_code:
> > =A0 =A0 =A0 =A0.incbin "arch/x86/kernel/acpi/realmode/wakeup.bin"
> > =A0 =A0 =A0 =A0.size =A0 wakeup_code_start, .-wakeup_code_start
> >
>=20
> Those are simply wrong.  2.6.38-rc8 is OK.

2.6.37-rc8 is not OK: for example commit 631bc4878220932fe67fc46fc7cf7c=
ccdb1ec597 is=20
already upstream and if you enable KVM you see a broken kernel build wi=
th new=20
binutils. This is from 2.6.38-rc8:

 #ifdef CONFIG_KVM_GUEST
 ENTRY(async_page_fault)
        RING0_EC_FRAME
        pushl $do_async_page_fault
        CFI_ADJUST_CFA_OFFSET 4
        jmp error_code
        CFI_ENDPROC
 END(apf_page_fault)
 #endif

Yes, the .size directive not matching up is technically a bug, but it w=
as not=20
checked by binutils before, for *years* - and you cannot just flip a sw=
itch and=20
break who knows how much code.

You need to at least emit a warning for some time to give people a *cha=
nce* to fix=20
bugs - not just stuff an incompatible binutils down their throat and br=
eak the=20
kernel build for thousands of commits and break bisection.

This binutils change is breaking numerous upstream kernel builds (and i=
s making=20
bisection with new binutils impossible) for no particular good reason: =
binutils was=20
capable to figure out the symbol name before this change.

At minimum you need to *understand* that what you are doing is an incom=
patible=20
change and is disruptive to others ...

Thanks,

	Ingo
