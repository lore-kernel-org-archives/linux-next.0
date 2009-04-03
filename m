From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi tree with the net-current tree
Date: Fri, 3 Apr 2009 11:51:28 +1100
Message-ID: <20090403115128.ccd59202.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35282 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753357AbZDCAvd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Apr 2009 20:51:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, Jaswinder Singh Rajput <jaswinderrajput@gmail.com>, "David S. Miller" <davem@davemloft.net>

Hi James,

Today's linux-next merge of the scsi tree got a conflict in
firmware/Makefile between commit 75bf758f906315820cada99c169bd89bab3f4ba2
("smc91c92_cs: use request_firmware") from the net-current tree and
commits fa8bed9af023e5b5796d74e3f32dd0a50eb61a1b ("[SCSI] qla1280: use
request_firmware") and ba82e358035ce3014820e07c8bb569eba99c2979 ("[SCSI]
advansys: use request_firmware") from the scsi tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc firmware/Makefile
index baf5ae4,f1ac341..0000000
--- a/firmware/Makefile
+++ b/firmware/Makefile
@@@ -40,7 -39,10 +40,11 @@@ fw-shipped-$(CONFIG_CHELSIO_T3) += cxgb
  fw-shipped-$(CONFIG_DVB_TTUSB_BUDGET) += ttusb-budget/dspbootcode.bin
  fw-shipped-$(CONFIG_E100) += e100/d101m_ucode.bin e100/d101s_ucode.bin \
  			     e100/d102e_ucode.bin
 +fw-shipped-$(CONFIG_PCMCIA_SMC91C92) += ositech/Xilinx7OD.bin
+ fw-shipped-$(CONFIG_SCSI_ADVANSYS) += advansys/mcode.bin advansys/38C1600.bin \
+ 				      advansys/3550.bin advansys/38C0800.bin
+ fw-shipped-$(CONFIG_SCSI_QLOGIC_1280) += qlogic/1040.bin qlogic/1280.bin \
+ 					 qlogic/12160.bin
  fw-shipped-$(CONFIG_SMCTR) += tr_smctr.bin
  fw-shipped-$(CONFIG_SND_KORG1212) += korg/k1212.dsp
  fw-shipped-$(CONFIG_SND_MAESTRO3) += ess/maestro3_assp_kernel.fw \
