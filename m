From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next build poblems
Date: Mon, 23 Jun 2008 22:21:56 +0200
Message-ID: <20080623202156.GA12027@uranus.ravnborg.org>
References: <20080624022232.5c81519c.sfr@canb.auug.org.au> <20080623171023.GA16238@flint.arm.linux.org.uk> <20080623200702.GC8573@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:38379 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754581AbYFWUVL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 16:21:11 -0400
Content-Disposition: inline
In-Reply-To: <20080623200702.GC8573@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Paul Mundt <lethal@linux-sh.org>, linux-next@vger.kernel.org

> 
> I need to work out something.
> But my first attemps failed miserably and I will stop for now
> as I have some day-time job stuff to be done.
> Travelling for a few days from now one so I cannot do anything
> until the weekend.
I came up with the following fix.
And I fixed an arm tool chain for my box so I could check it.

We can now build an arm kernel (or at least the first steps).

I have pushed it out to kbuild-next.git.
And I will redo the patch series later so we do not bisect break arm etc.

	Sam

diff --git a/Makefile b/Makefile
index 2628295..4761b3b 100644
--- a/Makefile
+++ b/Makefile
@@ -328,7 +328,8 @@ AFLAGS_KERNEL	=
 # Use LINUXINCLUDE when you must reference the include/ directory.
 # Needed to be compatible with the O= option
 LINUXINCLUDE    := -Iinclude \
-                   $(if $(KBUILD_SRC),-Iinclude2 -I$(srctree)/include) \
+                   $(if $(KBUILD_SRC),                                 \
+                        -Iinclude2 -Iinclude3 -I$(srctree)/include)    \
                    -I$(srctree)/arch/$(hdr-arch)/include               \
                    -include include/linux/autoconf.h
 
@@ -913,6 +914,7 @@ PHONY += prepare archprepare prepare0 prepare1 prepare2 prepare3
 # and if so do:
 # 1) Check that make has not been executed in the kernel src $(srctree)
 # 2) Create the include2 directory, used for the second asm symlink
+# 3) Create the include3 directory, used for the third asm symlink
 prepare3: include/config/kernel.release
 ifneq ($(KBUILD_SRC),)
 	@echo '  Using $(srctree) as source for kernel'
@@ -925,6 +927,10 @@ ifneq ($(KBUILD_SRC),)
 	$(Q)if [ -e $(srctree)/include/asm-$(SRCARCH)/system.h ]; then  \
 	    ln -fsn $(srctree)/include/asm-$(SRCARCH) include2/asm;     \
 	    fi
+	$(Q)if [ ! -d include3 ]; then mkdir -p include3; fi;
+	$(Q)if [ -e $(srctree)/include/asm-$(SRCARCH)/system.h ]; then  \
+	    ln -fsn ../include/asm-$(SRCARCH) include3/asm;                \
+	    fi
 endif
 
 # prepare2 creates a makefile if using a separate output directory
