From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi tree
Date: Mon, 28 Aug 2017 18:02:36 +1000
Message-ID: <20170828180236.6a6cfaf2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54173 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750797AbdH1ICj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Aug 2017 04:02:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hannes Reinecke <hare@suse.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Christoph Hellwig <hch@lst.de>, Johannes Thumshirn <jthumshirn@suse.de>

Hi James,

After merging the scsi tree, today's linux-next build (sparc defconfig)
failed like this:

drivers/scsi/qlogicpti.c:1285:27: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .eh_host_reset_handler = qlogicpti_reset,
                           ^

Caused by commit

  af167bc42d86 ("scsi: qlogicpti: move bus reset to host reset")

I have reverted that commit for today.
-- 
Cheers,
Stephen Rothwell
