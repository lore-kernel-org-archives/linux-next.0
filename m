From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Mon, 10 Jul 2017 13:26:48 +1000
Message-ID: <20170710132648.41b21529@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiada Wang <jiada_wang@mentor.com>
List-Id: linux-next.vger.kernel.org

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

from Linus' tree.

I am not sure why this has only shown up now.

Since it is the only thing left in the spi tree, I have just dropped
that tree for today.

-- 
Cheers,
Stephen Rothwell
