From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the clk tree with the driver-core
 tree
Date: Wed, 30 Jul 2014 15:35:59 -0700
Message-ID: <20140730223559.GB9004@kroah.com>
References: <20140730185708.12a99f00@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45903 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754085AbaG3Wg3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Jul 2014 18:36:29 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by gateway1.nyi.internal (Postfix) with ESMTP id C742625CD0
	for <linux-next@vger.kernel.org>; Wed, 30 Jul 2014 18:36:27 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140730185708.12a99f00@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kim Phillips <kim.phillips@freescale.com>

On Wed, Jul 30, 2014 at 06:57:08PM +1000, Stephen Rothwell wrote:
> Hi Mike,
> 
> Today's linux-next merge of the clk tree got a conflict in
> drivers/base/platform.c between commit 3d713e0e382e ("driver core:
> platform: add device binding path 'driver_override'") from the
> driver-core tree and commit 86be408bfbd8 ("clk: Support for clock
> parents and rates assigned from device tree") from the clk tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
