From: Vitaly Kuzmichev <vitaly_kuzmichev@mentor.com>
Subject: [PATCH v2 0/2] Additions to default DMA coherent pool
Date: Fri, 7 Jul 2017 16:22:39 +0300
Message-ID: <1499433759-16397-1-git-send-email-vitaly_kuzmichev@mentor.com>
References: <1499093475-29859-1-git-send-email-vitaly_kuzmichev@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:41317 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752021AbdGGNWp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Jul 2017 09:22:45 -0400
In-Reply-To: <1499093475-29859-1-git-send-email-vitaly_kuzmichev@mentor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

v2:
Since linux-next now includes Vladimir Murzin's version of default DMA
coherent pool [1] our version is not required now and even causes merge
conflict. The difference between two versions is not really significant
except one serious problem with CONFIG_DMA_CMA. Please see patch v2 1/2
for details.
So that I have rebased our work on linux-next/master branch, and sending
this patchset with necessary additions for default DMA pool feature.

Patch v2 2/2 adds 'dmainfo' to ProcFS to show available DMA regions.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=93228b44c33a572cb36cec2dbed42e9bdbc88d79

George G. Davis (2):
  drivers: dma-coherent: Fix dev->cma_area vs dev->dma_mem breakage
  drivers: dma-coherent: show per-device DMA region utilization via
    procfs

 drivers/base/dma-coherent.c | 228 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 219 insertions(+), 9 deletions(-)

-- 
1.9.1
