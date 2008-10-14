From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree
Date: Mon, 13 Oct 2008 20:51:35 -0700
Message-ID: <20081014035135.GA31535@kroah.com>
References: <20081014135018.fbdfcff6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:41461 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754741AbYJNDxC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Oct 2008 23:53:02 -0400
Content-Disposition: inline
In-Reply-To: <20081014135018.fbdfcff6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, Oct 14, 2008 at 01:50:18PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> arch/x86/kernel/traps.c, arch/x86/kernel/traps_32.c and
> arch/x86/kernel/traps_64.c between various commits from Linus' tree and
> commit 9f3c643d0d55424a469a28d463a2ae74a16ba721 ("sysfs: crash
> debugging") from the driver-core tree.
> 
> The two traps_{64,32}.c files have been merged into the traps.c file but
> the code modified by the driver-core patch has been moved to dumpstack_
> {64,32}.c anyway.
> 
> I applied the following patch.
> 
> Time to update.

Yes, I need to resync, thanks for this, and the other patches.

greg k-h
