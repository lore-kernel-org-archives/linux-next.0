From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the spi
 tree
Date: Tue, 5 Feb 2013 22:03:44 -0800
Message-ID: <20130206060344.GB3352@kroah.com>
References: <20130206162151.73f40e71f5103e33c19c4c49@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41116 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750761Ab3BFGB2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Feb 2013 01:01:28 -0500
Content-Disposition: inline
In-Reply-To: <20130206162151.73f40e71f5103e33c19c4c49@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>, Jingoo Han <jg1.han@samsung.com>, Grant Likely <grant.likely@secretlab.ca>

On Wed, Feb 06, 2013 at 04:21:51PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in drivers/spi/spi-s3c64xx.c between commit 4eb770067f3a ("spi/s3c64xx: Use devm_clk_get() and devm_request_irq()") from the  tree and commit b0ee5605234a ("spi: Convert to devm_ioremap_resource()") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

greg k-h
