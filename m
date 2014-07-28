From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 renesas tree
Date: Sun, 27 Jul 2014 23:09:35 -0700
Message-ID: <20140728060935.GA753@kroah.com>
References: <20140725162353.04cacc71@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45340 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751216AbaG1GKG (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2014 02:10:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by gateway1.nyi.internal (Postfix) with ESMTP id AE9F820AB8
	for <linux-next@vger.kernel.org>; Mon, 28 Jul 2014 02:10:04 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140725162353.04cacc71@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simon Horman <horms@verge.net.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

On Fri, Jul 25, 2014 at 04:23:53PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> arch/arm/mach-shmobile/setup-r7s72100.c between commit 9394af431455
> ("ARM: shmobile: genmai-reference: Enable MTU2 in device tree") from
> the renesas tree and commit d2168146c222 ("platform: Remove most
> references to platform_bus device") from the driver-core tree.
> 
> I fixed it up (the former removed the code that the latter modified)
> and can carry the fix as necessary (no action is required).

Sounds good, thanks.

greg k-h
