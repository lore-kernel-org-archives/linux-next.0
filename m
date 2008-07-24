From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core.current tree
Date: Thu, 24 Jul 2008 08:09:18 -0700
Message-ID: <20080724150918.GE10549@kroah.com>
References: <20080724105753.3eb6ed07.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:42224 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752193AbYGXPLq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jul 2008 11:11:46 -0400
Content-Disposition: inline
In-Reply-To: <20080724105753.3eb6ed07.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Maciej Sosnowski <maciej.sosnowski@intel.com>

On Thu, Jul 24, 2008 at 10:57:53AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core.current tree got a conflict
> in drivers/dca/dca-sysfs.c between commit
> 7f1b358a236ee9c19657a619ac6f2dcabcaa0924 ("I/OAT: I/OAT version 3.0
> support") from Linus' tree and commit
> 25070eca3d7d3a04e45ceeb37c15ef73800817b0 ("device create: misc: convert
> device_create_drvdata to device_create") from the driver-core.current
> tree.
> 
> The former changed the last parameter to device_create_drvdata().  I did
> the obvious fixup.

Thanks, I'll do the same when I rebase today.

greg k-h
