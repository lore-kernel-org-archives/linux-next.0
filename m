From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 2/2] drivers: dma-coherent: show per-device DMA
        region utilization via procfs
Date: Fri, 7 Jul 2017 16:28:27 +0200
Message-ID: <20170707142827.GC10818@lst.de>
References: <1499433759-16397-1-git-send-email-vitaly_kuzmichev@mentor.com> <1499433797-16516-1-git-send-email-vitaly_kuzmichev@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:36936 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750726AbdGGO23 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 Jul 2017 10:28:29 -0400
Content-Disposition: inline
In-Reply-To: <1499433797-16516-1-git-send-email-vitaly_kuzmichev@mentor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vitaly Kuzmichev <vitaly_kuzmichev@mentor.com>
Cc: gregkh@linuxfoundation.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, "George G. Davis" <george_davis@mentor.com>

This should at least go into debugfs.  I'd also prefer it it was a
separate file instead of the ifdefs.
