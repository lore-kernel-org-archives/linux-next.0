From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the thermal
 tree
Date: Wed, 12 Sep 2012 09:13:51 -0700
Message-ID: <20120912161351.GD7273@kroah.com>
References: <20120912155231.716530c364bb20bd43efec0d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53232 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759809Ab2ILQNx (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Sep 2012 12:13:53 -0400
Content-Disposition: inline
In-Reply-To: <20120912155231.716530c364bb20bd43efec0d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eduardo Valentin <eduardo.valentin@ti.com>, Zhang Rui <rui.zhang@intel.com>

On Wed, Sep 12, 2012 at 03:52:31PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/omap-thermal/omap-thermal-common.c between commit
> 76f726fb24bd ("Thermal: Remove tc1/tc2 in generic thermal layer") from
> the thermal tree and commit 765a1939a364 ("staging: omap-thermal: fix
> polling period settings") from the staging tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary
> (no action is required).
> 


Looks good to me, thanks.

greg k-h
