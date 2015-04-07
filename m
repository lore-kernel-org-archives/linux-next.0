From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the slave-dma tree
Date: Tue, 7 Apr 2015 11:52:36 +0200
Message-ID: <20150407095236.GA7071@kroah.com>
References: <20150407192808.375a5d91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:33602 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753805AbbDGJwj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2015 05:52:39 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 6115820B3F
	for <linux-next@vger.kernel.org>; Tue,  7 Apr 2015 05:52:34 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20150407192808.375a5d91@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vinod Koul <vinod.koul@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Xuelin Shi <xuelin.shi@freescale.com>

On Tue, Apr 07, 2015 at 07:28:08PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/dma/Kconfig between commit ad80da658bbc ("dmaengine: Driver
> support for FSL RaidEngine device") from the slave-dma tree and commit
> 2b49e0c56741 ("dmaengine: append hsu DMA driver") from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

greg k-h
