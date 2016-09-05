From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: manual merge of the tty tree with the slave-dma tree
Date: Mon, 5 Sep 2016 16:58:02 +0530
Message-ID: <20160905112802.GJ9355@localhost>
References: <20160905164321.4dd8801b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:15221 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755059AbcIELTx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Sep 2016 07:19:53 -0400
Content-Disposition: inline
In-Reply-To: <20160905164321.4dd8801b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nandor Han <nandor.han@ge.com>, Dave Jiang <dave.jiang@intel.com>

On Mon, Sep 05, 2016 at 04:43:21PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   drivers/dma/imx-sdma.c
> 
> between commit:
> 
>   48dc77e2d4fc ("dmaengine: imx-sdma: convert callback to helper function")
> 
> from the slave-dma tree and commit:
> 
>   15f30f513111 ("dmaengine: imx-sdma - reduce transfer latency for DMA cyclic clients")
> 
> from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Stephen,

The fix looks right to me.

Greg let me know if you would like me to merge this to avoid conflict

-- 
~Vinod
