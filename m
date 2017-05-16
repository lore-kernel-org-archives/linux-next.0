From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the imx-mxs tree
Date: Tue, 16 May 2017 11:00:09 +1000
Message-ID: <20170516110009.2b7cae50@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60267 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751413AbdEPBAM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 May 2017 21:00:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Shawn Guo <shawn.guo@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  drivers/soc/imx/Kconfig

between commit:

  e23c7f7d5783 ("soc: imx: add PM dependency for IMX7_PM_DOMAINS")

from the imx-mxs tree and patch:

  "imx7: fix Kconfig warning and build errors"

from the akpm tree.

I fixed it up (these both do the same thing, I just used the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
