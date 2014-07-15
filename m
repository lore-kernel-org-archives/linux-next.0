From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the ia64 tree
Date: Tue, 15 Jul 2014 06:44:58 -0700
Message-ID: <20140715134458.GB17795@kroah.com>
References: <20140715164349.5807b892@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51069 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750954AbaGONpX (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Jul 2014 09:45:23 -0400
Content-Disposition: inline
In-Reply-To: <20140715164349.5807b892@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, "Chen, Gong" <gong.chen@linux.intel.com>, Tony Luck <tony.luck@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>

On Tue, Jul 15, 2014 at 04:43:49PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got conflicts in
> drivers/Kconfig and drivers/Makefile between commit 76ac8275f296
> ("trace, RAS: Add basic RAS trace event") from the ia64 tree and commit
> 16603153666d ("thunderbolt: Add initial cactus ridge NHI support") from
> the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
