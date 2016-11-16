From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the phy-next tree
Date: Wed, 16 Nov 2016 14:00:04 +1100
Message-ID: <20161116140004.465a98af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55319 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752020AbcKPDAH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Nov 2016 22:00:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, William Wu <wulf@rock-chips.com>

Hi Kishon,

After merging the phy-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/phy/phy-rockchip-inno-usb2.c: In function 'rockchip_chg_detect_work':
drivers/phy/phy-rockchip-inno-usb2.c:717:7: warning: 'tmout' may be used uninitialized in this function [-Wmaybe-uninitialized]
    if (tmout) {
       ^

Introduced by commit

  0c42fe48fd23 ("phy: rockchip-inno-usb2: support otg-port for rk3399")

-- 
Cheers,
Stephen Rothwell
