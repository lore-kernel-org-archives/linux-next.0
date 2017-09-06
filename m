From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with Linus' tree
Date: Wed, 6 Sep 2017 13:01:35 +1000
Message-ID: <20170906130135.1bc2c3a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35691 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753319AbdIFDBh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Sep 2017 23:01:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/net/brcm,bgmac-nsp.txt

between commit:

  ea6c3077678f ("dt-bindings: net: Remove duplicate NSP Ethernet MAC binding document")

from Linus' tree and commit:

  4da722ca19f3 ("dt-bindings: Remove "status" from examples")

from the devicetree tree.

I fixed it up (the former removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



-- 
Cheers,
Stephen Rothwell
