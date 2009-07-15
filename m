From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: dwmw2-iommu tree build failure
Date: Wed, 15 Jul 2009 08:29:19 +0100
Message-ID: <1247642959.10050.220.camel@macbook.infradead.org>
References: <20090715140116.c2ce8fde.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:52141 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752752AbZGOH3W (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2009 03:29:22 -0400
In-Reply-To: <20090715140116.c2ce8fde.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2009-07-15 at 14:01 +1000, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/pci/intel-iommu.c: In function 'dmar_init_reserved_ranges':
> drivers/pci/intel-iommu.c:1323: error: 'struct iova_domain' has no member named 'iova_alloc_lock'
> 
> Caused by commit b25c32b0af7045d3837c44d9685358aeeb9b7ac8 ("intel-iommu:
> Remove superfluous iova_alloc_lock from IOVA code").

Oops, I need to kill the lockdep references to that lock too. Fixed now;
thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
