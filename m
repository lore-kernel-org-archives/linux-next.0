From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: Re: linux-next: origin tree build warning
Date: Mon, 22 Jun 2009 12:11:12 +0900
Message-ID: <20090622121054K.fujita.tomonori@lab.ntt.co.jp>
References: <20090622110113.7cd89382.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sh.osrg.net ([192.16.179.4]:35993 "EHLO sh.osrg.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751403AbZFVDLX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Jun 2009 23:11:23 -0400
In-Reply-To: <20090622110113.7cd89382.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: rdreier@cisco.com, general@lists.openfabrics.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, fujita.tomonori@lab.ntt.co.jp

On Mon, 22 Jun 2009 11:01:13 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> drivers/infiniband/hw/mthca/mthca_mr.c: In function 'mthca_arbel_write_mtt_seg':
> drivers/infiniband/hw/mthca/mthca_mr.c:358: warning: 'dma_sync_single' is deprecated (declared at /scratch/sfr/next/include/linux/dma-mapping.h:113)
> drivers/infiniband/hw/mthca/mthca_mr.c: In function 'mthca_arbel_map_phys_fmr':
> drivers/infiniband/hw/mthca/mthca_mr.c:810: warning: 'dma_sync_single' is deprecated (declared at /scratch/sfr/next/include/linux/dma-mapping.h:113)
> 
> Introduced by commit dbe6f1869188b6e04e38aa861dd198befb08bcd7
> ("dma-mapping: mark dma_sync_single and dma_sync_sg as deprecated").

Thanks, here's a fix for this:

http://marc.info/?l=linux-kernel&m=124347325819016&w=2


The patch doesn't change the driver functionally but the driver looks
broken wrt DMA synchronization. I guess that this issue is on Roland's
todo list:

http://marc.info/?l=linux-kernel&m=124354923710600&w=2
