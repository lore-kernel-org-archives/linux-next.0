From: Joerg Roedel <joro@8bytes.org>
Subject: Re: linux-next: build failure after merge of the iommu tree
Date: Sun, 1 Nov 2015 16:14:58 +0100
Message-ID: <20151101151457.GM27420@8bytes.org>
References: <20151101224252.09e11a3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:49801 "EHLO theia.8bytes.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751999AbbKAPPA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 10:15:00 -0500
Content-Disposition: inline
In-Reply-To: <20151101224252.09e11a3c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>

Hi Stephen,

On Sun, Nov 01, 2015 at 10:42:52PM +1100, Stephen Rothwell wrote:
> After merging the iommu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/iommu/ipmmu-vmsa.c:24:27: fatal error: asm/dma-iommu.h: No such file or directory
> 
> Caused by commit
> 
>   bad78b13e305 ("iommu/ipmmu-vmsa: Drop LPAE Kconfig dependency")
> 
> Only arm has the include file ...
> 
> I have used the iommu tree from next-20151022 for today.

Thanks, I reverted the broken commit and will push out an updated tree
soon.


	Joerg
