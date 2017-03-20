From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the net-next tree
Date: Mon, 20 Mar 2017 16:10:51 +1100
Message-ID: <20170320161051.55a2927d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48333 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751027AbdCTFKy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Mar 2017 01:10:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  Documentation/devicetree/bindings/net/brcm,unimac-mdio.txt

between commit:

  0ce5aa1d6c97 ("dt-bindings: net: update bcmgenet binding for GENETv5")

from the net-next tree and patch:

  "scripts/spelling.txt: Add regsiter -> register spelling mistake"

from the akpm tree.

I fixed it up (the former also fixed the typo from the latter, so I just
used that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
