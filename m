From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the iommu tree with the arm tree
Date: Mon, 20 Jun 2016 13:20:09 +1000
Message-ID: <20160620132009.4e2c0e32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42661 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752068AbcFTDU7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Jun 2016 23:20:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Russell King <rmk@armlinux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Joerg,

Today's linux-next merge of the iommu tree got a conflict in:

  drivers/iommu/mtk_iommu.c

between commit:

  d267804c8457 ("iommu: convert DT component matching to component_match_add_release()")

from the arm tree and commit:

  da4d6e6d3b3e ("iommu/mediatek: Convert DT component matching to component_match_add_release()")

from the iommu tree.

These are clearly 2 versions of the same patch.

I fixed it up (I assumed that tha iommu tree version was newer and used
that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
