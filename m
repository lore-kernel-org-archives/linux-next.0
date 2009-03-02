From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree with the  tree
Date: Mon, 2 Mar 2009 14:11:03 +1100
Message-ID: <20090302141103.d1c369d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54716 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752115AbZCBDLJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Mar 2009 22:11:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, "David S. Miller" <davem@davemloft.net>

Hi David,

Today's linux-next merge of the firmware tree got conflicts in
firmware/WHENCE between commits 06e1f9ffa023c030bc87491e75f625f5da4e7d97
("tehuti: Use request_firmware()") and
b775a750c3afacbfac884537d466d34d50b1023b ("typhoon: Use request_firmware
()") from the net tree and various commits from the firmware tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc firmware/WHENCE
index ea4fc2e,25f9bbd..0000000
--- a/firmware/WHENCE
+++ b/firmware/WHENCE
@@@ -436,60 -422,61 +436,119 @@@ Found in hex form in kernel source, wit
  
  --------------------------------------------------------------------------
  
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
 +Driver: TEHUTI - Tehuti Networks 10G Ethernet
 +
 +File: tehuti/bdx.bin
 +
 +Licence:
 +
 + Copyright (C) 2007 Tehuti Networks Ltd.
 +
 + Permission is hereby granted for the distribution of this firmware data
 + in hexadecimal or equivalent format, provided this copyright notice is
 + accompanying it.
 +
 +Found in hex form in kernel source.
 +
 +--------------------------------------------------------------------------
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
 +Driver: TYPHOON - 3cr990 series Typhoon
 +
 +File: 3com/typhoon.bin
 +
 +Licence:
 +/*
 + * Copyright 1999-2004 3Com Corporation.  All Rights Reserved.
 + *
 + * Redistribution and use in source and binary forms of the 3c990img.h
 + * microcode software are permitted provided that the following conditions
 + * are met:
 + * 1. Redistribution of source code must retain the above copyright
 + *    notice, this list of conditions and the following disclaimer.
 + * 2. Redistribution in binary form must reproduce the above copyright
 + *    notice, this list of conditions and the following disclaimer in the
 + *    documentation and/or other materials provided with the distribution.
 + * 3. The name of 3Com may not be used to endorse or promote products
 + *    derived from this software without specific prior written permission
 + *
 + * THIS SOFTWARE IS PROVIDED BY 3COM ``AS IS'' AND ANY EXPRESS OR
 + * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 + * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 + * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 + * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 + * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 + * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 + * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 + * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 + * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 + *
 + * USER ACKNOWLEDGES AND AGREES THAT PURCHASE OR USE OF THE 3c990img.h
 + * MICROCODE SOFTWARE WILL NOT CREATE OR GIVE GROUNDS FOR A LICENSE BY
 + * IMPLICATION, ESTOPPEL, OR OTHERWISE IN ANY INTELLECTUAL PROPERTY RIGHTS
 + * (PATENT, COPYRIGHT, TRADE SECRET, MASK WORK, OR OTHER PROPRIETARY RIGHT)
 + * EMBODIED IN ANY OTHER 3COM HARDWARE OR SOFTWARE EITHER SOLELY OR IN
 + * COMBINATION WITH THE 3c990img.h MICROCODE SOFTWARE
 + */
 +
 +Found in hex form in kernel source.
 +
 +--------------------------------------------------------------------------
++
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
