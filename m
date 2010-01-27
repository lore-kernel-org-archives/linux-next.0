From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Wed, 27 Jan 2010 13:18:27 +1100
Message-ID: <20100127131827.6aea9bf5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59663 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932150Ab0A0CSc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Jan 2010 21:18:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ron Mercer <ron.mercer@qlogic.com>, Breno Leitao <leitao@linux.vnet.ibm.com>

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/net/qlge/qlge_main.c: In function 'ql_init_device':
drivers/net/qlge/qlge_main.c:4502: error: label 'err_out' used but not defined

Caused by commit 8aae2600030f54494f9061d2cde141802d774be9 ("qlge: Add
basic firmware dump") interacting with commit
4f9a91c81273b66afe0b6a9be460b47581b28246 ("qlge: Only free resources if
they were allocated") from Linus' tree.

I applied the following merge fixup.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 27 Jan 2010 13:10:17 +1100
Subject: [PATCH] net: merge fixup for qlge_main

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/qlge/qlge_main.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/qlge/qlge_main.c b/drivers/net/qlge/qlge_main.c
index 4adca94..5be3ae2 100644
--- a/drivers/net/qlge/qlge_main.c
+++ b/drivers/net/qlge/qlge_main.c
@@ -4499,7 +4499,7 @@ static int __devinit ql_init_device(struct pci_dev *pdev,
 		if (qdev->mpi_coredump == NULL) {
 			dev_err(&pdev->dev, "Coredump alloc failed.\n");
 			err = -ENOMEM;
-			goto err_out;
+			goto err_out2;
 		}
 		if (qlge_force_coredump)
 			set_bit(QL_FRC_COREDUMP, &qdev->flags);
-- 
1.6.6
