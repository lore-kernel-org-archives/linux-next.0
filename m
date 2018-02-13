From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the scsi-mkp tree
Date: Tue, 13 Feb 2018 14:00:24 +1100
Message-ID: <20180213140024.0fb09872@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35607 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933254AbeBMDA1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Feb 2018 22:00:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hannes Reinecke <hare@suse.de>

Hi Martin,

After merging the scsi-mkp tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

drivers/scsi/myrb.c: In function 'myrb_get_ldev_info':
drivers/scsi/myrb.c:428:10: warning: 'ldev_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
   sdev = scsi_device_lookup(shost, myrb_logical_channel(shost),
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        ldev_num, 0);
        ~~~~~~~~~~~~
drivers/scsi/myrs.c: In function 'myrs_handle_scsi':
drivers/scsi/myrs.c:2175:6: warning: 'status' may be used uninitialized in this function [-Wmaybe-uninitialized]
   if (status == DAC960_V2_AbnormalCompletion &&
      ^
drivers/scsi/myrs.c: In function 'myrs_log_event':
drivers/scsi/myrs.c:988:21: warning: 'cmd_specific' may be used uninitialized in this function [-Wmaybe-uninitialized]
         cmd_specific[0], cmd_specific[1],
                     ^
drivers/scsi/myrs.c:986:19: warning: 'sense_info' may be used uninitialized in this function [-Wmaybe-uninitialized]
         sense_info[0], sense_info[1],
                   ^

Introduced by commits

  dd47c1072226 ("scsi: myrb: Add Mylex RAID controller (block interface)")
  8a8606895947 ("scsi: myrs: Add Mylex RAID controller (SCSI interface)")

-- 
Cheers,
Stephen Rothwell
