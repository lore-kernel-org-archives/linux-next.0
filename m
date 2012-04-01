From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 11/11] asm-generic: add linux/types.h to cmpxchg.h
Date: Sun,  1 Apr 2012 16:38:47 -0400
Message-ID: <1333312727-11428-12-git-send-email-paul.gortmaker@windriver.com>
References: <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dhowells@redhat.com
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Arnd Bergmann <arnd@arndb.de>, Jonas Bonn <jonas@southpole.se>
List-Id: linux-next.vger.kernel.org

Builds of the openrisc or1ksim_defconfig show the following:

  In file included from arch/openrisc/include/generated/asm/cmpxchg.h:1:0,
                   from include/asm-generic/atomic.h:18,
                   from arch/openrisc/include/generated/asm/atomic.h:1,
                   from include/linux/atomic.h:4,
                   from include/linux/dcache.h:4,
                   from fs/notify/fsnotify.c:19:
  include/asm-generic/cmpxchg.h: In function '__xchg':
  include/asm-generic/cmpxchg.h:34:20: error: expected ')' before 'u8'
  include/asm-generic/cmpxchg.h:34:20: warning: type defaults to 'int' in type name

and many more lines of similar errors.  It seems specific to the or32
because most other platforms have an arch specific component that would
have already included types.h ahead of time, but the o32 does not.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jonas Bonn <jonas@southpole.se>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 include/asm-generic/cmpxchg.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/asm-generic/cmpxchg.h b/include/asm-generic/cmpxchg.h
index 8a36183..1488302 100644
--- a/include/asm-generic/cmpxchg.h
+++ b/include/asm-generic/cmpxchg.h
@@ -10,6 +10,7 @@
 #error "Cannot use generic cmpxchg on SMP"
 #endif
 
+#include <linux/types.h>
 #include <linux/irqflags.h>
 
 #ifndef xchg
-- 
1.7.9.1
