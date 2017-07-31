From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rdma tree
Date: Mon, 31 Jul 2017 12:07:07 +1000
Message-ID: <20170731120707.1c49185f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34657 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751217AbdGaCHJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 30 Jul 2017 22:07:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matan Barak <matanb@mellanox.com>

Hi Doug,

After merging the rdma tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/infiniband/hw/hns/hns_roce_eq.c: In function 'hns_roce_init_eq_table':
drivers/infiniband/hw/hns/hns_roce_eq.c:711:9: error: implicit declaration of function 'request_irq' [-Werror=implicit-function-declaration]
   ret = request_irq(eq_table->eq[j].irq, hns_roce_msi_x_interrupt,
         ^
drivers/infiniband/hw/hns/hns_roce_eq.c:726:3: error: implicit declaration of function 'free_irq' [-Werror=implicit-function-declaration]
   free_irq(eq_table->eq[j].irq, eq_table->eq + j);
   ^

Probably exposed by commit

  e89bf462b6be ("IB/hns: Support compile test for hns RoCE driver")

But maybe caused by another commit thet modified includes so that
linux/interrupt.h is not longer implictly included ...

I have used the rdma tree from next-20170728 for today.

-- 
Cheers,
Stephen Rothwell
