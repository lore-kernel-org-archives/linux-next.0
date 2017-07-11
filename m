From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 1/2] drivers: dma-coherent: Fix dev->cma_area vs
        dev->dma_mem breakage
Date: Tue, 11 Jul 2017 16:19:37 +0200
Message-ID: <20170711141937.GA12884@lst.de>
References: <1499433759-16397-1-git-send-email-vitaly_kuzmichev@mentor.com> <1499433779-16437-1-git-send-email-vitaly_kuzmichev@mentor.com> <20170707142746.GB10818@lst.de> <c9677667-e4c1-1384-04e4-e06a962feed9@arm.com> <6f26f0d9-506a-76bf-1410-19b00162c4a1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:52962 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932653AbdGKOTi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Jul 2017 10:19:38 -0400
Content-Disposition: inline
In-Reply-To: <6f26f0d9-506a-76bf-1410-19b00162c4a1@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>, Christoph Hellwig <hch@lst.de>, Vitaly Kuzmichev <vitaly_kuzmichev@mentor.com>, gregkh@linuxfoundation.org, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, "George G. Davis" <george_davis@mentor.com>

On Fri, Jul 07, 2017 at 05:06:52PM +0100, Robin Murphy wrote:
> I don't think we need to go that far, I reckon it would be clear enough
> to just split the per-device vs. global pool interfaces, something like
> I've sketched out below (such that the ops->alloc implementation calls
> dma_alloc_from_global_coherent() if dma_alloc_from_contiguous() fails).
> 
> If anyone wants to take that and run with it, feel free.

I like this basic idea.  It also fits into one of my plans for the
4.14 merge window - I want to enhance the lib/dma-noop.c so that
it can use different allocators and mapping helpers, e.g. for
the allocators what makes sense is:

 (1) simple page allocator (as-is)
 (2) CMA
 (3) swiotlb
 (4) the OF coherent allocator from your draft patch

and then for the mapping into phys space we can use

 (1) virto_to_phys (as-is)
 (2) arch helper (e.g. like done in mips plat support)
 (3) maybe some common form of ioremap / vmap instead of various
     duplicates

With that we should be able to cosolidate most direct mapped
dma_ops for architectures that do not require cache flushing into
common code.  As a next step we could think about useful cache
flushing hooks.
