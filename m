From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rdma tree
Date: Tue, 27 Sep 2016 11:23:34 +1000
Message-ID: <20160927112334.3615159e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60303 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932504AbcI0BXh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Sep 2016 21:23:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Doug,

After merging the rdma tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'kiblnd_hdev_setup_mrs':
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2317:7: error: implicit declaration of function 'ib_get_dma_mr' [-Werror=implicit-function-declaration]
  mr = ib_get_dma_mr(hdev->ibh_pd, acflags);
       ^
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2317:5: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
  mr = ib_get_dma_mr(hdev->ibh_pd, acflags);
     ^

Caused by commit

  5ef990f06bd7 ("IB/core: remove ib_get_dma_mr")

I have used the rdma tree from next-20160923 for today.

-- 
Cheers,
Stephen Rothwell
