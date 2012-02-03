From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 driver-core.current tree
Date: Fri, 3 Feb 2012 07:07:15 -0800
Message-ID: <20120203150715.GA19534@kroah.com>
References: <20120203145106.3c166564b7081d94ee2e79cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41736 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756032Ab2BCPJP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Feb 2012 10:09:15 -0500
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id C1A50207FB
	for <linux-next@vger.kernel.org>; Fri,  3 Feb 2012 10:09:14 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20120203145106.3c166564b7081d94ee2e79cd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Renninger <trenn@suse.de>

On Fri, Feb 03, 2012 at 02:51:06PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/base/cpu.c between commit 2885e25c422f ("driver core: cpu: remove
> kernel warning when removing a cpu") from the driver-core.current tree
> and commit fad12ac8c8c2 ("CPU: Introduce ARCH_HAS_CPU_AUTOPROBE and X86
> parts") from the driver-core tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Thanks for this, I'll fix it up when I merge them back together when
3.3-rc3 comes out.

greg k-h
