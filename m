From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Wed, 7 Dec 2016 12:37:11 +1100
Message-ID: <20161207123711.795d97bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43699 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751064AbcLGBhN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Dec 2016 20:37:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

After merging the tip tree, today's linux-next build (powerpc64le perf)
failed like this:

  LINK     /home/sfr/next/perf/fixdep
/bin/sh: 1: /home/sfr/next/perf//fixdep: Permission denied
tools/build/Makefile.build:91: recipe for target '/home/sfr/next/perf/pmu-events/jevents.o' failed

$ ls -l /home/sfr/next/perf/fixdep
-rwxr-xr-x 1 sfr users 71104 Dec  7 12:26 /home/sfr/next/perf/fixdep

I am not sure what caused this, but redoing the build succeeded, so I
have just filed this report and left it for today.

-- 
Cheers,
Stephen Rothwell
