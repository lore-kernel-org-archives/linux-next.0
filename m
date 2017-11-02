From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the usb tree
Date: Thu, 2 Nov 2017 15:10:22 +1100
Message-ID: <20171102151022.033dc8d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44285 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750704AbdKBEKY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 00:10:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <felipe.balbi@linux.intel.com>

Hi Greg,

After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

In file included from include/linux/printk.h:327:0,
                 from include/linux/kernel.h:13,
                 from include/asm-generic/bug.h:15,
                 from arch/x86/include/asm/bug.h:81,
                 from include/linux/bug.h:4,
                 from include/linux/scatterlist.h:6,
                 from include/linux/dmapool.h:14,
                 from drivers/usb/mtu3/mtu3_qmu.c:30:
drivers/usb/mtu3/mtu3_qmu.c: In function 'mtu3_prepare_tx_gpd':
drivers/usb/mtu3/mtu3_qmu.c:261:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka long long unsigned int}' [-Wformat=]
  dev_dbg(mep->mtu->dev, "TX-EP%d queue gpd=%p, enq=%p, qdma=%pad\n",
                         ^
include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^
drivers/usb/mtu3/mtu3_qmu.c:261:2: note: in expansion of macro 'dev_dbg'
  dev_dbg(mep->mtu->dev, "TX-EP%d queue gpd=%p, enq=%p, qdma=%pad\n",
  ^
drivers/usb/mtu3/mtu3_qmu.c: In function 'mtu3_prepare_rx_gpd':
drivers/usb/mtu3/mtu3_qmu.c:300:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka long long unsigned int}' [-Wformat=]
  dev_dbg(mep->mtu->dev, "RX-EP%d queue gpd=%p, enq=%p, qdma=%pad\n",
                         ^
include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^
drivers/usb/mtu3/mtu3_qmu.c:300:2: note: in expansion of macro 'dev_dbg'
  dev_dbg(mep->mtu->dev, "RX-EP%d queue gpd=%p, enq=%p, qdma=%pad\n",
  ^

Introduced by commit

  1a46dfea0841 ("usb: mtu3: support 36-bit DMA address")

-- 
Cheers,
Stephen Rothwell
