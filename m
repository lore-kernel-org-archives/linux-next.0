From: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failure after merge of the final tree (drm
 tree related)
Date: Thu, 6 Jan 2011 05:56:48 +0000 (GMT)
Message-ID: <alpine.DEB.2.00.1101060556170.15019@skynet.skynet.ie>
References: <20110106160309.7c8e0d16.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gir.skynet.ie ([193.1.99.77]:56124 "EHLO gir.skynet.ie"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751118Ab1AFF5J (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Jan 2011 00:57:09 -0500
In-Reply-To: <20110106160309.7c8e0d16.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/gpu/drm/radeon/radeon_device.c: In function 'radeon_device_init':
> drivers/gpu/drm/radeon/radeon_device.c:783: error: too many arguments to function 'vga_switcheroo_register_client'

Thanks, noticed it myself this morning, fixed pushed to my tree so should 
be good tomorrow.

Dave.
