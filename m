From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Wed, 16 Mar 2011 16:08:42 +1100
Message-ID: <20110316160842.493967db.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53385 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751060Ab1CPFIp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Mar 2011 01:08:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Hi all,

Today's linux-next merge of the tip tree got a conflict in
arch/x86/platform/ce4100/ce4100.c between commit 03150171dcf9 ("x86:
ce4100: Set pci ops via callback instead of module init") from Linus'
tree and commit 1fa4163bdc19 ("x86: ce4100: Use OF to setup devices")
from the tip tree.

I fixed it up (see below) and can carry the fix as necessary.  However, I
have no idea if the final setup of x86_init.pci.init_irq is correct.
Hopefully this will be fixed up in the tip tree before it is sent to
Linus.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/platform/ce4100/ce4100.c
index cd6f184,68c0dbc..0000000
--- a/arch/x86/platform/ce4100/ce4100.c
+++ b/arch/x86/platform/ce4100/ce4100.c
@@@ -15,9 -15,11 +15,12 @@@
  #include <linux/serial_reg.h>
  #include <linux/serial_8250.h>
  
 +#include <asm/ce4100.h>
+ #include <asm/prom.h>
  #include <asm/setup.h>
+ #include <asm/i8259.h>
  #include <asm/io.h>
+ #include <asm/io_apic.h>
  
  static int ce4100_i8042_detect(void)
  {
