From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the imx-mxs
 tree
Date: Fri, 9 Sep 2016 13:10:01 +1000
Message-ID: <20160909131001.024a5b50@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36334 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751372AbcIIDKE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Sep 2016 23:10:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrej Rosano <andrej@inversepath.com>, Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.txt

between commit:

  8266b4ae7135 ("devicetree: Add vendor prefix for Inverse Path")

from the imx-mxs tree and commit:

  a24f7253f26d ("devicetree: Sort vendor prefixes in alphabetical order")

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
index cc15e9911dc8,4d95a9ddecdf..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@@ -136,7 -134,7 +135,8 @@@ innolux	Innolux Corporatio
  intel	Intel Corporation
  intercontrol	Inter Control Group
  invensense	InvenSense Inc.
 +inversepath	Inverse Path
+ iom	Iomega Corporation
  isee	ISEE 2007 S.L.
  isil	Intersil
  issi	Integrated Silicon Solutions Inc.
