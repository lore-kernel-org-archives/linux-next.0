From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Mon, 29 Feb 2016 23:39:29 -0800
Message-ID: <F86C52D5-02DB-441D-AC8B-FC5169CAF182@zytor.com>
References: <20160301122910.74ff0a92@canb.auug.org.au> <20160301070750.GA6636@gmail.com> <CA+icZUUM9U4i0mZqyhLyBQApGNWAjx1EBY+C5RybPhO1NL+sGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from torg.zytor.com ([198.137.202.12]:50844 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750813AbcCAHkW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Mar 2016 02:40:22 -0500
In-Reply-To: <CA+icZUUM9U4i0mZqyhLyBQApGNWAjx1EBY+C5RybPhO1NL+sGg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com, Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>

On February 29, 2016 11:28:22 PM PST, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>On Tue, Mar 1, 2016 at 8:07 AM, Ingo Molnar <mingo@kernel.org> wrote:
>>
>> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>>> Hi all,
>>>
>>> After merging the tip tree, today's linux-next build (x86_64
>allmodconfig)
>>> failed like this:
>>>
>>>   DESCEND  objtool
>>>   CC      
>/home/sfr/next/x86_64_allmodconfig/tools/objtool/builtin-check.o
>>>   CC      
>/home/sfr/next/x86_64_allmodconfig/tools/objtool/special.o
>>>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/elf.o
>>>   CC      
>/home/sfr/next/x86_64_allmodconfig/tools/objtool/objtool.o
>>>   MKDIR   
>/home/sfr/next/x86_64_allmodconfig/tools/objtool/arch/x86/insn/
>>>   CC      
>/home/sfr/next/x86_64_allmodconfig/tools/objtool/libstring.o
>>> elf.c:22:23: fatal error: sys/types.h: No such file or directory
>>> compilation terminated.
>>>   CC      
>/home/sfr/next/x86_64_allmodconfig/tools/objtool/exec-cmd.o
>>>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/help.o
>>> builtin-check.c:28:20: fatal error: string.h: No such file or
>directory
>>> compilation terminated.
>>> objtool.c:28:19: fatal error: stdio.h: No such file or directory
>>> compilation terminated.
>>>
>>> and further errors ...
>>>
>>> This build is done with a PowerPC hosted cross compiler with no
>glibc.
>>
>> Ugh, what a rare and weird way to build an x86 kernel, and you made
>linux-next
>> dependent on it?
>>
>>> I assume that some things here need to be built with HOSTCC?
>>
>> I suspect that's the culprit. Do you now mandate people to have
>PowerPC systems as
>> a requirement to merge to linux-next? How are people supposed to be
>able to test
>> that rare type of build method which does not matter to 99.99% of our
>kernel
>> testers and users?
>>
>
>From my experience in using different $COMPILER you should always pass
>CC and HOSTCC in your make-line when building a Linux-kernel or
>playing with the Kconfig-system.
>
>When building my llvm-toolchain with make/autoconf I had also to pass
>CC and CXX to my configure-line otherwise you got misconfiguration.
>
>[ EXAMPLE: Linux Kconfig-system ]
>
>$ MAKE="make V=1" ; COMPILER="mycompiler" ; MAKE_OPTS="CC=$COMPILER
>HOSTCC=$COMPILER"
>
>$ yes "" | $MAKE $MAKE_OPTS oldconfig && $MAKE $MAKE_OPTS
>silentoldconfig < /dev/null
>
>- Sedat -

That is not the issue here.  The problem is clearly that objtool is a host program and not compiled with host cc.  So it is a good thing to test even though it is weird, because it affects real use cases.

As x86 is far and beyond the most widely used host architecture, cross-compiling x86 is more likely to involve compiler differences than actually using another host, or possibly compiling 32 bits on a system without the 32-bit libc installed, but it should still work.
-- 
Sent from my Android device with K-9 Mail. Please excuse brevity and formatting.
