From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: comment in commit in the slave-dma tree (dmaengine:
 dw_dmac: Enhance device tree support)
Date: Mon, 7 Jan 2013 14:43:08 -0800
Message-ID: <20130107224308.GB27477@kroah.com>
References: <20130108093557.8a29d4a04b95702fc59790ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:48805 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753910Ab3AGWnM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jan 2013 17:43:12 -0500
Received: by mail-pb0-f43.google.com with SMTP id um15so10872545pbc.2
        for <linux-next@vger.kernel.org>; Mon, 07 Jan 2013 14:43:11 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20130108093557.8a29d4a04b95702fc59790ff@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vinod Koul <vinod.koul@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

On Tue, Jan 08, 2013 at 09:35:57AM +1100, Stephen Rothwell wrote:
> Hi Vinod,
> 
> In commit 548860697046 ("dmaengine: dw_dmac: Enhance device tree
> support") (which was changed since yesterday :-(), an instance of
> __devinit has been added.  We are in the process of making CONFIG_HOTPLUG
> always true, and since commit 78d86c213f28 ("init.h: Remove __dev*
> sections from the kernel") (included in v3.7), __devinit does nothing.
> Please do not add any more.

That brings up something I wanted to ask you.

I'd like to send a patch to Linus to just delete __devinit and friends
entirely from init.h, but that will break the linux-next tree from
building in places (like this one, and in a few others.)

Is that ok?  That should finally get everyone's attention and keep them
from the cargo-cult programming mode of using these attributes :)

thanks,

greg k-h
