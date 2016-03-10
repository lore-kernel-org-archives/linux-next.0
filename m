From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Thu, 10 Mar 2016 09:00:25 +0100
Message-ID: <20160310080025.GA8618@gmail.com>
References: <20160310162856.3330418f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36217 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753463AbcCJIAb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2016 03:00:31 -0500
Content-Disposition: inline
In-Reply-To: <20160310162856.3330418f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@suse.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   drivers/gpu/drm/omapdrm/omap_gem.c
> 
> between commit:
> 
>   f6e45661f9be ("dma, mm/pat: Rename dma_*_writecombine() to dma_*_wc()")
> 
> from the tip tree and patch:
> 
>   "dma-mapping: rename dma_*_writecombine() to dma_*_wc()"
> 
> from the akpm tree.
> 
> These a basically the same patch, so I dropped the one from the akpm tree.

Andrew, what's your preference for merging it? I can drop it too.

Thanks,

	Ingo
