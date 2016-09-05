From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with Linus' tree
Date: Mon, 5 Sep 2016 10:58:03 +1000
Message-ID: <20160905105803.13ed27ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35016 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754146AbcIEA6x (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 4 Sep 2016 20:58:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  arch/arm/mach-realview/core.c

between commit:

  2fb04fdf3019 ("net: smc91x: fix SMC accesses")

from Linus' tree and commit:

  7484c727b636 ("ARM: realview: delete the RealView board files")

from the arm-soc tree.

I fixed it up (I deleted the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
