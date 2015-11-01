From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the iommu tree
Date: Sun, 1 Nov 2015 22:42:52 +1100
Message-ID: <20151101224252.09e11a3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57414 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751453AbbKALm4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 06:42:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>

Hi Joerg,

After merging the iommu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/iommu/ipmmu-vmsa.c:24:27: fatal error: asm/dma-iommu.h: No such file or directory

Caused by commit

  bad78b13e305 ("iommu/ipmmu-vmsa: Drop LPAE Kconfig dependency")

Only arm has the include file ...

I have used the iommu tree from next-20151022 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
