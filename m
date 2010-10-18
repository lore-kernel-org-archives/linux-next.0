From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the mips tree
Date: Mon, 18 Oct 2010 17:06:19 +1100
Message-ID: <20101018170619.25f6566f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44878 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751343Ab0JRGG0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Oct 2010 02:06:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anatolij Gustschin <agust@denx.de>, David Daney <ddaney@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/usb/host/Kconfig between commit
cd97084c3aff6f1037e00ee711a872719b60441d ("USB: Add EHCI and OHCH glue
for OCTEON II SOCs") from the mips tree and commit
c67a807cb13570bfc7b78f53158d14a433c59591 ("USB: add USB EHCI support for
MPC5121 SoC") from the usb tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/usb/host/Kconfig
index a03d688,bf2e7d2..0000000
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@@ -93,7 -93,8 +93,8 @@@ config USB_EHCI_TT_NEWSCHE
  
  config USB_EHCI_BIG_ENDIAN_MMIO
  	bool
- 	depends on USB_EHCI_HCD && (PPC_CELLEB || PPC_PS3 || 440EPX || ARCH_IXP4XX || XPS_USB_HCD_XILINX || CPU_CAVIUM_OCTEON)
+ 	depends on USB_EHCI_HCD && (PPC_CELLEB || PPC_PS3 || 440EPX || ARCH_IXP4XX || \
 -				    XPS_USB_HCD_XILINX || PPC_MPC512x)
++				    XPS_USB_HCD_XILINX || PPC_MPC512x || CPU_CAVIUM_OCTEON)
  	default y
  
  config USB_EHCI_BIG_ENDIAN_DESC
