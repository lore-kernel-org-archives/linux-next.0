From: Brian King <brking@linux.vnet.ibm.com>
Subject: [PATCH 2/2] scsi: Preserve retry counter through scsi_prep_fn
Date: Mon, 21 Aug 2017 17:14:00 -0500
Message-ID: <e24506f3-e333-16b9-a8c9-5d25f3c19ccf@linux.vnet.ibm.com>
References: <1502902815.3305.22.camel@abdul.in.ibm.com>
 <1502904072.2421.3.camel@wdc.com>
 <2f686064-3e32-df8d-134f-962b5181da9d@linux.vnet.ibm.com>
 <1502985161.2615.8.camel@wdc.com>
 <71fb9c1b-9f3f-acdc-8bb5-aa1240aea763@linux.vnet.ibm.com>
 <1503092473.2622.17.camel@wdc.com>
 <0f7e2114-eba1-f149-ea80-d32d8b6d212a@linux.vnet.ibm.com>
 <1503094414.2622.21.camel@wdc.com>
 <f4ec8576-f4d7-4be3-0f38-c1a9d7ef4251@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <f4ec8576-f4d7-4be3-0f38-c1a9d7ef4251@linux.vnet.ibm.com>
Content-Language: en-US
Sender: linux-scsi-owner@vger.kernel.org
To: Bart Van Assche <Bart.VanAssche@wdc.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hch@lst.de" <hch@lst.de>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "sachinp@linux.vnet.ibm.com" <sachinp@linux.vnet.ibm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "hare@suse.com" <hare@suse.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
List-Id: linux-next.vger.kernel.org

Save / restore the retry counter in scsi_cmd in scsi_init_command.
This allows us to go back through scsi_init_command for retries
and not forget we are doing a retry.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---

Index: linux-2.6.git/drivers/scsi/scsi_lib.c
===================================================================
--- linux-2.6.git.orig/drivers/scsi/scsi_lib.c
+++ linux-2.6.git/drivers/scsi/scsi_lib.c
@@ -1155,6 +1155,7 @@ void scsi_init_command(struct scsi_devic
 	void *prot = cmd->prot_sdb;
 	unsigned int unchecked_isa_dma = cmd->flags & SCMD_UNCHECKED_ISA_DMA;
 	unsigned long jiffies_at_alloc = cmd->jiffies_at_alloc;
+	int retries = cmd->retries;
 
 	/* zero out the cmd, except for the embedded scsi_request */
 	memset((char *)cmd + sizeof(cmd->req), 0,
@@ -1166,6 +1167,7 @@ void scsi_init_command(struct scsi_devic
 	cmd->flags = unchecked_isa_dma;
 	INIT_DELAYED_WORK(&cmd->abort_work, scmd_eh_abort_handler);
 	cmd->jiffies_at_alloc = jiffies_at_alloc;
+	cmd->retries = retries;
 
 	scsi_add_cmd_to_list(cmd);
 }
