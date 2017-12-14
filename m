From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging.current tree
Date: Thu, 14 Dec 2017 08:27:30 +0100
Message-ID: <20171214072730.GD27027@kroah.com>
References: <20171214170033.24a606b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:40627 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751072AbdLNH1Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Dec 2017 02:27:25 -0500
Content-Disposition: inline
In-Reply-To: <20171214170033.24a606b6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>

On Thu, Dec 14, 2017 at 05:00:33PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging.current tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/staging/android/ion/ion_cma_heap.c: In function 'ion_cma_allocate':
> drivers/staging/android/ion/ion_cma_heap.c:38:14: error: 'CONFIG_CMA_ALIGNMENT' undeclared (first use in this function)
>   if (align > CONFIG_CMA_ALIGNMENT)
>               ^
> 
> Caused by commit
> 
>   d98e6dbf42f7 ("staging: ion: Fix ion_cma_heap allocations")
> 
> CONFIG_CMA_ALIGNMENT (and CONFIG_DMA_CMA) is not set for this build.
> 
> I have reverted that commit for today.

Thanks, and sorry about that.  John is working on a fix...

greg k-h
