From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with Linus' tree
Date: Wed, 6 Sep 2017 12:55:20 +1000
Message-ID: <20170906125520.0bb266c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43135 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752423AbdIFCzX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Sep 2017 22:55:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Antoine =?UTF-8?B?VMOpbmFy?= =?UTF-8?B?dA==?= <antoine.tenart@free-electrons.com>, Herbert Xu <herbert@gondor.apana.org.au>

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/crypto/inside-secure-safexcel.txt

between commit:

  6eb8844bf4be ("Documentation/bindings: crypto: remove the dma-mask property")

from Linus' tree and commit:

  4da722ca19f3 ("dt-bindings: Remove "status" from examples")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/crypto/inside-secure-safexcel.txt
index 941bb6a6fb13,c08d5ad79b1f..000000000000
--- a/Documentation/devicetree/bindings/crypto/inside-secure-safexcel.txt
+++ b/Documentation/devicetree/bindings/crypto/inside-secure-safexcel.txt
@@@ -23,5 -24,5 +23,4 @@@ Example
  		interrupt-names = "mem", "ring0", "ring1", "ring2", "ring3",
  				  "eip";
  		clocks = <&cpm_syscon0 1 26>;
- 		status = "disabled";
 -		dma-mask = <0xff 0xffffffff>;
  	};
