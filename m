From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 driver-core tree
Date: Mon, 28 Nov 2011 14:13:59 +0900
Message-ID: <20111128051359.GB9709@kroah.com>
References: <20111128152222.e6aeb95e31d45f44d8adf615@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:34263 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751647Ab1K1FQe (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Nov 2011 00:16:34 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 591002131D
	for <linux-next@vger.kernel.org>; Mon, 28 Nov 2011 00:16:34 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20111128152222.e6aeb95e31d45f44d8adf615@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>

On Mon, Nov 28, 2011 at 03:22:22PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/iio/adc/ad799x_core.c between commit 6e5af184f810
> ("staging:iio: Use module_i2c_driver to register I2C drivers") from the
> tree and commit 55e4390cb04e ("staging:iio: Add missing
> MODULE_DEVICE_TABLE and MODULE_ALIAS") from the staging tree.
> 
> Just context differences.  I fixed it up (see below) and can carry the
> fix as necessary.

Looks great, thanks.

greg k-h
