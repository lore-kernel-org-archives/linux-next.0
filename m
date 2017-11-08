From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Wed, 8 Nov 2017 13:47:17 +1100
Message-ID: <20171108134717.578046db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from orc_dump.c:19:0:
orc.h:21:10: fatal error: asm/orc_types.h: No such file or directory
 #include <asm/orc_types.h>
          ^~~~~~~~~~~~~~~~~
compilation terminated.
mv: cannot stat '/home/sfr/next/x86_64_allmodconfig/tools/objtool/.orc_dump.o.tmp': No such file or directory
tools/build/Makefile.build:96: recipe for target '/home/sfr/next/x86_64_allmodconfig/tools/objtool/orc_dump.o' failed
In file included from orc_gen.c:21:0:
orc.h:21:10: fatal error: asm/orc_types.h: No such file or directory
 #include <asm/orc_types.h>
          ^~~~~~~~~~~~~~~~~
compilation terminated.
mv: cannot stat '/home/sfr/next/x86_64_allmodconfig/tools/objtool/.orc_gen.o.tmp': No such file or directory
tools/build/Makefile.build:96: recipe for target '/home/sfr/next/x86_64_allmodconfig/tools/objtool/orc_gen.o' failed
In file included from check.h:25:0,
                 from builtin-check.c:30:
orc.h:21:10: fatal error: asm/orc_types.h: No such file or directory
 #include <asm/orc_types.h>
          ^~~~~~~~~~~~~~~~~
compilation terminated.
In file included from check.h:25:0,
                 from builtin-orc.c:30:
orc.h:21:10: fatal error: asm/orc_types.h: No such file or directory
 #include <asm/orc_types.h>
          ^~~~~~~~~~~~~~~~~
compilation terminated.
mv: cannot stat '/home/sfr/next/x86_64_allmodconfig/tools/objtool/.builtin-check.o.tmp': No such file or directory
tools/build/Makefile.build:96: recipe for target '/home/sfr/next/x86_64_allmodconfig/tools/objtool/builtin-check.o' failed
mv: cannot stat '/home/sfr/next/x86_64_allmodconfig/tools/objtool/.builtin-orc.o.tmp': No such file or directory
tools/build/Makefile.build:96: recipe for target '/home/sfr/next/x86_64_allmodconfig/tools/objtool/builtin-orc.o' failed
In file included from check.h:25:0,
                 from check.c:21:
orc.h:21:10: fatal error: asm/orc_types.h: No such file or directory
 #include <asm/orc_types.h>
          ^~~~~~~~~~~~~~~~~
compilation terminated.
mv: cannot stat '/home/sfr/next/x86_64_allmodconfig/tools/objtool/.check.o.tmp': No such file or directory
tools/build/Makefile.build:96: recipe for target '/home/sfr/next/x86_64_allmodconfig/tools/objtool/check.o' failed
arch/x86/decode.c:22:10: fatal error: asm/insn.h: No such file or directory
 #include <asm/insn.h>
          ^~~~~~~~~~~~
compilation terminated.
mv: cannot stat '/home/sfr/next/x86_64_allmodconfig/tools/objtool/arch/x86/.decode.o.tmp': No such file or directory

Presumably caused by commit

  6a77cff819ae ("objtool: Move synced files to their original relative locations")

If it matters, this is a cross compilation (PowerPC host) using O= .

I have used the tip tree from next-20171107 for today.

-- 
Cheers,
Stephen Rothwell
