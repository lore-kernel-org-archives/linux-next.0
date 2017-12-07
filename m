From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the printk tree
Date: Thu, 7 Dec 2017 11:37:07 +1100
Message-ID: <20171207113707.0ce273dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40897 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751718AbdLGAhK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Dec 2017 19:37:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>

Hi Petr,

After merging the printk tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/ftrace.h:11:0,
                 from include/linux/perf_event.h:48,
                 from include/linux/trace_events.h:10,
                 from include/trace/syscall.h:7,
                 from include/linux/syscalls.h:82,
                 from init/do_mounts.h:5,
                 from init/do_mounts_initrd.c:22:
include/linux/kallsyms.h: In function 'dereference_symbol_descriptor':
include/linux/kallsyms.h:63:8: error: implicit declaration of function '__module_address' [-Werror=implicit-function-declaration]
  mod = __module_address((unsigned long)ptr);
        ^
include/linux/kallsyms.h:67:9: error: implicit declaration of function 'dereference_module_function_descriptor' [-Werror=implicit-function-declaration]
   ptr = dereference_module_function_descriptor(mod, ptr);
         ^

and many more ...

Caused by commit

  78675fe41d57 ("symbol lookup: introduce dereference_symbol_descriptor()")

I have used the printk tree from next-20171206 (with its version of the
above patch reverted due to yesterday's error) for today.

-- 
Cheers,
Stephen Rothwell
