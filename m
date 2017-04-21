From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rdma tree
Date: Fri, 21 Apr 2017 11:42:16 +1000
Message-ID: <20170421114216.7878bee4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54151 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1034278AbdDUBmT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Apr 2017 21:42:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Steve Wise <swise@opengridcomputing.com>

Hi Doug,

After merging the rdma tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/infiniband/hw/cxgb4/cm.c: In function 'send_connect':
drivers/infiniband/hw/cxgb4/cm.c:830:5: error: implicit declaration of function 'PDBG' [-Werror=implicit-function-declaration]
     PDBG("%s snd_isn %u\n", __func__, t6req->rsvd);
     ^

Caused by commit

  a9a42886d0b3 ("cxgb4: Convert PDBG to pr_debug")

I have used the rdma tree from next-20170420 for today.

There was another PDBG() missed in that file as well.
-- 
Cheers,
Stephen Rothwell
