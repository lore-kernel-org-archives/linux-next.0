From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the at91 tree with the arm-soc tree
Date: Thu, 20 Apr 2017 08:38:17 +1000
Message-ID: <20170420083817.5a44b69c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46497 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S940275AbdDSWiZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Apr 2017 18:38:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>, Alexandre Belloni <alexandre.belloni@free-electrons.com>

Hi Nicolas,

Today's linux-next merge of the at91 tree got a conflict in:

  arch/arm/boot/dts/at91-tse850-3.dts

between commit:

  e67cedc92812 ("ARM: dts: at91: add envelope detector mux to the Axentia TSE-850")

from the arm-soc tree and commit:

  29dd89418007 ("ARM: dts: at91: add envelope detector mux to the Axentia TSE-850")

from the at91 tree.

I fixed it up (I used the arm-soc tree version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
