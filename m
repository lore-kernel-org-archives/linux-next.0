From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the renesas
 tree
Date: Fri, 9 Jun 2017 13:53:04 +1000
Message-ID: <20170609135304.6c1108aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35715 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751622AbdFIDxG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Jun 2017 23:53:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Simon Horman <horms@verge.net.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marcus Cooper <codekipper@gmail.com>, Biju Das <biju.das@bp.renesas.com>

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.txt

between commit:

  d795f15618b8 ("of: Add vendor prefix for iWave Systems Technologies Pvt. Ltd")

from the renesas tree and commit:

  97a0268e764c ("devicetree: add Itead vendor prefix")

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

diff --cc Documentation/devicetree/bindings/vendor-prefixes.txt
index b946fc4b172a,b81092afe76d..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@@ -158,7 -159,7 +159,8 @@@ iom	Iomega Corporatio
  isee	ISEE 2007 S.L.
  isil	Intersil
  issi	Integrated Silicon Solutions Inc.
+ itead	ITEAD Intelligent Systems Co.Ltd
 +iwave	iWave Systems Technologies Pvt. Ltd.
  jdi	Japan Display Inc.
  jedec	JEDEC Solid State Technology Association
  karo	Ka-Ro electronics GmbH
