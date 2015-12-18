From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Fri, 18 Dec 2015 16:09:52 +1100
Message-ID: <20151218160952.79e44004@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57524 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750707AbbLRFJy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Dec 2015 00:09:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm/mm/dma-mapping.c
  drivers/iommu/intel-iommu.c
  drivers/staging/android/ion/ion_chunk_heap.c

between commit:

  3e6110fd5480 ("Revert "scatterlist: use sg_phys()"")

from Linus' tree and commit:

  0504b8687491 ("scatterlist: fix sg_phys() masking")

from the akpm-current tree.

I fixed it up (I use the Linus' tree version for now, effectively removing
the whole of the akpm-current tree patch) and can carry the fix as
necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
