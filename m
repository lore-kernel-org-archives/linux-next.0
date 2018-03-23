From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Fri, 23 Mar 2018 09:31:34 +0100
Message-ID: <20180323083134.GB23865@lst.de>
References: <20180323132853.67195c47@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180323132853.67195c47@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 23, 2018 at 01:28:53PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> lib/swiotlb.c:748:13: warning: 'swiotlb_free_buffer' defined but not used [-Wunused-function]
>  static bool swiotlb_free_buffer(struct device *dev, size_t size,
>              ^~~~~~~~~~~~~~~~~~~
> lib/swiotlb.c:706:1: warning: 'swiotlb_alloc_buffer' defined but not used [-Wunused-function]
>  swiotlb_alloc_buffer(struct device *dev, size_t size, dma_addr_t *dma_handle,
>  ^~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   16e73adbca76 ("dma/swiotlb: Remove swiotlb_{alloc,free}_coherent()")
> 
> These are now only used with CONFIG_DMA_DIRECT_OPS.

True.  I'll send a fixup.
