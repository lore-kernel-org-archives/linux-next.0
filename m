From: David Woodhouse <david.woodhouse@intel.com>
Subject: Re: linux-next: Tree for June 26
Date: Fri, 27 Jun 2008 11:51:53 +0100
Message-ID: <1214563913.10393.180.camel@pmac.infradead.org>
References: <20080627010842.e1a0c4b5.sfr@canb.auug.org.au>
	 <200806270138.53895.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:62152 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752586AbYF0Kv6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 06:51:58 -0400
In-Reply-To: <200806270138.53895.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, kernel-testers@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Jaswinder Singh <jaswinder@infradead.org>, "Maciej W. Rozycki" <macro@linux-mips.org>

On Fri, 2008-06-27 at 01:38 +0200, Rafael J. Wysocki wrote:
> commit 423c982fffb1cd95c8cdd654ce5ab59351ba41f5
> Author: Jaswinder Singh <jaswinder@infradead.org>
> Date:   Wed Jun 18 19:58:33 2008 +0530
> 
>     firmware: convert tg3 driver to request_firmware()
> 
> breaks my nx6325.
> 
> Apparently, with this patch applied the tg3 has a NULL pointer dereference
> somewhere, but I can only see the first line of the oops, afterwards the box
> hangs solid.

That's a 5705, isn't it? So using the 'tso5' firmware?

Is that firmware available (did you either build it into your kernel, or
run 'make INSTALL_FW_PATH=/lib/firmware firmware_install')? 

Not that it matters; I suspect the driver isn't trying to load it at
all. Can you test this patch, please?

(There are more cleanups I want to do to the error paths here, but those
should be harmless and irrelevant: http://david.woodhou.se/tg3.patch )

diff --git a/drivers/net/tg3.c b/drivers/net/tg3.c
index a70147d..bad784b 100644
--- a/drivers/net/tg3.c
+++ b/drivers/net/tg3.c
@@ -12234,11 +12234,6 @@ static int __devinit tg3_init_one(struct pci_dev *pdev,
 
 	if (tp->tg3_flags2 & TG3_FLG2_HW_TSO) {
 		tp->tg3_flags2 |= TG3_FLG2_TSO_CAPABLE;
-
-		if (GET_ASIC_REV(tp->pci_chip_rev_id) == ASIC_REV_5705)
-			fw_name = "tigon/tg3_tso5.bin";
-		else
-			fw_name = "tigon/tg3_tso.bin";
 	}
 	else if (GET_ASIC_REV(tp->pci_chip_rev_id) == ASIC_REV_5700 ||
 	    GET_ASIC_REV(tp->pci_chip_rev_id) == ASIC_REV_5701 ||
@@ -12248,6 +12243,13 @@ static int __devinit tg3_init_one(struct pci_dev *pdev,
 		tp->tg3_flags2 &= ~TG3_FLG2_TSO_CAPABLE;
 	} else {
 		tp->tg3_flags2 |= TG3_FLG2_TSO_CAPABLE | TG3_FLG2_TSO_BUG;
+		printk("this code path would have forgotten to load the firmware\n");
+	}
+	if (tp->tg3_flags2 & TG3_FLG2_TSO_CAPABLE) {
+		if (GET_ASIC_REV(tp->pci_chip_rev_id) == ASIC_REV_5705)
+			fw_name = "tigon/tg3_tso5.bin";
+		else
+			fw_name = "tigon/tg3_tso.bin";
 	}
 
 	if (fw_name) {


-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation



---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
