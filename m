From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the devicetree
 tree
Date: Fri, 20 Jan 2017 13:55:01 +1100
Message-ID: <20170120135501.635768a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41915 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751106AbdATCzF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Jan 2017 21:55:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Rob Herring <robherring2@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Matt Ranostay <matt@ranostay.consulting>, Jonathan Cameron <jic23@kernel.org>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.txt

between commit:

  566088d1d2a0 ("devicetree: Add Fujitsu Ltd. vendor prefix")

from the devicetree tree and commit:

  9b27c270d403 ("devicetree: add Garmin vendor prefix")

from the staging tree.

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
index 14fd1c24e1f0,b34463b12382..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@@ -107,7 -108,7 +108,8 @@@ firefly	Firefl
  focaltech	FocalTech Systems Co.,Ltd
  friendlyarm	Guangzhou FriendlyARM Computer Tech Co., Ltd
  fsl	Freescale Semiconductor
 +fujitsu	Fujitsu Ltd.
+ grmn	Garmin Limited
  ge	General Electric Company
  geekbuying	GeekBuying
  gef	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
