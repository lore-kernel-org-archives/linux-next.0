From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Wed, 24 May 2017 11:08:25 +1000
Message-ID: <20170524110825.4bba38b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42045 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751710AbdEXBI3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 May 2017 21:08:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiada Wang <jiada_wang@mentor.com>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>

Hi Mark,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/spi/spi-imx.c: In function 'spi_imx_can_dma':
drivers/spi/spi-imx.c:241:9: error: 'struct spi_imx_data' has no member named 'dynamic_burst'
  spi_imx->dynamic_burst = 0;
         ^

Caused by commit

  09b3ed2d5916 ("spi: imx: Revert "spi: imx: dynamic burst length adjust for PIO mode"")

interacting with commit

  1ce1c618e6b5 ("spi: imx: only allow dynamic burst in PIO mode")

from a separate topic branch and not fixing it up in the merge. Although
that second commit could never have built anyway on its own :-(

I have used the spi tree from next-20170523 for today.

-- 
Cheers,
Stephen Rothwell
