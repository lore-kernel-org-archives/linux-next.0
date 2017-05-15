From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Mon, 15 May 2017 11:56:02 +1000
Message-ID: <20170515115602.30e05989@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54269 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753783AbdEOB4F (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 May 2017 21:56:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xunlei Pang <xlpang@redhat.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/asm-generic/bug.h:15:0,
                 from arch/arm/include/asm/bug.h:59,
                 from include/linux/bug.h:4,
                 from include/linux/elfcore.h:5,
                 from include/linux/crash_core.h:5,
                 from kernel/crash_core.c:9:
kernel/crash_core.c: In function 'vmcoreinfo_append_str':
include/linux/kernel.h:757:16: warning: comparison of distinct pointer types lacks a cast
  (void) (&min1 == &min2);   \
                ^
include/linux/kernel.h:760:2: note: in expansion of macro '__min'
  __min(typeof(x), typeof(y),   \
  ^
kernel/crash_core.c:360:6: note: in expansion of macro 'min'
  r = min(r, VMCOREINFO_BYTES - vmcoreinfo_size);
      ^

Introduced by commit

  fc7d2b44367f ("powerpc/fadump: use the correct VMCOREINFO_NOTE_SIZE for phdr")

-- 
Cheers,
Stephen Rothwell
