From: <gregkh@linuxfoundation.org>
Subject: Patch "objtool: Fix cross-build" has been added to the 4.14-stable tree
Date: Wed, 27 Dec 2017 13:57:47 +0100
Message-ID: <151437946724245@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: jpoimboe@redhat.com, gregkh@linuxfoundation.org, linux-next@vger.kernel.org, mingo@kernel.org, peterz@infradead.org, sfr@canb.auug.org.au, tglx@linutronix.de, torvalds@linux-foundation.org
Cc: stable@vger.kernel.org, stable-commits@vger.kernel.org
List-Id: linux-next.vger.kernel.org


This is a note to let you know that I've just added the patch titled

    objtool: Fix cross-build

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     objtool-fix-cross-build.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From 9eb719855f6c9b21eb5889d9ac2ca1c60527ad89 Mon Sep 17 00:00:00 2001
From: Josh Poimboeuf <jpoimboe@redhat.com>
Date: Tue, 7 Nov 2017 21:01:52 -0600
Subject: objtool: Fix cross-build

From: Josh Poimboeuf <jpoimboe@redhat.com>

commit 9eb719855f6c9b21eb5889d9ac2ca1c60527ad89 upstream.

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 tools/objtool/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


Patches currently in stable-queue which might be from jpoimboe@redhat.com are

queue-4.14/x86-decoder-fix-and-update-the-opcodes-map.patch
queue-4.14/tools-headers-sync-objtool-uapi-header.patch
queue-4.14/objtool-fix-64-bit-build-on-32-bit-host.patch
queue-4.14/objtool-move-synced-files-to-their-original-relative-locations.patch
queue-4.14/objtool-move-kernel-headers-code-sync-check-to-a-script.patch
queue-4.14/objtool-fix-cross-build.patch
