From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for March 8 (BROKEN:
 arch/x86/kernel/entry_32.S? Debian's binutils/as?)
Date: Wed, 9 Mar 2011 12:51:19 +0100
Message-ID: <20110309115119.GG30411@elte.hu>
References: <AANLkTik_Cb7tXheZNOBjqnoQc4MSL1LnDtFGFP5mqZRi@mail.gmail.com>
 <AANLkTinBv__n7k3Z=EJWv1fdQScyB7AJV0SsYJE0mCwQ@mail.gmail.com>
 <AANLkTiknsT1iQzUQ_oBiOORaqWBFyk2BaLq_xu9C5E_G@mail.gmail.com>
 <1299605269.29313.1427511237@webmail.messagingengine.com>
 <AANLkTi=6YstJxad41knR4Q9WN3wYKikPv-g1i3kg3HS1@mail.gmail.com>
 <1299615939.25628.1427572905@webmail.messagingengine.com>
 <AANLkTimBMP1jiuEEUwmKKVNZcZnrkFxFA_YBcLmkEFJM@mail.gmail.com>
 <AANLkTikpMAXfG5aNWo8x7pKKppaQiE-U8qjFaG0B2azV@mail.gmail.com>
 <20110309085150.GC21294@elte.hu>
 <AANLkTinLAZubVih-y6=EsGnd0yLmFDUcG10u-EbozUS0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:58004 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755871Ab1CILvk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Mar 2011 06:51:40 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTinLAZubVih-y6=EsGnd0yLmFDUcG10u-EbozUS0@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: "H.J. Lu" <hjl.tools@gmail.com>, Alexander van Heukelum <heukelum@fastmail.fm>, linux-next <linux-next@vger.kernel.org>, psomas@cslab.ece.ntua.gr, Jan Beulich <JBeulich@novell.com>, "H. Peter Anvin" <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

* Sedat Dilek <sedat.dilek@googlemail.com> wrote:

> On Wed, Mar 9, 2011 at 9:51 AM, Ingo Molnar <mingo@elte.hu> wrote:
> >
> > * H.J. Lu <hjl.tools@gmail.com> wrote:
> >
> >> On Tue, Mar 8, 2011 at 12:33 PM, Sedat Dilek <sedat.dilek@googlema=
il.com> wrote:
> >> > On Tue, Mar 8, 2011 at 9:25 PM, Alexander van Heukelum
> >> > <heukelum@fastmail.fm> wrote:
> >> >> On Tue, 08 Mar 2011 18:53 +0100, "Sedat Dilek" <sedat.dilek@goo=
glemail.com> wrote:
> >> >>> On Tue, Mar 8, 2011 at 6:27 PM, Alexander van Heukelum
> >> >>> <heukelum@fastmail.fm> wrote:
> >> >>> > On Tue, 08 Mar 2011 16:42 +0100, "Sedat Dilek" <sedat.dilek@=
googlemail.com> wrote:
> >> >>> >> On 3/8/11, Sedat Dilek <sedat.dilek@googlemail.com> wrote:
> >> >>> >> > On 3/8/11, H.J. Lu <hjl.tools@gmail.com> wrote:
> >> >>> >> >> On Tue, Mar 8, 2011 at 2:44 AM, Sedat Dilek <sedat.dilek=
@googlemail.com>
> >> >>> >> >> wrote:
> >> >>> >> >>> Hi,
> >> >>> >> >>>
> >> >>> >> >>> my build of linux-next (next-20110308, the same with th=
e one from
> >> >>> >> >>> yesterday) is broken.
> >> >>> >> >>> (I translated the German output.)
> >> >>> >> >>>
> >> >>> >> >>> [ build.log ]
> >> >>> >> >>> =A0AS =A0 =A0 =A0arch/x86/kernel/entry_32.o
> >> >>> >> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/so=
urce_i386_none/arch/x86/kernel/entry_32.S:
> >> >>> >> >>> Assembler messages:
> >> >>> >> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/so=
urce_i386_none/arch/x86/kernel/entry_32.S:1421:
> >> >>> >> >>> Error: .size expression does not evaluate to a constant
> >> >>> >> >>> make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1 (Err=
or 1)
> >> >>> >> >>> make[5]: *** [arch/x86/kernel] Fehler 2 (Error 2)
> >> >>> >> >>> make[4]: *** [arch/x86] Fehler 2 (Error 2)
> >> >>> >> >>> make[4]: *** Warte auf noch nicht beendete Prozesse... =
(Waiting for
> >> >>> >> >>> unfinished jobs...)
> >> >>> >> >>>
> >> >>> >> >>
> >> >>> >> >> This is a kernel bug. =A0Please use the latest binutils =
from CVS.
> >> >>> >> >> It will tell you which symbol causes this.
> >> >>> >> >>
> >> >>> >> >>
> >> >>> >> >> --
> >> >>> >> >> H.J.
> >> >>> >> >>
> >> >>> >> >
> >> >>> >> > Yeah, I have cherry-picked these two upstream commits bef=
ore you have
> >> >>> >> > mentionned it...
> >> >>> >> >
> >> >>> >> > 0001-Mention-symbol-name-in-non-constant-.size-expression=
=2Epatch
> >> >>> >> > =A0 =A0 =A0 =A0(Cherry-picked from commit b9521fc0be7945f=
c842ce1197e241a023378125d)
> >> >>> >> > 0002-Revert-the-last-change-on-gas-elf-bad-size.err.patch
> >> >>> >> > =A0 =A0 =A0 =A0(Cherry-picked from commit cbd141bb69f791d=
e7ea1581abe7afb34f0c61288)
> >> >>> >> >
> >> >>> >> > ... and have built with them a new binutils Debian packag=
e.
> >> >>> >> >
> >> >>> >> > The error looks now like this (sorry for the German outpu=
t):
> >> >>> >> > ...
> >> >>> >> > =A0 AS =A0 =A0 =A0arch/x86/kernel/entry_32.o
> >> >>> >> > /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/sour=
ce_i386_none/arch/x86/kernel/entry_32.S:
> >> >>> >> > Assembler messages:
> >> >>> >> > /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/sour=
ce_i386_none/arch/x86/kernel/entry_32.S:1421:
> >> >>> >> > Error: .size expression with symbol `apf_page_fault' does=
 not evaluate
> >> >>> >> > to a constant
> >> >>> >> > make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1
> >> >>> >> > make[5]: *** [arch/x86/kernel] Fehler 2
> >> >>> >> > make[5]: *** Warte auf noch nicht beendete Prozesse...
> >> >>> >> >
> >> >>> >> > Anyway, before more riddling around it would be very help=
ful to have a
> >> >>> >> > clear pointer if there is a fix around... That building, =
testing and
> >> >>> >> > installing took me now several hours.
> >> >>> >> > And... yeah, backports to 2.21-branch appreciated.
> >> >>> >> >
> >> >>> >> > - Sedat -
> >> >>> >> >
> >> >>> >>
> >> >>> >> After a quick look into the source, it seems attached patch=
 fixes the
> >> >>> >> issue.
> >> >>> >> Is that OK?
> >> >>> >
> >> >>> > Hi Sedat,
> >> >>> >
> >> >>> > The patch ( https://lkml.org/lkml/2011/3/8/203 ) is ok, feel=
 free to add
> >> >>> > Acked-by: Alexander van Heukelum <heukelum@fastmail.fm>
> >> >>> >
> >> >>> > Better description might be something like:
> >> >>> >
> >> >>> > i386: Fix mismatched ENTRY/END pair.
> >> >>> >
> >> >>> > Under CONFIG_KVM_GUEST=3Dy, the following part of entry_32.S=
 causes a compile failure.
> >> >>> >
> >> >>> > 1409 #ifdef CONFIG_KVM_GUEST
> >> >>> > 1410 ENTRY(async_page_fault)
> >> >>> > 1411 =A0 =A0 =A0 =A0 RING0_EC_FRAME
> >> >>> > 1412 =A0 =A0 =A0 =A0 pushl $do_async_page_fault
> >> >>> > 1413 =A0 =A0 =A0 =A0 CFI_ADJUST_CFA_OFFSET 4
> >> >>> > 1414 =A0 =A0 =A0 =A0 jmp error_code
> >> >>> > 1415 =A0 =A0 =A0 =A0 CFI_ENDPROC
> >> >>> > 1416 END(apf_page_fault)
> >> >>> > 1417 #endif
> >> >>> >
> >> >>> > Replace apf_page_fault with async_page_fault, as intended.
> >> >>> >
> >> >>> > Greetings,
> >> >>> > =A0 =A0Alexander
> >> >>> >
> >> >>> >> - Sedat -
> >> >>> >>
> >> >>> >> Email had 1 attachment:
> >> >>> >> + 0001-x86-Fix-build-failure-with-binutils-as-from-upstream=
=2Epatch
> >> >>> >> =A0 1k (text/x-patch)
> >> >>> >
> >> >>>
> >> >>> As I said, quick view on the code, quick fix :-).
> >> >>>
> >> >>> Your description is definitive more meaningful.
> >> >>> I can refresh my patch and add your ACK.
> >> >>>
> >> >>> Anyway, I continued after dinner and with the above patch I ra=
n into
> >> >>> the next problem:
> >> >>> [ build.log ]
> >> >>> ...
> >> >>> =A0 AS =A0 =A0 =A0arch/x86/kernel/acpi/wakeup_rm.o
> >> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i3=
86_none/arch/x86/kernel/acpi/wakeup_rm.S:
> >> >>> Assembler messages:
> >> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i3=
86_none/arch/x86/kernel/acpi/wakeup_rm.S:12:
> >> >>> Error: .size expression with symbol `wakeup_code_start' does n=
ot
> >> >>> evaluate to a constant
> >> >>
> >> >> No idea what's wrong there. But my version of wakeup_rm.S has o=
nly 10 lines...
> >> >>
> >> >> =A0 =A0 1 =A0/*
> >> >> =A0 =A0 2 =A0 * Wrapper script for the realmode binary as a tra=
nsport object
> >> >> =A0 =A0 3 =A0 * before copying to low memory.
> >> >> =A0 =A0 4 =A0 */
> >> >> =A0 =A0 5 =A0 =A0 =A0 =A0 =A0.section ".rodata","a"
> >> >> =A0 =A0 6 =A0 =A0 =A0 =A0 =A0.globl =A0wakeup_code_start, wakeu=
p_code_end
> >> >> =A0 =A0 7 =A0wakeup_code_start:
> >> >> =A0 =A0 8 =A0 =A0 =A0 =A0 =A0.incbin "arch/x86/kernel/acpi/real=
mode/wakeup.bin"
> >> >> =A0 =A0 9 =A0wakeup_code_end:
> >> >> =A0 =A010 =A0 =A0 =A0 =A0 =A0.size =A0 wakeup_code_start, .-wak=
eup_code_start
> >> >>
> >> >> And it compiles just fine.
> >> >> The fix for entry_32.S is valid, though, and necessary for main=
line.
> >> >>
> >> >> Greetings,
> >> >> =A0 =A0Alexander
> >> >>
> >> >>> I am unsure how to fix that and open for feedback.
> >> >>>
> >> >>> - Sedat -
> >> >>>
> >> >>
> >> >
> >> > The file in linux-next (next-20110308) looks different (the abov=
e code
> >> > looks more logical to me)
> >> >
> >> > [ arch/x86/kernel/acpi/wakeup_rm.S ]
> >> >
> >> > /*
> >> > =A0* Wrapper script for the realmode binary as a transport objec=
t
> >> > =A0* before copying to low memory.
> >> > =A0*/
> >> > #include <asm/page_types.h>
> >> >
> >> > =A0 =A0 =A0 =A0.section ".x86_trampoline","a"
> >> > =A0 =A0 =A0 =A0.balign PAGE_SIZE
> >> > =A0 =A0 =A0 =A0.globl =A0acpi_wakeup_code
> >> > acpi_wakeup_code:
> >> > =A0 =A0 =A0 =A0.incbin "arch/x86/kernel/acpi/realmode/wakeup.bin=
"
> >> > =A0 =A0 =A0 =A0.size =A0 wakeup_code_start, .-wakeup_code_start
> >> >
> >>
> >> Those are simply wrong. =A02.6.38-rc8 is OK.
> >
> > 2.6.37-rc8 is not OK: for example commit 631bc4878220932fe67fc46fc7=
cf7cccdb1ec597 is
> > already upstream and if you enable KVM you see a broken kernel buil=
d with new
> > binutils. This is from 2.6.38-rc8:
> >
> > =A0#ifdef CONFIG_KVM_GUEST
> > =A0ENTRY(async_page_fault)
> > =A0 =A0 =A0 =A0RING0_EC_FRAME
> > =A0 =A0 =A0 =A0pushl $do_async_page_fault
> > =A0 =A0 =A0 =A0CFI_ADJUST_CFA_OFFSET 4
> > =A0 =A0 =A0 =A0jmp error_code
> > =A0 =A0 =A0 =A0CFI_ENDPROC
> > =A0END(apf_page_fault)
> > =A0#endif
> >
> > Yes, the .size directive not matching up is technically a bug, but =
it was not
> > checked by binutils before, for *years* - and you cannot just flip =
a switch and
> > break who knows how much code.
> >
> > You need to at least emit a warning for some time to give people a =
*chance* to fix
> > bugs - not just stuff an incompatible binutils down their throat an=
d break the
> > kernel build for thousands of commits and break bisection.
> >
> > This binutils change is breaking numerous upstream kernel builds (a=
nd is making
> > bisection with new binutils impossible) for no particular good reas=
on: binutils was
> > capable to figure out the symbol name before this change.
> >
> > At minimum you need to *understand* that what you are doing is an i=
ncompatible
> > change and is disruptive to others ...
> >
> > Thanks,
> >
> > =A0 =A0 =A0 =A0Ingo
> >
>=20
> OK, I am not a toolchain expert, but this recent changes to upstream
> binutils were helpful to find at least the problematic place in the
> code (fix see [1]).

A warning would have a similarly positive effect.

> I only needed a blink of an eye to catch it.
> binutils 2.21 GIT has this change "PR gas/12519" which was not "perfe=
ct".
> With the patch in upstream (see [2], which should be cherry-picked fo=
r
> 2.21-GIT as I did for my debianized binutils), there is more
> "verbosity", now.
> We have now an advantage as we know what's going on *before* final
> binutils-2.21 release.
>=20
> What are you expecting from binutils developers?
> Shall they revert the above PR (yes, I also build a binutils with a
> revert of it)?
>=20
> The next place in code (I am on linux-next) could also be found easil=
y
> and with some help of x86 folks it could be fixed [2], too.
>=20
> Can you please explain the "incompatibility" and "breakage" with olde=
r
> kernels (especially for bisecting sounds awful)?

The KVM commit that had the mismatched pair is upstream:

 631bc4878220: KVM: Handle async PF in a guest.

You need to have CONFIG_KVM_GUEST=3Dy enabled in your .config to hit th=
at build=20
failure. If in the future, on a binutils-2.21 system you end up bisecti=
ng into this=20
commit or into any commit that contains that commit but not the fix, th=
e build=20
breaks.

Also, while such mismatches get found eventually, they never had any ba=
d=20
side-effects, so they were only found and fixed based on review.

Thus there's an unknown number of commits in the Linux kernel history t=
hat wont=20
build with binutils-2.21, with an unknown combination of .config's.

It might not matter much, but you should be aware of it - and unless it=
's absolutely=20
vital to change binutils behavior here it would be well advised to at l=
east consider=20
emitting a warning first and a hard build failure in a later version - =
that would=20
soften most of the direct practical impact of such a change (most bisec=
tion targets=20
involve the previous 1-2 kernel releases).

Thanks,

	Ingo
