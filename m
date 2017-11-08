From: tip-bot for Josh Poimboeuf <tipbot@zytor.com>
Subject: [tip:core/objtool] objtool: Fix cross-build
Date: Wed, 8 Nov 2017 01:10:13 -0800
Message-ID: <tip-9eb719855f6c9b21eb5889d9ac2ca1c60527ad89@git.kernel.org>
References: <20171108030152.bd76eahiwjwjt3kp@treble>
Reply-To: linux-kernel@vger.kernel.org, hpa@zytor.com, tglx@linutronix.de,
          torvalds@linux-foundation.org, linux-next@vger.kernel.org,
          jpoimboe@redhat.com, peterz@infradead.org, sfr@canb.auug.org.au,
          mingo@kernel.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([65.50.211.136]:56015 "EHLO
        terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750777AbdKHJPj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Nov 2017 04:15:39 -0500
In-Reply-To: <20171108030152.bd76eahiwjwjt3kp@treble>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-tip-commits@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, torvalds@linux-foundation.org, linux-next@vger.kernel.org, jpoimboe@redhat.com, hpa@zytor.com, sfr@canb.auug.org.au, mingo@kernel.org, peterz@infradead.org

Commit-ID:  9eb719855f6c9b21eb5889d9ac2ca1c60527ad89
Gitweb:     https://git.kernel.org/tip/9eb719855f6c9b21eb5889d9ac2ca1c60527ad89
Author:     Josh Poimboeuf <jpoimboe@redhat.com>
AuthorDate: Tue, 7 Nov 2017 21:01:52 -0600
Committer:  Ingo Molnar <mingo@kernel.org>
CommitDate: Wed, 8 Nov 2017 10:06:08 +0100

objtool: Fix cross-build

Stephen Rothwell reported this cross-compilation build failure:

| In file included from orc_dump.c:19:0:
| orc.h:21:10: fatal error: asm/orc_types.h: No such file or directory
| ...

Caused by:

  6a77cff819ae ("objtool: Move synced files to their original relative locations")

Use the proper arch header files location, not the host-arch location.

Bisected-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Link: http://lkml.kernel.org/r/20171108030152.bd76eahiwjwjt3kp@treble
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 tools/objtool/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 6aaed25..0f94af3 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -27,7 +27,7 @@ all: $(OBJTOOL)
 
 INCLUDES := -I$(srctree)/tools/include \
 	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
-	    -I$(srctree)/tools/objtool/arch/$(HOSTARCH)/include
+	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include
 WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed
 CFLAGS   += -Wall -Werror $(WARNINGS) -fomit-frame-pointer -O2 -g $(INCLUDES)
 LDFLAGS  += -lelf $(LIBSUBCMD)
