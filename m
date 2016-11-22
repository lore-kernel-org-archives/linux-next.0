From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the scsi tree
Date: Tue, 22 Nov 2016 18:44:04 +1100
Message-ID: <20161122184404.2fdd253d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48093 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755028AbcKVHoG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 02:44:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>, "Martin K. Petersen" <martin.petersen@oracle.com>

Hi James,

After merging the scsi tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/scsi/hpsa.c: In function 'hpsa_slave_alloc':
drivers/scsi/hpsa.c:2033:5: warning: 'sd' may be used uninitialized in this function [-Wmaybe-uninitialized]
  if (!sd)
     ^

Introduced by commit

  4eb307f7b18d ("scsi: hpsa: use bus '3' for legacy HBA devices")

-- 
Cheers,
Stephen Rothwell
