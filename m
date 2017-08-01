From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Tue, 1 Aug 2017 16:25:11 +1000
Message-ID: <20170801162511.39fa58ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from arch/powerpc/include/asm/paca.h:19:0,
                 from arch/powerpc/include/asm/hw_irq.h:42,
                 from arch/powerpc/include/asm/irqflags.h:11,
                 from include/linux/irqflags.h:15,
                 from include/linux/spinlock.h:53,
                 from include/linux/wait.h:8,
                 from include/linux/wait_bit.h:7,
                 from include/linux/fs.h:5,
                 from include/linux/buffer_head.h:11,
                 from fs/adfs/dir_f.c:12:
In function 'memcpy',
    inlined from '__adfs_dir_put' at fs/adfs/dir_f.c:318:2,
    inlined from 'adfs_f_update' at fs/adfs/dir_f.c:403:2:
include/linux/string.h:305:4: error: call to '__read_overflow2' declared with attribute error: detected read beyond size of object passed as 2nd parameter
    __read_overflow2();
    ^

I don't know why this has turned up now.  I have just left it broken
for now and would appreciate any fix.

-- 
Cheers,
Stephen Rothwell
