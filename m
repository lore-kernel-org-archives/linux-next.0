From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the spi tree
Date: Mon, 27 Mar 2017 13:41:12 +1100
Message-ID: <20170327134112.69ff893d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59361 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751796AbdC0CtG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Mar 2017 22:49:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>

Hi Mark,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/spi/spi-ti-qspi.c: In function 'ti_qspi_dma_xfer':
drivers/spi/spi-ti-qspi.c:398:21: warning: unused variable 'dma_dev' [-Wunused-variable]
  struct dma_device *dma_dev = chan->device;
                     ^

Introduced by commit

  1351aaeb50b2 ("spi: spi-ti-qspi: Use dma_engine wrapper for dma memcpy call")

-- 
Cheers,
Stephen Rothwell
