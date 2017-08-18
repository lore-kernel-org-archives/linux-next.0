From: Brian King <brking@linux.vnet.ibm.com>
Subject: [PATCH] ipr: Set no_report_opcodes for RAID arrays
Date: Fri, 18 Aug 2017 16:17:32 -0500
Message-ID: <c2272791-2010-600b-3982-835b8eb1a523@linux.vnet.ibm.com>
References: <1502902815.3305.22.camel@abdul.in.ibm.com>
 <1502904072.2421.3.camel@wdc.com>
 <2f686064-3e32-df8d-134f-962b5181da9d@linux.vnet.ibm.com>
 <1502985161.2615.8.camel@wdc.com>
 <71fb9c1b-9f3f-acdc-8bb5-aa1240aea763@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50761 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751867AbdHRVRi (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Aug 2017 17:17:38 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7ILDkeN107985
        for <linux-next@vger.kernel.org>; Fri, 18 Aug 2017 17:17:37 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ce0x0qxdy-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 18 Aug 2017 17:17:37 -0400
Received: from localhost
        by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <brking@linux.vnet.ibm.com>;
        Fri, 18 Aug 2017 15:17:37 -0600
In-Reply-To: <71fb9c1b-9f3f-acdc-8bb5-aa1240aea763@linux.vnet.ibm.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <Bart.VanAssche@wdc.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>
Cc: "sachinp@linux.vnet.ibm.com" <sachinp@linux.vnet.ibm.com>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "hare@suse.com" <hare@suse.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "hch@lst.de" <hch@lst.de>

Since ipr RAID arrays do not support the MAINTENANCE_IN /
MI_REPORT_SUPPORTED_OPERATION_CODES, set no_report_opcodes
to prevent it from being sent.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---

Index: linux-2.6.git/drivers/scsi/ipr.c
===================================================================
--- linux-2.6.git.orig/drivers/scsi/ipr.c
+++ linux-2.6.git/drivers/scsi/ipr.c
@@ -4935,6 +4935,7 @@ static int ipr_slave_configure(struct sc
 		}
 		if (ipr_is_vset_device(res)) {
 			sdev->scsi_level = SCSI_SPC_3;
+			sdev->no_report_opcodes = 1;
 			blk_queue_rq_timeout(sdev->request_queue,
 					     IPR_VSET_RW_TIMEOUT);
 			blk_queue_max_hw_sectors(sdev->request_queue, IPR_VSET_MAX_SECTORS);
