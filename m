From: "H.J. Lu" <hjl.tools@gmail.com>
Subject: Re: linux-next: Tree for March 8 (BROKEN: arch/x86/kernel/entry_32.S?
 Debian's binutils/as?)
Date: Tue, 8 Mar 2011 06:55:03 -0800
Message-ID: <AANLkTik_Cb7tXheZNOBjqnoQc4MSL1LnDtFGFP5mqZRi@mail.gmail.com>
References: <AANLkTin2H9=NWp5G6N6_e=bxBTh2eS1dbUxOjT6xX98C@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:38504 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754811Ab1CHOzE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Mar 2011 09:55:04 -0500
In-Reply-To: <AANLkTin2H9=NWp5G6N6_e=bxBTh2eS1dbUxOjT6xX98C@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Sedat Dilek <sedat.dilek@googlemail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Matthias Klose <doko@debian.org>, linux-next <linux-next@vger.kernel.org>, debian-gcc <debian-gcc@lists.debian.org>, binutils <binutils@sourceware.org>, psomas@cslab.ece.ntua.gr, JBeulich@novell.com, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, LKML <linux-kernel@vger.kernel.org>

On Tue, Mar 8, 2011 at 2:44 AM, Sedat Dilek <sedat.dilek@googlemail.com=
> wrote:
> Hi,
>
> my build of linux-next (next-20110308, the same with the one from
> yesterday) is broken.
> (I translated the German output.)
>
> [ build.log ]
> =A0AS =A0 =A0 =A0arch/x86/kernel/entry_32.o
> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none=
/arch/x86/kernel/entry_32.S:
> Assembler messages:
> /home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none=
/arch/x86/kernel/entry_32.S:1421:
> Error: .size expression does not evaluate to a constant
> make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1 (Error 1)
> make[5]: *** [arch/x86/kernel] Fehler 2 (Error 2)
> make[4]: *** [arch/x86] Fehler 2 (Error 2)
> make[4]: *** Warte auf noch nicht beendete Prozesse... (Waiting for
> unfinished jobs...)
>

This is a kernel bug.  Please use the latest binutils from CVS.
It will tell you which symbol causes this.


--=20
H.J.
