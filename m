From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 1 Mar 2016 08:28:22 +0100
Message-ID: <CA+icZUUM9U4i0mZqyhLyBQApGNWAjx1EBY+C5RybPhO1NL+sGg@mail.gmail.com>
References: <20160301122910.74ff0a92@canb.auug.org.au>
	<20160301070750.GA6636@gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f50.google.com ([209.85.213.50]:36753 "EHLO
	mail-vk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751639AbcCAH2X (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2016 02:28:23 -0500
In-Reply-To: <20160301070750.GA6636@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>

On Tue, Mar 1, 2016 at 8:07 AM, Ingo Molnar <mingo@kernel.org> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> Hi all,
>>
>> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
>> failed like this:
>>
>>   DESCEND  objtool
>>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/builtin-check.o
>>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/special.o
>>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/elf.o
>>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/objtool.o
>>   MKDIR    /home/sfr/next/x86_64_allmodconfig/tools/objtool/arch/x86/insn/
>>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/libstring.o
>> elf.c:22:23: fatal error: sys/types.h: No such file or directory
>> compilation terminated.
>>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/exec-cmd.o
>>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/help.o
>> builtin-check.c:28:20: fatal error: string.h: No such file or directory
>> compilation terminated.
>> objtool.c:28:19: fatal error: stdio.h: No such file or directory
>> compilation terminated.
>>
>> and further errors ...
>>
>> This build is done with a PowerPC hosted cross compiler with no glibc.
>
> Ugh, what a rare and weird way to build an x86 kernel, and you made linux-next
> dependent on it?
>
>> I assume that some things here need to be built with HOSTCC?
>
> I suspect that's the culprit. Do you now mandate people to have PowerPC systems as
> a requirement to merge to linux-next? How are people supposed to be able to test
> that rare type of build method which does not matter to 99.99% of our kernel
> testers and users?
>

>From my experience in using different $COMPILER you should always pass
CC and HOSTCC in your make-line when building a Linux-kernel or
playing with the Kconfig-system.

When building my llvm-toolchain with make/autoconf I had also to pass
CC and CXX to my configure-line otherwise you got misconfiguration.

[ EXAMPLE: Linux Kconfig-system ]

$ MAKE="make V=1" ; COMPILER="mycompiler" ; MAKE_OPTS="CC=$COMPILER
HOSTCC=$COMPILER"

$ yes "" | $MAKE $MAKE_OPTS oldconfig && $MAKE $MAKE_OPTS
silentoldconfig < /dev/null

- Sedat -
