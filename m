From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the drm
 tree
Date: Wed, 23 Jul 2014 23:23:23 -0700
Message-ID: <20140724062323.GC19567@kroah.com>
References: <20140724155630.2727ad65@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:44085 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934045AbaGXGXu (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Jul 2014 02:23:50 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by gateway1.nyi.internal (Postfix) with ESMTP id 2AC162104D
	for <linux-next@vger.kernel.org>; Thu, 24 Jul 2014 02:23:48 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140724155630.2727ad65@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>

On Thu, Jul 24, 2014 at 03:56:30PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/gpu/drm/armada/armada_crtc.c between commit d8c96083cf5e
> ("drm/armada: permit CRTCs to be registered as separate devices") from
> the drm tree and commit c9d53c0f2d23 ("devres: remove
> devm_request_and_ioremap()") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
