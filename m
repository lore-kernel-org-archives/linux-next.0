From: "Alexander van Heukelum" <heukelum@fastmail.fm>
Subject: Re: linux-next: Tree for March 8 (BROKEN: arch/x86/kernel/entry_32.S?
 Debian's binutils/as?)
Date: Tue, 08 Mar 2011 18:27:49 +0100
Message-ID: <1299605269.29313.1427511237@webmail.messagingengine.com>
References: <AANLkTin2H9=NWp5G6N6_e=bxBTh2eS1dbUxOjT6xX98C@mail.gmail.com><AANLkTik_Cb7tXheZNOBjqnoQc4MSL1LnDtFGFP5mqZRi@mail.gmail.com><AANLkTinBv__n7k3Z=EJWv1fdQScyB7AJV0SsYJE0mCwQ@mail.gmail.com><AANLkTiknsT1iQzUQ_oBiOORaqWBFyk2BaLq_xu9C5E_G@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5.smtp.messagingengine.com ([66.111.4.29]:59190 "EHLO
	out5.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750909Ab1CHRgp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Mar 2011 12:36:45 -0500
In-Reply-To: <AANLkTiknsT1iQzUQ_oBiOORaqWBFyk2BaLq_xu9C5E_G@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com, Ingo Molnar <mingo@elte.hu>
Cc: linux-next <linux-next@vger.kernel.org>, psomas@cslab.ece.ntua.gr, Jan Beulich <JBeulich@novell.com>, "H. Peter Anvin" <hpa@zytor.com>, "H.J. Lu" <hjl.tools@gmail.com>

On Tue, 08 Mar 2011 16:42 +0100, "Sedat Dilek" <sedat.dilek@googlemail.com> wrote:
> On 3/8/11, Sedat Dilek <sedat.dilek@googlemail.com> wrote:
> > On 3/8/11, H.J. Lu <hjl.tools@gmail.com> wrote:
> >> On Tue, Mar 8, 2011 at 2:44 AM, Sedat Dilek <sedat.dilek@googlemail.com>
> >> wrote:
> >>> Hi,
> >>>
> >>> my build of linux-next (next-20110308, the same with the one from
> >>> yesterday) is broken.
> >>> (I translated the German output.)
> >>>
> >>> [ build.log ]
> >>>  AS      arch/x86/kernel/entry_32.o
> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/arch/x86/kernel/entry_32.S:
> >>> Assembler messages:
> >>> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/arch/x86/kernel/entry_32.S:1421:
> >>> Error: .size expression does not evaluate to a constant
> >>> make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1 (Error 1)
> >>> make[5]: *** [arch/x86/kernel] Fehler 2 (Error 2)
> >>> make[4]: *** [arch/x86] Fehler 2 (Error 2)
> >>> make[4]: *** Warte auf noch nicht beendete Prozesse... (Waiting for
> >>> unfinished jobs...)
> >>>
> >>
> >> This is a kernel bug.  Please use the latest binutils from CVS.
> >> It will tell you which symbol causes this.
> >>
> >>
> >> --
> >> H.J.
> >>
> >
> > Yeah, I have cherry-picked these two upstream commits before you have
> > mentionned it...
> >
> > 0001-Mention-symbol-name-in-non-constant-.size-expression.patch
> >        (Cherry-picked from commit b9521fc0be7945fc842ce1197e241a023378125d)
> > 0002-Revert-the-last-change-on-gas-elf-bad-size.err.patch
> >        (Cherry-picked from commit cbd141bb69f791de7ea1581abe7afb34f0c61288)
> >
> > ... and have built with them a new binutils Debian package.
> >
> > The error looks now like this (sorry for the German output):
> > ...
> >   AS      arch/x86/kernel/entry_32.o
> > /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/arch/x86/kernel/entry_32.S:
> > Assembler messages:
> > /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/arch/x86/kernel/entry_32.S:1421:
> > Error: .size expression with symbol `apf_page_fault' does not evaluate
> > to a constant
> > make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1
> > make[5]: *** [arch/x86/kernel] Fehler 2
> > make[5]: *** Warte auf noch nicht beendete Prozesse...
> >
> > Anyway, before more riddling around it would be very helpful to have a
> > clear pointer if there is a fix around... That building, testing and
> > installing took me now several hours.
> > And... yeah, backports to 2.21-branch appreciated.
> >
> > - Sedat -
> >
> 
> After a quick look into the source, it seems attached patch fixes the
> issue.
> Is that OK?

Hi Sedat,

The patch ( https://lkml.org/lkml/2011/3/8/203 ) is ok, feel free to add
Acked-by: Alexander van Heukelum <heukelum@fastmail.fm>

Better description might be something like:

i386: Fix mismatched ENTRY/END pair.

Under CONFIG_KVM_GUEST=y, the following part of entry_32.S causes a compile failure.

1409 #ifdef CONFIG_KVM_GUEST
1410 ENTRY(async_page_fault)
1411         RING0_EC_FRAME
1412         pushl $do_async_page_fault
1413         CFI_ADJUST_CFA_OFFSET 4
1414         jmp error_code
1415         CFI_ENDPROC
1416 END(apf_page_fault)
1417 #endif

Replace apf_page_fault with async_page_fault, as intended.

Greetings,
    Alexander

> - Sedat -
> 
> Email had 1 attachment:
> + 0001-x86-Fix-build-failure-with-binutils-as-from-upstream.patch
>   1k (text/x-patch)
