From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi-nor tree
Date: Wed, 21 Jun 2017 12:19:11 +1000
Message-ID: <20170621121911.28b506b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42031 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752922AbdFUCTO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jun 2017 22:19:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, Marek Vasut <marek.vasut@gmail.com>

Hi Cyrille,

After merging the spi-nor tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/mtd/spi-nor/aspeed-smc.c: In function 'aspeed_smc_chip_set_segment':
drivers/mtd/spi-nor/aspeed-smc.c:554:14: error: 'SZ_128M' undeclared (first use in this function)
      size == SZ_128M) {
              ^

Caused by commit

  bb3a588d2151 ("mtd: spi-nor: aspeed: configure chip window on AHB bus")

Forgot to include linux/sizes.h.

I have used the spi-nor tree from next-20170620 for today.

-- 
Cheers,
Stephen Rothwell
