From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Mon, 10 Apr 2017 15:10:36 +1000
Message-ID: <20170410151036.62ea79de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36031 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750989AbdDJFKo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Apr 2017 01:10:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/rtl8723bs/core/rtw_ieee80211.c: In function 'rtw_macaddr_cfg':
drivers/staging/rtl8723bs/core/rtw_ieee80211.c:1193:22: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
              (addr = of_get_property(np, "local-mac-address", &len)) &&
                      ^
drivers/staging/rtl8723bs/core/rtw_ieee80211.c:1193:20: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
              (addr = of_get_property(np, "local-mac-address", &len)) &&
                    ^

Caused by commit

  554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

I have used the staging tree from next-20170407 for today.

-- 
Cheers,
Stephen Rothwell
