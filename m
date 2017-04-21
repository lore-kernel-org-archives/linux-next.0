From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the arm-soc tree
Date: Fri, 21 Apr 2017 10:54:05 +1000
Message-ID: <20170421105405.6a690b35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58531 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S948299AbdDUAyH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Apr 2017 20:54:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon <nm@ti.com>

Hi all,

Today's linux-next merge of the pm tree got a conflict in:

  include/dt-bindings/genpd/k2g.h

between commit:

  7cc119f29b19 ("dt-bindings: Add TI SCI PM Domains")

from the arm-soc tree and commit:

  45da8edd1741 ("dt-bindings: Add TI SCI PM Domains")

from the pm tree.

I fixed it up (I just used the pm tree version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
