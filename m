From: wlf <wulf@rock-chips.com>
Subject: Re: linux-next: build warning after merge of the phy-next tree
Date: Wed, 16 Nov 2016 21:28:43 +0800
Message-ID: <a1364db5-6700-49b6-1435-db9abf00f55d@rock-chips.com>
References: <20161116140004.465a98af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.140]:59725 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753112AbcKPN3H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Nov 2016 08:29:07 -0500
In-Reply-To: <20161116140004.465a98af@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen，

在 2016年11月16日 11:00, Stephen Rothwell 写道:
> Hi Kishon,
>
> After merging the phy-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/phy/phy-rockchip-inno-usb2.c: In function 'rockchip_chg_detect_work':
> drivers/phy/phy-rockchip-inno-usb2.c:717:7: warning: 'tmout' may be used uninitialized in this function [-Wmaybe-uninitialized]
>      if (tmout) {
>         ^
>
> Introduced by commit
>
>    0c42fe48fd23 ("phy: rockchip-inno-usb2: support otg-port for rk3399")
The variable "tmout" is initialized in the prior  code "case 
USB_CHG_STATE_WAIT_FOR_DCD",
and this case will be executed before "if (tmout)", so I think it's a 
mis-warning for some
special compiler.

Could you provide me some suggestion about this warning? Should I upload 
a new patch to
fix this compiler mis-warning or just ignore it ？ :-)

Best regards，
          wulf

>
