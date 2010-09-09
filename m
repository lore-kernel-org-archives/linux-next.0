From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the catalin tree with the arm tree
Date: Thu, 9 Sep 2010 11:41:44 +1000
Message-ID: <20100909114144.aa76efdb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47249 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754993Ab0IIBlw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Sep 2010 21:41:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Russell King <rmk@arm.linux.org.uk>, Leif Lindholm <leif.lindholm@arm.com>

Hi Catalin,

Today's linux-next merge of the catalin tree got a conflict in
arch/arm/kernel/Makefile between commit
19852e59002fbba1c2c6ba0f154095a37ad2ac03 ("ARM: 6358/1: hw-breakpoint:
add HAVE_HW_BREAKPOINT to Kconfig") from the arm tree and commit
028543791a6c0652949046218da16ad0f744c158 ("ARM: Add SWP/SWPB emulation
for ARMv7 processors (v5)") from the catalin tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/kernel/Makefile
index 5b9b268,d3430ee..0000000
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@@ -42,7 -42,7 +42,8 @@@ obj-$(CONFIG_KGDB)		+= kgdb.
  obj-$(CONFIG_ARM_UNWIND)	+= unwind.o
  obj-$(CONFIG_HAVE_TCM)		+= tcm.o
  obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 +obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
+ obj-$(CONFIG_SWP_EMULATE)	+= swp_emulate.o
  
  obj-$(CONFIG_CRUNCH)		+= crunch.o crunch-bits.o
  AFLAGS_crunch-bits.o		:= -Wa,-mcpu=ep9312
