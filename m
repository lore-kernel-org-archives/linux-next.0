From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Wed, 15 Oct 2008 15:23:53 +1100
Message-ID: <20081015152353.8871849b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58040 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751046AbYJOFMC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 01:12:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Bjorn Helgaas <bjorn.helgaas@hp.com>

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
drivers/pnp/Makefile between commit
ed458df4d2470adc02762a87a9ad665d0b1a2bd4 ("PnP: move pnpacpi/pnpbios_init
to after PCI init") from Linus' tree and commit
ac88a8f3f7df04774b386ddaf586040adb819b58 ("PNP: remove old
CONFIG_PNP_DEBUG option") from the acpi tree.

Really just a context problem.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/pnp/Makefile
index e83f34f,a381a92..0000000
--- a/drivers/pnp/Makefile
+++ b/drivers/pnp/Makefile
@@@ -7,10 -7,3 +7,6 @@@ obj-y		:= core.o card.o driver.o resour
  obj-$(CONFIG_PNPACPI)		+= pnpacpi/
  obj-$(CONFIG_PNPBIOS)		+= pnpbios/
  obj-$(CONFIG_ISAPNP)		+= isapnp/
 +
 +# pnp_system_init goes after pnpacpi/pnpbios init
 +obj-y				+= system.o
- 
- ifeq ($(CONFIG_PNP_DEBUG),y)
- EXTRA_CFLAGS += -DDEBUG
- endif
