From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Mon, 3 Jul 2017 13:41:58 +1000
Message-ID: <20170703134158.56348d81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50463 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752110AbdGCDmB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Jul 2017 23:42:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiada Wang <jiada_wang@mentor.com>, Sascha Hauer <s.hauer@pengutronix.de>

Hi Mark,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/spi/spi-imx.c: In function 'spi_imx_setupxfer':
drivers/spi/spi-imx.c:1007:16: error: 'config' undeclared (first use in this function)
   mask = (1 << config.bpw) - 1;
                ^

Caused by commit

  a0cc330240c9 ("spi: imx: dynamic burst length adjust for PIO mode")

interacting with commit

  d52345b6cf8e ("spi: imx: put struct spi_imx_config members into driver private struct")

I reverted a0cc330240c9 for today.

-- 
Cheers,
Stephen Rothwell
