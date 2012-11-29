From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 battery tree
Date: Wed, 28 Nov 2012 21:19:15 -0800
Message-ID: <20121129051915.GG4375@kroah.com>
References: <20121129152008.5a74394e46746fa83e70b8ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:54431 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750785Ab2K2FRh (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Nov 2012 00:17:37 -0500
Content-Disposition: inline
In-Reply-To: <20121129152008.5a74394e46746fa83e70b8ff@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, Qing Xu <qingx@marvell.com>, Anton Vorontsov <anton.vorontsov@linaro.org>

On Thu, Nov 29, 2012 at 03:20:08PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/power/max8925_power.c between commit eba3b670a916
> ("max8925_power: Add support for device-tree initialization") from the
> battery tree and commit c8afa6406e60 ("power: remove use of __devinit")
> from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
