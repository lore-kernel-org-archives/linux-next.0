From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: comment in commit in the slave-dma tree
 (dmaengine: dw_dmac: Enhance device tree support)
Date: Tue, 8 Jan 2013 00:17:35 -0800
Message-ID: <20130108081735.GB19691@intel.com>
References: <20130108093557.8a29d4a04b95702fc59790ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:30486 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754784Ab3AHIlv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jan 2013 03:41:51 -0500
Content-Disposition: inline
In-Reply-To: <20130108093557.8a29d4a04b95702fc59790ff@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Tue, Jan 08, 2013 at 09:35:57AM +1100, Stephen Rothwell wrote:
> Hi Vinod,
> 
> In commit 548860697046 ("dmaengine: dw_dmac: Enhance device tree
> support") (which was changed since yesterday :-(),
Yes due to build conflict I redid the rebase of my tree.

> an instance of
> __devinit has been added.  We are in the process of making CONFIG_HOTPLUG
> always true, and since commit 78d86c213f28 ("init.h: Remove __dev*
> sections from the kernel") (included in v3.7), __devinit does nothing.
> Please do not add any more.
I think I was trying to remove it. Anyway I have changed the commit to remove
this and also another instance. So you should be happy about it :)
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
