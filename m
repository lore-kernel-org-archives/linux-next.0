From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Thu, 14 Apr 2016 12:14:18 +1000
Message-ID: <20160414121418.288bd117@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the tip tree, today's linux-next build (powerpc64le perf)
failed like this:

make[3]: *** No rule to make target '/home/sfr/next/perf/arch/x86/include/generated/asm/syscalls_64.c', needed by '/home/sfr/next/perf/util/syscalltbl.o'.  Stop.

(I build in /home/sfr/next/next with objects in /home/sfr/next/perf.)

Presumably caused by commit

  1b700c997500 ("perf tools: Build syscall table .c header from kernel's syscall_64.tbl")

I have reverted that commit for today (which fixes my build problem but
may not be overall correct).

-- 
Cheers,
Stephen Rothwell
