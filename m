From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the scsi-mkp tree
Date: Mon, 14 Nov 2016 16:16:24 +1100
Message-ID: <20161114161624.784ab3da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49959 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932132AbcKNFQ0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Nov 2016 00:16:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Martin,

After merging the scsi-mkp tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/scsi/hpsa.c: In function 'hpsa_free_irqs':
drivers/scsi/hpsa.c:8223:40: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
   free_irq(pci_irq_vector(h->pdev, 0), &h->q[i]);
                                        ^

Introduced by commit

  bc2bb1543e62 ("scsi: hpsa: use pci_alloc_irq_vectors and automatic irq affinity")

-- 
Cheers,
Stephen Rothwell
