From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning
Date: Thu, 16 Oct 2008 09:04:12 -0700
Message-ID: <20081016160412.GA27769@kroah.com>
References: <20081016170410.bf919b38.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:42484 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754762AbYJPQIY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 12:08:24 -0400
Content-Disposition: inline
In-Reply-To: <20081016170410.bf919b38.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hannes Reinecke <hare@suse.de>, linux-next@vger.kernel.org

On Thu, Oct 16, 2008 at 05:04:10PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build gives this warning:
> 
> drivers/net/wireless/iwlwifi/iwl3945-base.c: In function 'iwl3945_pci_probe':
> drivers/net/wireless/iwlwifi/iwl3945-base.c:7871: warning: passing argument 1 of 'dev_get_drvdata' from incompatible pointer type
> 
> Git blame points at commit 64d3bd686e868597694bb3088bdfe2de362c8358
> ("Driver core: Use dev_get_drvdata() accessors").  I suspect that the
> conversion in iwl3945_pci_probe should not have been done.

Yes, I'm going to drop that patch and split it up into the proper
pieces, like it should have in the first place :(

thanks,

greg k-h
