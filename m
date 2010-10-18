From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the mips tree
Date: Mon, 18 Oct 2010 17:09:11 +1100
Message-ID: <20101018170911.63f76c60.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53741 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751885Ab0JRGJO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Oct 2010 02:09:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Daney <ddaney@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>, Anatolij Gustschin <agust@denx.de>

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/usb/host/Makefile between commit
cd97084c3aff6f1037e00ee711a872719b60441d ("USB: Add EHCI and OHCH glue
for OCTEON II SOCs") from the mips tree and commit
f668f1e9868f9bc1bed3d5df1701879ac89cc3ed ("USB: add platform glue driver
for FSL USB DR controller") from the usb tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/usb/host/Makefile
index 36099ce,91c5a1b..0000000
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@@ -33,5 -33,4 +33,5 @@@ obj-$(CONFIG_USB_R8A66597_HCD)	+= r8a66
  obj-$(CONFIG_USB_ISP1760_HCD)	+= isp1760.o
  obj-$(CONFIG_USB_HWA_HCD)	+= hwa-hc.o
  obj-$(CONFIG_USB_IMX21_HCD)	+= imx21-hcd.o
 +obj-$(CONFIG_USB_OCTEON2_COMMON) += octeon2-common.o
- 
+ obj-$(CONFIG_USB_FSL_MPH_DR_OF)	+= fsl-mph-dr-of.o
