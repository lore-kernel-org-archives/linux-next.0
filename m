From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the spi tree
Date: Tue, 22 Aug 2017 16:49:36 +1000
Message-ID: <20170822164936.5a57ec78@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47549 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754517AbdHVGti (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Aug 2017 02:49:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiada Wang <jiada_wang@mentor.com>

Hi all,

After merging the spi tree, today's linux-next build (powerpc
allyesconfig) produced these warnings:

drivers/spi/spi-imx.c: In function 'spi_imx_buf_rx_swap_u32':
drivers/spi/spi-imx.c:284:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]
  unsigned int bytes_per_word;
               ^
drivers/spi/spi-imx.c: In function 'spi_imx_buf_tx_swap_u32':
drivers/spi/spi-imx.c:319:15: warning: unused variable 'bytes_per_word' [-Wunused-variable]
  unsigned int bytes_per_word;
               ^

Introduced by commit

  1673c81d9435 ("spi: imx: dynamic burst length adjust for PIO mode")

-- 
Cheers,
Stephen Rothwell
