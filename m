From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of Linus' tree
Date: Mon, 8 Aug 2016 11:58:27 +1000
Message-ID: <20160808115827.6dd7fa6f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42896 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751671AbcHHB6a (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Aug 2016 21:58:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Moni Shoua <monis@mellanox.com>, Kamal Heib <kamalh@mellanox.com>, Amir Vadai <amirv@mellanox.com>, Haggai Eran <haggaie@mellanox.com>

Hi all,

With Linus' tree, today's linux-next build (powerpc allyesconfig) failed
like this:

drivers/infiniband/sw/built-in.o:(.opd+0x1698): multiple definition of `copy_data'
drivers/infiniband/hw/built-in.o:(.opd+0xe5f8): first defined here
drivers/infiniband/sw/built-in.o:(.opd+0x1320): multiple definition of `rxe_av_from_attr'
drivers/infiniband/hw/built-in.o:(.opd+0xe280): first defined here
drivers/infiniband/sw/built-in.o:(.opd+0x18d8): multiple definition of `rxe_do_task'
drivers/infiniband/hw/built-in.o:(.opd+0xe838): first defined here

and lots of others.

Caused by commit

  8700e3e7c485 ("Soft RoCE driver")

(which was never in linux-next :-()

I just disabled teh driver for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 8 Aug 2016 11:52:53 +1000
Subject: [PATCH] Disable the Soft RoCE driver

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/infiniband/Kconfig     | 1 -
 drivers/infiniband/sw/Makefile | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/infiniband/Kconfig b/drivers/infiniband/Kconfig
index 0c2e55c5354b..53ef194c5be1 100644
--- a/drivers/infiniband/Kconfig
+++ b/drivers/infiniband/Kconfig
@@ -86,7 +86,6 @@ source "drivers/infiniband/ulp/iser/Kconfig"
 source "drivers/infiniband/ulp/isert/Kconfig"
 
 source "drivers/infiniband/sw/rdmavt/Kconfig"
-source "drivers/infiniband/sw/rxe/Kconfig"
 
 source "drivers/infiniband/hw/hfi1/Kconfig"
 
diff --git a/drivers/infiniband/sw/Makefile b/drivers/infiniband/sw/Makefile
index 8b095b27db87..988b6a0101a4 100644
--- a/drivers/infiniband/sw/Makefile
+++ b/drivers/infiniband/sw/Makefile
@@ -1,2 +1 @@
 obj-$(CONFIG_INFINIBAND_RDMAVT)		+= rdmavt/
-obj-$(CONFIG_RDMA_RXE)			+= rxe/
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
