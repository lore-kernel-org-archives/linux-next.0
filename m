From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi-nor tree
Date: Thu, 4 May 2017 10:51:42 +1000
Message-ID: <20170504105142.0ebe23ba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48001 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751447AbdEDAvo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 May 2017 20:51:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>

Hi Cyrille,

After merging the spi-nor tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/printk.h:329:0,
                 from include/linux/kernel.h:13,
                 from include/linux/clk.h:16,
                 from drivers/mtd/spi-nor/stm32-quadspi.c:8:
drivers/mtd/spi-nor/stm32-quadspi.c: In function 'stm32_qspi_read':
drivers/mtd/spi-nor/stm32-quadspi.c:378:21: warning: format '%x' expects argument of type 'unsigned int', but argument 7 has type 'size_t {aka long unsigned int}' [-Wformat=]
  dev_dbg(qspi->dev, "read(%#.2x): buf:%p from:%#.8x len:%#x\n",
                     ^
include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^
drivers/mtd/spi-nor/stm32-quadspi.c:378:2: note: in expansion of macro 'dev_dbg'
  dev_dbg(qspi->dev, "read(%#.2x): buf:%p from:%#.8x len:%#x\n",
  ^
drivers/mtd/spi-nor/stm32-quadspi.c: In function 'stm32_qspi_write':
drivers/mtd/spi-nor/stm32-quadspi.c:405:15: warning: format '%x' expects argument of type 'unsigned int', but argument 7 has type 'size_t {aka long unsigned int}' [-Wformat=]
  dev_dbg(dev, "write(%#.2x): buf:%p to:%#.8x len:%#x\n",
               ^
include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^
drivers/mtd/spi-nor/stm32-quadspi.c:405:2: note: in expansion of macro 'dev_dbg'
  dev_dbg(dev, "write(%#.2x): buf:%p to:%#.8x len:%#x\n",
  ^
drivers/mtd/spi-nor/stm32-quadspi.c: In function 'stm32_qspi_flash_setup':
drivers/mtd/spi-nor/stm32-quadspi.c:543:27: error: 'SZ_1K' undeclared (first use in this function)
  flash->fsize = FSIZE_VAL(SZ_1K);
                           ^
drivers/mtd/spi-nor/stm32-quadspi.c:110:33: note: in definition of macro 'FSIZE_VAL'
 #define FSIZE_VAL(size)  (__fls(size) - 1)
                                 ^
drivers/mtd/spi-nor/stm32-quadspi.c:543:27: note: each undeclared identifier is reported only once for each function it appears in
  flash->fsize = FSIZE_VAL(SZ_1K);
                           ^
drivers/mtd/spi-nor/stm32-quadspi.c:110:33: note: in definition of macro 'FSIZE_VAL'
 #define FSIZE_VAL(size)  (__fls(size) - 1)
                                 ^

Exposed by commit

  7a754f2016a0 ("mtd: spi-nor: stm32-quadspi: allow building with COMPILE_TEST")

I have used the spi-nor tree from next-20170503 for today.

-- 
Cheers,
Stephen Rothwell
