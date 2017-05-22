From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the selinux tree
Date: Mon, 22 May 2017 12:48:55 +1000
Message-ID: <20170522124855.68ad087f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33891 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755679AbdEVCs5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 May 2017 22:48:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Matan Barak <matanb@mellanox.com>, Doug Ledford <dledford@redhat.com>

Hi Paul,

After merging the selinux tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/infiniband/core/uverbs_cmd.c: In function 'create_qp':
drivers/infiniband/core/uverbs_cmd.c:1513:4: error: label 'err_destroy' used but not defined
    goto err_destroy;
    ^

Caused by commit

  89b54b4d09bd ("IB/core: Enforce PKey security on QPs")

interacting with commit

  fd3c7904db6e ("IB/core: Change idr objects to use the new schema")

from Linus' tree.

I have applied the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 22 May 2017 12:45:57 +1000
Subject: [PATCH] IB/core: fix up for create_qp label changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/infiniband/core/uverbs_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/core/uverbs_cmd.c
index 558fd5204b32..0ad3b05405d8 100644
--- a/drivers/infiniband/core/uverbs_cmd.c
+++ b/drivers/infiniband/core/uverbs_cmd.c
@@ -1510,7 +1510,7 @@ static int create_qp(struct ib_uverbs_file *file,
 	if (cmd->qp_type != IB_QPT_XRC_TGT) {
 		ret = ib_create_qp_security(qp, device);
 		if (ret)
-			goto err_destroy;
+			goto err_cb;
 
 		qp->real_qp	  = qp;
 		qp->device	  = device;
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
