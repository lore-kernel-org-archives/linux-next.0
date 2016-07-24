From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sh tree
Date: Sun, 24 Jul 2016 11:00:12 +1000
Message-ID: <20160724110012.188b6a27@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53660 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751499AbcGXBAP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 23 Jul 2016 21:00:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Rich,

After merging the sh tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/spi/spi-jcore.o

Introduced by commit

  8c7f438f0661 ("spi: add driver for J-Core SPI controller")

-- 
Cheers,
Stephen Rothwell
