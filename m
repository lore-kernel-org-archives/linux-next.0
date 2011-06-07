From: Stephen Rothwell <sfr@au1.ibm.com>
Subject: linux-next: build failure after merge of the spi tree
Date: Tue, 7 Jun 2011 12:53:59 +1000
Message-ID: <20110607125359.604c2752.sfr@au1.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp03.au.ibm.com ([202.81.31.145]:57888 "EHLO
	e23smtp03.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754406Ab1FGCyE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Jun 2011 22:54:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>

Hi Grant,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

make[3]: *** No rule to make target `drivers/spi/spi-dw-midpci.c', needed by `drivers/spi/spi-dw-midpci.o'.  Stop.

Caused by commit f8f82d4e7529 ("spi: reorganize drivers").

I have used the spi tree from next-20110606 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
