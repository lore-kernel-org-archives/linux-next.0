From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 23 Aug 2017 20:41:59 +1000
Message-ID: <20170823204159.3d706699@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56591 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753728AbdHWKmC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Aug 2017 06:42:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <mawilcox@microsoft.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (mips
defconfig) failed like this:

In file included from include/linux/selection.h:11:0,
                 from drivers/video/console/newport_con.c:16:
include/linux/vt_buffer.h: In function 'scr_memsetw':
include/linux/vt_buffer.h:34:2: error: implicit declaration of function 'memset16' [-Werror=implicit-function-declaration]
include/linux/vt_buffer.h: In function 'scr_memcpyw':
include/linux/vt_buffer.h:47:2: error: implicit declaration of function 'memcpy' [-Werror=implicit-function-declaration]
include/linux/vt_buffer.h: In function 'scr_memmovew':
include/linux/vt_buffer.h:66:2: error: implicit declaration of function 'memmove' [-Werror=implicit-function-declaration]
In file included from include/linux/string.h:18:0,
                 from include/linux/bitmap.h:8,
                 from include/linux/cpumask.h:11,
                 from arch/mips/include/asm/processor.h:15,
                 from arch/mips/include/asm/thread_info.h:15,
                 from include/linux/thread_info.h:37,
                 from include/asm-generic/preempt.h:4,
                 from ./arch/mips/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:80,
                 from include/linux/spinlock.h:50,
                 from include/linux/wait.h:8,
                 from include/linux/wait_bit.h:7,
                 from include/linux/fs.h:5,
                 from include/linux/tty.h:4,
                 from include/linux/vt_kern.h:11,
                 from drivers/video/console/newport_con.c:18:
arch/mips/include/asm/string.h: At top level:
arch/mips/include/asm/string.h:138:14: error: conflicting types for 'memcpy'
include/linux/vt_buffer.h:47:2: note: previous implicit declaration of 'memcpy' was here
arch/mips/include/asm/string.h:141:14: error: conflicting types for 'memmove'
include/linux/vt_buffer.h:66:2: note: previous implicit declaration of 'memmove' was here
In file included from include/linux/bitmap.h:8:0,
                 from include/linux/cpumask.h:11,
                 from arch/mips/include/asm/processor.h:15,
                 from arch/mips/include/asm/thread_info.h:15,
                 from include/linux/thread_info.h:37,
                 from include/asm-generic/preempt.h:4,
                 from ./arch/mips/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:80,
                 from include/linux/spinlock.h:50,
                 from include/linux/wait.h:8,
                 from include/linux/wait_bit.h:7,
                 from include/linux/fs.h:5,
                 from include/linux/tty.h:4,
                 from include/linux/vt_kern.h:11,
                 from drivers/video/console/newport_con.c:18:
include/linux/string.h:104:14: error: conflicting types for 'memset16'
include/linux/vt_buffer.h:34:2: note: previous implicit declaration of 'memset16' was here

Caused by commit

  3cd3d896e663 ("vga: optimise console scrolling")

-- 
Cheers,
Stephen Rothwell
