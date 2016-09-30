From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tty tree
Date: Fri, 30 Sep 2016 13:54:37 +1000
Message-ID: <20160930135437.246d050b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41599 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750776AbcI3Dym (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Sep 2016 23:54:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksey Makarov <aleksey.makarov@linaro.org>

Hi Greg,

After merging the tty tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/tty/serial/amba-pl011.c: In function 'pl011_console_match':
drivers/tty/serial/amba-pl011.c:2346:44: error: passing argument 3 of 'uart_parse_earlycon' from incompatible pointer type [-Werror=incompatible-pointer-types]
  if (uart_parse_earlycon(options, &iotype, &addr, &options))
                                            ^
In file included from drivers/tty/serial/amba-pl011.c:45:0:
include/linux/serial_core.h:384:5: note: expected 'resource_size_t * {aka unsigned int *}' but argument is of type 'long unsigned int *'
 int uart_parse_earlycon(char *p, unsigned char *iotype, resource_size_t *addr,
     ^

Caused by commit

  8b8f347d3a48 ("serial: pl011: add console matching function")

interacting with commit

  46e36683f433 ("serial: earlycon: Extend earlycon command line option to support 64-bit addresses")

I have reverted commit 8b8f347d3a48 for today.

-- 
Cheers,
Stephen Rothwell
