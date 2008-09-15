From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Mon, 15 Sep 2008 11:58:14 -0700
Message-ID: <20080915185814.GA32003@kroah.com>
References: <20080912135311.c7d43744.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:52070 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753810AbYIOTBd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Sep 2008 15:01:33 -0400
Content-Disposition: inline
In-Reply-To: <20080912135311.c7d43744.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Hannes Reinecke <hare@suse.de>

On Fri, Sep 12, 2008 at 01:53:11PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/net/wireless/atmel_cs.c: In function 'atmel_config':
> drivers/net/wireless/atmel_cs.c:237: error: incompatible type for argument 1 of 'dev_get_drvdata'
> 
> Introduced by commit 107aeb9753159da848f066b26557f0aaab900a90 ("Driver
> core: Use dev_get_drvdata() accessors").  handle_to_dev returns a struct
> device not a struct device *.
> 
> I applied the following patch.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 12 Sep 2008 13:50:07 +1000
> Subject: [PATCH] driver-core: atmel_cs.c fixup
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Merged in, thanks.

greg k-h
