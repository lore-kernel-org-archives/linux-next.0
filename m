From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Mon, 26 Nov 2012 14:44:02 +0100
Message-ID: <50B37222.7010709@samsung.com>
References: <20121126133153.50c5fa21cacd2858f30509e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45038 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753056Ab2KZNoG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Nov 2012 08:44:06 -0500
In-reply-to: <20121126133153.50c5fa21cacd2858f30509e3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomasz Stanislawski <t.stanislaws@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>

Hi Stephen,

On 11/26/2012 3:31 AM, Stephen Rothwell wrote:
> Hi Mauro,
>
> After merging the v4l-dvb tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: "dma_common_get_sgtable" [drivers/media/v4l2-core/videobuf2-dma-contig.ko] undefined!
>
> Caused by commit 9ef2cbeb8192 ("[media] v4l: vb2-dma-contig: add support
> for DMABUF exporting").  dma_common_get_sgtable() is called from the
> inline dma_get_sgtable_attrs() and dma_get_sgtable_attrs() is "called
> from" dma_get_sgtable().  dma_common_get_sgtable() is only defined if
> ARCH_HAS_DMA_DECLARE_COHERENT_MEMORY is set which depends on
> CONFIG_HAVE_GENERIC_DMA_COHERENT being set which it isn't for this build.
>
> I have used the v4l-dvb tree form next-20121026 for today.
>
> Please try testing your tree with an x86_64 allmodconfig build.

Thanks for spotting this issue. It's my fault, code for 
dma_common_get_sgtable()
function was incorrectly placed under ifdefs in drivrs/base/dma-mapping.

I've posted a fix, please refer to the "dma-mapping: fix 
dma_common_get_sgtable()
conditional compilation" patch, which I will push to Linus asap.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
