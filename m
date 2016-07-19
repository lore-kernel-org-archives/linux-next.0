From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the l2-mtd tree
Date: Tue, 19 Jul 2016 10:59:30 +1000
Message-ID: <20160719105930.39012675@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41693 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751492AbcGSA7d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 20:59:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Graham Moore <grmoore@opensource.altera.com>, Marek Vasut <marex@denx.de>

Hi Brian,

After merging the l2-mtd tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/mtd/spi-nor/cadence-quadspi.c: In function 'cqspi_indirect_read_execute':
drivers/mtd/spi-nor/cadence-quadspi.c:529:4: error: implicit declaration of function 'readsl' [-Werror=implicit-function-declaration]
    readsl(ahb_base, rxbuf, DIV_ROUND_UP(bytes_to_read, 4));
    ^
drivers/mtd/spi-nor/cadence-quadspi.c: In function 'cqspi_indirect_write_execute':
drivers/mtd/spi-nor/cadence-quadspi.c:613:3: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]
   writesl(cqspi->ahb_base, txbuf, DIV_ROUND_UP(write_bytes, 4));
   ^

Caused by commit

  140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")

Missing include of linux/io.h ...

I have used the l2-mtd tree from next-20160718 for today.

-- 
Cheers,
Stephen Rothwell
