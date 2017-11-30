From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Thu, 30 Nov 2017 12:51:21 +1100
Message-ID: <20171130125121.7d16ef43@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34039 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752895AbdK3BvX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Nov 2017 20:51:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ching Huang <ching2048@areca.com.tw>, Kees Cook <keescook@chromium.org>

Hi Martin,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/arcmsr/arcmsr_hba.c

between commits:

  b9eaf1872222 ("treewide: init_timer() -> setup_timer()")
  e99e88a9d2b0 ("treewide: setup_timer() -> timer_setup()")

from Linus' tree and commits:

  ee09098d4769 ("scsi: arcmsr: add a function arcmsr_set_iop_datetime and driver option set_date_time to set date and time to firmware")
  1b19ea2998c4 ("scsi: arcmsr: spin off duplicate code of timer init for message isr BH in arcmsr_probe and arcmsr_resume as a function")

from the scsi-mkp tree.

I fixed it up (I think I gto it right - see below) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/arcmsr/arcmsr_hba.c
index 21f6421536a0,2aec32ff8109..000000000000
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@@ -755,6 -857,28 +857,24 @@@ out_free_irq
  	return FAILED;
  }
  
+ static void arcmsr_init_get_devmap_timer(struct AdapterControlBlock *pacb)
+ {
+ 	INIT_WORK(&pacb->arcmsr_do_message_isr_bh, arcmsr_message_isr_bh_fn);
+ 	atomic_set(&pacb->rq_map_token, 16);
+ 	atomic_set(&pacb->ante_token_value, 16);
+ 	pacb->fw_flag = FW_NORMAL;
 -	init_timer(&pacb->eternal_timer);
++	timer_setup(&pacb->eternal_timer, arcmsr_request_device_map, 0);
+ 	pacb->eternal_timer.expires = jiffies + msecs_to_jiffies(6 * HZ);
 -	pacb->eternal_timer.data = (unsigned long)pacb;
 -	pacb->eternal_timer.function = &arcmsr_request_device_map;
+ 	add_timer(&pacb->eternal_timer);
+ }
+ 
+ static void arcmsr_init_set_datetime_timer(struct AdapterControlBlock *pacb)
+ {
 -	init_timer(&pacb->refresh_timer);
++	timer_setup(&pacb->eternal_timer, arcmsr_request_device_map, 0);
+ 	pacb->refresh_timer.expires = jiffies + msecs_to_jiffies(60 * 1000);
 -	pacb->refresh_timer.data = (unsigned long)pacb;
 -	pacb->refresh_timer.function = &arcmsr_set_iop_datetime;
+ 	add_timer(&pacb->refresh_timer);
+ }
+ 
  static int arcmsr_probe(struct pci_dev *pdev, const struct pci_device_id *id)
  {
  	struct Scsi_Host *host;
