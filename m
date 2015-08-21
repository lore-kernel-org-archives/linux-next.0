From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Fri, 21 Aug 2015 14:10:04 +1000
Message-ID: <20150821141004.6298e3bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60870 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750801AbbHUEKH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 21 Aug 2015 00:10:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Suchanek <hramrach@gmail.com>

Hi Mark,

After merging the spi tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/clk.h:16:0,
                 from drivers/spi/spi-sun4i.c:14:
drivers/spi/spi-sun4i.c: In function 'sun4i_spi_transfer_one':
drivers/spi/spi-sun4i.c:283:43: error: 'speed' undeclared (first use in this function)
  tx_time = max_t(int, tfr->len * 8 * 2 / (speed / 1000), 100);
                                           ^
include/linux/kernel.h:767:17: note: in definition of macro 'max_t'
  type __max1 = (x);   \
                 ^
drivers/spi/spi-sun4i.c:283:43: note: each undeclared identifier is reported only once for each function it appears in
  tx_time = max_t(int, tfr->len * 8 * 2 / (speed / 1000), 100);
                                           ^
include/linux/kernel.h:767:17: note: in definition of macro 'max_t'
  type __max1 = (x);   \
                 ^
In file included from include/linux/clk.h:16:0,
                 from drivers/spi/spi-sun6i.c:14:
drivers/spi/spi-sun6i.c: In function 'sun6i_spi_transfer_one':
drivers/spi/spi-sun6i.c:273:43: error: 'speed' undeclared (first use in this function)
  tx_time = max_t(int, tfr->len * 8 * 2 / (speed / 1000), 100);
                                           ^
include/linux/kernel.h:767:17: note: in definition of macro 'max_t'
  type __max1 = (x);   \
                 ^
drivers/spi/spi-sun6i.c:273:43: note: each undeclared identifier is reported only once for each function it appears in
  tx_time = max_t(int, tfr->len * 8 * 2 / (speed / 1000), 100);
                                           ^
include/linux/kernel.h:767:17: note: in definition of macro 'max_t'
  type __max1 = (x);   \
                 ^

Caused by commit

  63d53d153b62 ("spi: sunxi: fix transfer timeout")

I have used the spi tree from next-20150820 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
