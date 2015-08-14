From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with Linus' tree
Date: Fri, 14 Aug 2015 13:56:53 +1000
Message-ID: <20150814135653.4a897b2d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47303 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753347AbbHND44 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Aug 2015 23:56:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/xen/Makefile

between commit:

  fc5fee86bdd3 ("x86/xen: build "Xen PV" APIC driver for domU as well")

from Linus' tree and commit:

  6e3012fba294 ("xen/PMU: Initialization code for Xen PMU")

from the xen-tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/xen/Makefile
index 4b6e29ac0968,071fab5c720e..000000000000
--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@@ -13,7 -13,7 +13,7 @@@ CFLAGS_mmu.o			:= $(nostackp
  obj-y		:= enlighten.o setup.o multicalls.o mmu.o irq.o \
  			time.o xen-asm.o xen-asm_$(BITS).o \
  			grant-table.o suspend.o platform-pci-unplug.o \
- 			p2m.o apic.o
 -			p2m.o pmu.o
++			p2m.o apic.o pmu.o
  
  obj-$(CONFIG_EVENT_TRACING) += trace.o
  
