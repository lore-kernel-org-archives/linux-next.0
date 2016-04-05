From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Mon, 4 Apr 2016 21:41:45 -0700
Message-ID: <20160405044145.GB28647@kroah.com>
References: <20160405130326.03c74125@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41177 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752622AbcDEElz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Apr 2016 00:41:55 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 115E220AA1
	for <linux-next@vger.kernel.org>; Tue,  5 Apr 2016 00:41:54 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20160405130326.03c74125@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Irina Tirdea <irina.tirdea@intel.com>, Jonathan Cameron <jic23@kernel.org>

On Tue, Apr 05, 2016 at 01:03:26PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/iio/gyro/bmg160_core.c
> 
> between commit:
> 
>   b475c59b113d ("iio: gyro: bmg160: fix buffer read values")
> 
> from the staging.current tree and commit:
> 
>   7e3d1eb123d8 ("iio: accel: bmg160: optimize transfers in trigger handler")
> 
> from the staging tree.
> 
> I fixed it up (I used the version from the staging tree) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Jonathan warned me about this, thanks for resolving it in your tree.
I'll fix it up in mine once they merge back together in a few weeks.

thanks,

greg k-h
