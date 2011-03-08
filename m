From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for March 8 (BROKEN: arch/x86/kernel/entry_32.S?
 Debian's binutils/as?)
Date: Tue, 8 Mar 2011 11:44:01 +0100
Message-ID: <AANLkTin2H9=NWp5G6N6_e=bxBTh2eS1dbUxOjT6xX98C@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:52678 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751809Ab1CHKoa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Mar 2011 05:44:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Matthias Klose <doko@debian.org>
Cc: linux-next <linux-next@vger.kernel.org>, debian-gcc <debian-gcc@lists.debian.org>, binutils <binutils@sourceware.org>, psomas@cslab.ece.ntua.gr, JBeulich@novell.com, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, LKML <linux-kernel@vger.kernel.org>

Hi,

my build of linux-next (next-20110308, the same with the one from
yesterday) is broken.
(I translated the German output.)

[ build.log ]
  AS      arch/x86/kernel/entry_32.o
/home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/arch/x86/kernel/entry_32.S:
Assembler messages:
/home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/arch/x86/kernel/entry_32.S:1421:
Error: .size expression does not evaluate to a constant
make[6]: *** [arch/x86/kernel/entry_32.o] Fehler 1 (Error 1)
make[5]: *** [arch/x86/kernel] Fehler 2 (Error 2)
make[4]: *** [arch/x86] Fehler 2 (Error 2)
make[4]: *** Warte auf noch nicht beendete Prozesse... (Waiting for
unfinished jobs...)

I am not sure if this is a problem of Debian's binutils snapshot from
binutils-2_21-branch (Debian-version: 2.21.0.20110302-1) from sid/i386
or this is only a problem for x86, but I just want to let you know.

FYI: The previous binutils (2.21.0.20110216-2) works fine.

I have tried with reverting the last two changes to
arch/x86/kernel/entry_32.S in linux-next:

"x86: Use {push,pop}_cfi in more places" (see [1])
"x86, asm: Cleanup unnecssary macros in asm-offsets.c" (see [2])

Reverting both or [1] or [2] breaks with Debians as (2.21.0.20110302-1).

BTW, [3] has a complete GIT history for the above file.

So, I am unsure from where the problem exactly aroses.
If this a known issue (and a fix around) or rings a bell to you, let
me and others know.

Thanks in advance.

Regards,
- Sedat -

[1] http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=commit;h=60cf637a13932a4750da6746efd0199e8a4c341b

[2] http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=commit;h=7bf04be8f48ceeeffa5b5a79734d6d6e0d59e5f8

[3] http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=history;f=arch/x86/kernel/entry_32.S;h=2878821cb8c1da1d7147b26271114fa9546afe03;hb=HEAD
