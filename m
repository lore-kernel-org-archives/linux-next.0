From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree
Date: Fri, 28 Nov 2008 16:03:39 +1100
Message-ID: <20081128160339.23fa014f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50320 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750721AbYK1FEC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 28 Nov 2008 00:04:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Divy Le Ray <divy@chelsio.com>, "David S. Miller" <davem@davemloft.net>, Jaswinder Singh <jaswinder@infradead.org>

Hi David,

Today's linux-next merge of the firmware tree got conflicts in
firmware/Makefile and firmware/WHENCE between commit
ad58633c8381e88b54055771877726d3d5d24734 ("cxgb3: integrate FW and
protocol engines in the kernel") from the net tree and various commits
from the firmware tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix.

Is it time that some of these went to their respective maintainers?
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc firmware/Makefile
index 4993a4b,ac55853..0000000
--- a/firmware/Makefile
+++ b/firmware/Makefile
@@@ -24,10 -33,15 +33,18 @@@ fw-shipped-$(CONFIG_ATARI_DSP56K) += ds
  fw-shipped-$(CONFIG_ATM_AMBASSADOR) += atmsar11.fw
  fw-shipped-$(CONFIG_CASSINI) += sun/cassini.bin
  fw-shipped-$(CONFIG_COMPUTONE) += intelliport2.bin
 +fw-shipped-$(CONFIG_CHELSIO_T3) += cxgb3/t3b_psram-1.1.0.bin \
 +				   cxgb3/t3c_psram-1.1.0.bin \
 +				   cxgb3/t3fw-7.0.0.bin
+ fw-shipped-$(CONFIG_DVB_AV7110) += av7110/bootcode.bin
  fw-shipped-$(CONFIG_DVB_TTUSB_BUDGET) += ttusb-budget/dspbootcode.bin
+ fw-shipped-$(CONFIG_E100) += e100/d101m_ucode.bin e100/d101s_ucode.bin \
+ 			     e100/d102e_ucode.bin
+ fw-shipped-$(CONFIG_SCSI_ADVANSYS) += advansys/mcode.bin advansys/38C1600.bin \
+ 				      advansys/3550.bin advansys/38C0800.bin
+ fw-shipped-$(CONFIG_SCSI_QLOGIC_1280) += qlogic/1040.bin qlogic/1280.bin \
+ 					 qlogic/12160.bin
+ fw-shipped-$(CONFIG_SCSI_QLOGICPTI) += qlogic/isp1000.bin
  fw-shipped-$(CONFIG_SMCTR) += tr_smctr.bin
  fw-shipped-$(CONFIG_SND_KORG1212) += korg/k1212.dsp
  fw-shipped-$(CONFIG_SND_MAESTRO3) += ess/maestro3_assp_kernel.fw \
diff --cc firmware/WHENCE
index 8f06639,cfab534..0000000
--- a/firmware/WHENCE
+++ b/firmware/WHENCE
@@@ -350,13 -350,123 +350,133 @@@ Found in hex form in kernel source
  
  --------------------------------------------------------------------------
  
 +Driver: cxgb3 - Chelsio Terminator 3 1G/10G Ethernet adapter
 +
 +File: cxgb3/t3b_psram-1.1.0.bin.ihex
 +File: cxgb3/t3c_psram-1.1.0.bin.ihex
 +file: cxgb3/t3fw-7.0.0.bin.ihex
 +
 +License: GPLv2 or OpenIB.org BSD license, no source visible
 +
 +--------------------------------------------------------------------------
 +
+ Driver: e100 -- Intel PRO/100 Ethernet NIC
+ 
+ File: e100/d101m_ucode.bin
+ File: e100/d101s_ucode.bin
+ File: e100/d102e_ucode.bin
+ 
+ Licence: Unknown
+ 
+ Found in hex form in kernel source.
+ 
+ --------------------------------------------------------------------------
+ 
+ Driver: acenic -- Alteon AceNIC Gigabit Ethernet card
+ 
+ File: acenic/tg1.bin
+ File: acenic/tg2.bin
+ 
+ Licence: Unknown
+ 
+ Found in hex form in kernel source, but source allegedly available at
+ http://alteon.shareable.org/
+ 
+ --------------------------------------------------------------------------
+ 
+ Driver: tigon3 -- Broadcom Tigon3 based gigabit Ethernet cards
+ 
+ File: tigon/tg3.bin
+ File: tigon/tg3_tso.bin
+ File: tigon/tg3_tso5.bin
+ 
+ Licence:
+  * Firmware is:
+  *	Derived from proprietary unpublished source code,
+  *	Copyright (C) 2000-2003 Broadcom Corporation.
+  *
+  *	Permission is hereby granted for the distribution of this firmware
+  *	data in hexadecimal or equivalent format, provided this copyright
+  *	notice is accompanying it.
+ 
+ Found in hex form in kernel source.
+ 
+ --------------------------------------------------------------------------
+ 
+ Driver: DVB AV7110 -- AV7110 cards
+ 
+ File: av7110/bootcode.bin
+ 
+ Licence: GPLv2 or later
+ 
+ ARM assembly source code available at http://www.linuxtv.org/downloads/firmware/Boot.S
+ 
+ --------------------------------------------------------------------------
+ 
+ Driver: SCSI_QLOGIC_1280 - Qlogic QLA 1240/1x80/1x160 SCSI support
+ 
+ File: qlogic/1040.bin
+ File: qlogic/1280.bin
+ File: qlogic/12160.bin
+ 
+ Licence: Allegedly GPLv2+, but no source visible. Marked:
+ 
+                    QLOGIC LINUX SOFTWARE
+   QLogic ISP1280/ device driver for Linux 2.2.x and 2.4.x
+   Copyright (C) 2001 Qlogic Corporation (www.qlogic.com)
+ 
+ --------------------------------------------------------------------------
+ 
+ Driver: SCSI_ADVANSYS - AdvanSys SCSI
+ 
+ File: advansys/mcode.bin
+ File: advansys/3550.bin
+ File: advansys/38C0800.bin
+ File: advansys/38C1600.bin
+ 
+ Licence: Allegedly GPLv2+, but no source visible.
+ 
+ Found in hex form in kernel source.
+ 
+ --------------------------------------------------------------------------
+ 
+ Driver: SCSI_QLOGICPTI - PTI Qlogic, ISP Driver
+ 
+ File: qlogic/isp1000.bin
+ 
+ Licence: Unknown
+ 
+ Found in hex form in kernel source.
+ 
+ --------------------------------------------------------------------------
+ 
+ Driver: ADAPTEC_STARFIRE - Adaptec Starfire/DuraLAN support
+ 
+ File: adaptec/starfire_rx.bin
+ File: adaptec/starfire_tx.bin
+ 
+ Licence: Allegedly GPLv2, but no source visible.
+ 
+ Found in hex form in kernel source, with the following notice:
+ 
+  BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE IT IS LICENSED "AS IS" AND
+  THERE IS NO WARRANTY FOR THE PROGRAM, INCLUDING BUT NOT LIMITED TO THE
+  IMPLIED WARRANTIES OF MERCHANTIBILITY OR FITNESS FOR A PARTICULAR PURPOSE
+  (TO THE EXTENT PERMITTED BY APPLICABLE LAW). USE OF THE PROGRAM IS AT YOUR
+  OWN RISK. IN NO EVENT WILL ADAPTEC OR ITS LICENSORS BE LIABLE TO YOU FOR
+  DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
+  ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM.
+ 
+ --------------------------------------------------------------------------
+ 
+ Driver: wavefront - ISA WaveFront sound card
+ 
+ File: yamaha/yss225_registers.bin
+ 
+ Licence: Allegedly GPLv2+, but no source visible.
+ 
+ Found in hex form in kernel source, with the following comment:
+    Copyright (c) 1998-2002 by Paul Davis <pbd@op.net>
+ 
+ 
+ --------------------------------------------------------------------------
