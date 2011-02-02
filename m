From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Wed, 2 Feb 2011 13:58:24 -0800
Message-ID: <20110202215824.GA28849@kroah.com>
References: <20110131161640.93d8688a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:34985 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754860Ab1BBWCK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Feb 2011 17:02:10 -0500
Content-Disposition: inline
In-Reply-To: <20110131161640.93d8688a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>

On Mon, Jan 31, 2011 at 04:16:40PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/ste_rmi4/synaptics_i2c_rmi4.c between commit
> f32b8453e5a5587ae112ba478ae0bbad74e83d22 ("Staging: ste_rmi4: use after
> input_unregister_device()") from the staging.current tree and commit
> dc7b202a4ee6cb686e2bbef80c84443f43ec91bd ("staging/ste_rmi4: Remove
> obsolete cleanup for clientdata") from the staging tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.

I've merged with Linus's tree now so this should not be needed anymore.

thanks,

greg k-h
