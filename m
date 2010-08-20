From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (input tree
 related)
Date: Fri, 20 Aug 2010 13:12:24 +1000
Message-ID: <20100820131224.02f7cb9f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jason Wessel <jason.wessel@windriver.com>, Greg Kroah-Hartman <gregkh@suse.de>
List-Id: linux-next.vger.kernel.org

Hi Dmitry,

After merging the final tree, today's linux-next build (i386 defconfig)
failed like this:

In file included from drivers/gpu/drm/i915/i915_irq.c:29:
include/linux/sysrq.h:45: error: expected declaration specifiers or '...' before 'bool'

Caused by commit a821bafce37b26499e2bfbf2e6b96b0636efc014 ("Input: sysrq
- drop tty argument form handle_sysrq()") from the input tree which
(despite not mentioning this) changed an "int" argument to "bool" but
neglected to include linux/types.h.

I added this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 20 Aug 2010 13:06:30 +1000
Subject: [PATCH] input: using bool in sysrq.h requires including types.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/sysrq.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/sysrq.h b/include/linux/sysrq.h
index 32d360a..387fa7d 100644
--- a/include/linux/sysrq.h
+++ b/include/linux/sysrq.h
@@ -15,6 +15,7 @@
 #define _LINUX_SYSRQ_H
 
 #include <linux/errno.h>
+#include <linux/types.h>
 
 /* Possible values of bitmask for enabling sysrq functions */
 /* 0x0001 is reserved for enable everything */
-- 
1.7.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
