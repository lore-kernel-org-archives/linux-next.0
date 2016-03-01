From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 1 Mar 2016 08:07:50 +0100
Message-ID: <20160301070750.GA6636@gmail.com>
References: <20160301122910.74ff0a92@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160301122910.74ff0a92@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
>   DESCEND  objtool
>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/builtin-check.o
>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/special.o
>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/elf.o
>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/objtool.o
>   MKDIR    /home/sfr/next/x86_64_allmodconfig/tools/objtool/arch/x86/insn/
>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/libstring.o
> elf.c:22:23: fatal error: sys/types.h: No such file or directory
> compilation terminated.
>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/exec-cmd.o
>   CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/help.o
> builtin-check.c:28:20: fatal error: string.h: No such file or directory
> compilation terminated.
> objtool.c:28:19: fatal error: stdio.h: No such file or directory
> compilation terminated.
> 
> and further errors ...
> 
> This build is done with a PowerPC hosted cross compiler with no glibc.

Ugh, what a rare and weird way to build an x86 kernel, and you made linux-next 
dependent on it?

> I assume that some things here need to be built with HOSTCC?

I suspect that's the culprit. Do you now mandate people to have PowerPC systems as 
a requirement to merge to linux-next? How are people supposed to be able to test 
that rare type of build method which does not matter to 99.99% of our kernel 
testers and users?

Thanks,

	Ingo
