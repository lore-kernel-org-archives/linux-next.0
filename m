From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: linux-next: build failure after merge of the l2-mtd tree
Date: Mon, 18 Jul 2016 18:20:39 -0700
Message-ID: <20160719012039.GA18583@google.com>
References: <20160719105930.39012675@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:36641 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752125AbcGSBUn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Jul 2016 21:20:43 -0400
Content-Disposition: inline
In-Reply-To: <20160719105930.39012675@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Graham Moore <grmoore@opensource.altera.com>, Marek Vasut <marex@denx.de>

On Tue, Jul 19, 2016 at 10:59:30AM +1000, Stephen Rothwell wrote:
> Hi Brian,
> 
> After merging the l2-mtd tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/mtd/spi-nor/cadence-quadspi.c: In function 'cqspi_indirect_read_execute':
> drivers/mtd/spi-nor/cadence-quadspi.c:529:4: error: implicit declaration of function 'readsl' [-Werror=implicit-function-declaration]
>     readsl(ahb_base, rxbuf, DIV_ROUND_UP(bytes_to_read, 4));
>     ^
> drivers/mtd/spi-nor/cadence-quadspi.c: In function 'cqspi_indirect_write_execute':
> drivers/mtd/spi-nor/cadence-quadspi.c:613:3: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]
>    writesl(cqspi->ahb_base, txbuf, DIV_ROUND_UP(write_bytes, 4));
>    ^
> 
> Caused by commit
> 
>   140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")

Known:

http://lists.infradead.org/pipermail/linux-mtd/2016-July/068569.html

> Missing include of linux/io.h ...

It's not missing linux/io.h; x86 is missing readsl()/writesl(). If x86
folks don't have a solution, then I guess we'll just make this depend on
!X86.

> I have used the l2-mtd tree from next-20160718 for today.

Regards,
Brian
