From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Tue, 1 Mar 2016 12:29:10 +1100
Message-ID: <20160301122910.74ff0a92@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52901 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750704AbcCAB3N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Feb 2016 20:29:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

  DESCEND  objtool
  CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/builtin-check.o
  CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/special.o
  CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/elf.o
  CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/objtool.o
  MKDIR    /home/sfr/next/x86_64_allmodconfig/tools/objtool/arch/x86/insn/
  CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/libstring.o
elf.c:22:23: fatal error: sys/types.h: No such file or directory
compilation terminated.
  CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/exec-cmd.o
  CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/help.o
builtin-check.c:28:20: fatal error: string.h: No such file or directory
compilation terminated.
objtool.c:28:19: fatal error: stdio.h: No such file or directory
compilation terminated.

and further errors ...

This build is done with a PowerPC hosted cross compiler with no glibc.
I assume that some things here need to be built with HOSTCC?

Presumably caused by commit

  9e54249679b4 ("Merge branch 'core/objtool'")

and the commit series that was merged.

I tried to revert that merge, but it had conflicts, so I just used the
tip tree from next-20160229 for today.

-- 
Cheers,
Stephen Rothwell
