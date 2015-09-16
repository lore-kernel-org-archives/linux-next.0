From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Wed, 16 Sep 2015 10:12:45 +1000
Message-ID: <20150916101245.60235b54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44816 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751644AbbIPAMs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Sep 2015 20:12:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi all,

After merging the tip tree, today's linux-next build (perf) failed
like this:

make[3]: *** No rule to make target 'tools/lib/api/fs/debugfs.h', needed by 'tools/perf/arch/common.o'.  Stop.
tools/build/Makefile.build:109: recipe for target 'arch' failed
make[4]: *** No rule to make target 'fs/debugfs.h', needed by 'tools/perf/fs/fs.o'.  Stop.
tools/build/Makefile.build:109: recipe for target 'fs' failed
make[3]: *** No rule to make target 'tools/lib/api/fs/debugfs.h', needed by 'tools/perf/util/abspath.o'.  Stop.
tools/build/Makefile.build:109: recipe for target 'util' failed
Makefile:32: recipe for target 'tools/perf/libapi-in.o' failed
Makefile.perf:417: recipe for target 'tools/perf/libapi.a' failed
Makefile.perf:393: recipe for target 'tools/perf/libperf-in.o' failed
Makefile:68: recipe for target 'all' failed

Maybe caused by commit

  60a1133a5b39 ("tools lib api fs: Remove debugfs, tracefs and findfs objects")

This is an incremental build i.e. I do not do a "make clean" after doing
the build for each tree merge (in case that matters).

I have used the tip tree from next-20150915 for today.

Also, building perf seems to ignore O=<dir> on the make invocation.
Is that expected?

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
