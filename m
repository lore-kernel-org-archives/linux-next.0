From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: commit "ARM: dma-mapping: remove custom consistent dma region"
Date: Fri, 29 Jun 2012 07:22:33 +0200
Message-ID: <000401cd55b7$327a1490$976e3db0$%szyprowski@samsung.com>
References: <20120627194604.GA9445@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50492 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750764Ab2F2FXI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jun 2012 01:23:08 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6D00IQ15M3O6O0@mailout4.samsung.com> for
 linux-next@vger.kernel.org; Fri, 29 Jun 2012 14:23:06 +0900 (KST)
Received: from AMDC159 ([106.116.147.30])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6D0015E5LMHT60@mmp1.samsung.com> for
 linux-next@vger.kernel.org; Fri, 29 Jun 2012 14:23:06 +0900 (KST)
In-reply-to: <20120627194604.GA9445@windriver.com>
Content-language: pl
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Paul Gortmaker' <paul.gortmaker@windriver.com>
Cc: kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

Hi Paul,

On Wednesday, June 27, 2012 9:46 PM Paul Gortmaker wrote:

> This commit in linux-next:
> 
> commit feb930cb9beb75cbe1d1e798870599c3aa1b93ec
> Author: Marek Szyprowski <m.szyprowski@samsung.com>
> Date:   Fri Jun 8 12:08:32 2012 +0200
> 
>     ARM: dma-mapping: remove custom consistent dma region
> 
> seems to break the at91x40_defconfig (according to git bisect).
> 
>   CC      arch/arm/mm/dma-mapping.o
> arch/arm/mm/dma-mapping.c: In function '__dma_alloc':
> arch/arm/mm/dma-mapping.c:575: error: macro "__alloc_from_pool" requires 4 arguments, but only
> 2 given
> arch/arm/mm/dma-mapping.c:575: error: '__alloc_from_pool' undeclared (first use in this
> function)
> arch/arm/mm/dma-mapping.c:575: error: (Each undeclared identifier is reported only once
> arch/arm/mm/dma-mapping.c:575: error: for each function it appears in.)
> make[2]: *** [arch/arm/mm/dma-mapping.o] Error 1
> make[1]: *** [arch/arm/mm/dma-mapping.o] Error 2
> 
> See http://kisskb.ellerman.id.au/kisskb/buildresult/6596769/ for a full log.
> 
> Please have a look when you get a chance.

Thanks for the report! I've added a fix to my dma-mapping-next branch, the issue should go 
away with the next update of linus-next tree.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
