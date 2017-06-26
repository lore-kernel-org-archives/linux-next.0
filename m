From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: linux-next: build failure after merge of the i2c tree
Date: Mon, 26 Jun 2017 10:04:50 +0800
Message-ID: <20170626020448.GA15243@dragon>
References: <20170626110907.5c4950da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751521AbdFZCFL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Jun 2017 22:05:11 -0400
Content-Disposition: inline
In-Reply-To: <20170626110907.5c4950da@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wolfram Sang <wsa@the-dreams.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Baoyou Xie <baoyou.xie@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Nie <jun.nie@linaro.org>

Hi Stephen,

On Mon, Jun 26, 2017 at 11:09:07AM +1000, Stephen Rothwell wrote:
> Hi Wolfram,
> 
> After merging the i2c tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/i2c/busses/i2c-zx2967.c: In function 'zx2967_i2c_writesb':
> drivers/i2c/busses/i2c-zx2967.c:87:2: error: implicit declaration of function 'writesb' [-Werror=implicit-function-declaration]
>   writesb(i2c->reg_base + reg, data, len);
>   ^
> drivers/i2c/busses/i2c-zx2967.c: In function 'zx2967_i2c_readsb':
> drivers/i2c/busses/i2c-zx2967.c:93:2: error: implicit declaration of function 'readsb' [-Werror=implicit-function-declaration]
>   readsb(i2c->reg_base + reg, data, len);
>   ^
> 
> Caused by commit
> 
>   9615a01f71ca ("i2c: zx2967: add i2c controller driver for ZTE's zx2967 family")
> 
> Forgotten some include file, presumably.  And COMPILE_TEST may have
> been a bit hopeful :-)

Thanks for reporting it.  I have sent a fix [1] for it yesterday, which
hopefully will be applied soon.

Shawn

[1] https://patchwork.ozlabs.org/patch/780357/
