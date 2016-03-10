From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Thu, 10 Mar 2016 12:38:14 -0800
Message-ID: <20160310123814.3225ce5fb9fdbf8a01c920af@linux-foundation.org>
References: <20160310162856.3330418f@canb.auug.org.au>
	<20160310080025.GA8618@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:56550 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932120AbcCJUiP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2016 15:38:15 -0500
In-Reply-To: <20160310080025.GA8618@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@suse.com>

On Thu, 10 Mar 2016 09:00:25 +0100 Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Andrew,
> > 
> > Today's linux-next merge of the akpm tree got a conflict in:
> > 
> >   drivers/gpu/drm/omapdrm/omap_gem.c
> > 
> > between commit:
> > 
> >   f6e45661f9be ("dma, mm/pat: Rename dma_*_writecombine() to dma_*_wc()")
> > 
> > from the tip tree and patch:
> > 
> >   "dma-mapping: rename dma_*_writecombine() to dma_*_wc()"
> > 
> > from the akpm tree.
> > 
> > These a basically the same patch, so I dropped the one from the akpm tree.
> 
> Andrew, what's your preference for merging it? I can drop it too.
> 

I've dropped the -mm copy.  That's what I do in 99.99% of cases.  Which
means that if the version which was in someone else's -next tree later
gets lost (happens sometimes), the patch is lost altogether.
