From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the i2c tree
Date: Mon, 26 Jun 2017 11:09:07 +1000
Message-ID: <20170626110907.5c4950da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59867 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750967AbdFZBJK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Jun 2017 21:09:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Baoyou Xie <baoyou.xie@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>

Hi Wolfram,

After merging the i2c tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/i2c/busses/i2c-zx2967.c: In function 'zx2967_i2c_writesb':
drivers/i2c/busses/i2c-zx2967.c:87:2: error: implicit declaration of function 'writesb' [-Werror=implicit-function-declaration]
  writesb(i2c->reg_base + reg, data, len);
  ^
drivers/i2c/busses/i2c-zx2967.c: In function 'zx2967_i2c_readsb':
drivers/i2c/busses/i2c-zx2967.c:93:2: error: implicit declaration of function 'readsb' [-Werror=implicit-function-declaration]
  readsb(i2c->reg_base + reg, data, len);
  ^

Caused by commit

  9615a01f71ca ("i2c: zx2967: add i2c controller driver for ZTE's zx2967 family")

Forgotten some include file, presumably.  And COMPILE_TEST may have
been a bit hopeful :-)

I have used the i2c tree from next-20170623 for today.

-- 
Cheers,
Stephen Rothwell
