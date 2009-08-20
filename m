From: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Date: Thu, 20 Aug 2009 06:30:15 +0100 (IST)
Message-ID: <alpine.DEB.2.00.0908200629470.16909@skynet.skynet.ie>
References: <20090820152743.a5f1088b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gir.skynet.ie ([193.1.99.77]:37614 "EHLO gir.skynet.ie"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751470AbZHTFaM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Aug 2009 01:30:12 -0400
In-Reply-To: <20090820152743.a5f1088b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Hellstrom <thellstrom@vmware.com>


> Hi Dave,
> 
> Today's linux-next merge of the drm tree got a conflict in
> drivers/gpu/drm/radeon/radeon_ttm.c between commit
> ad49f501867cba87e1e45e5ebae0b12435d68bf1 ("drm/ttm/radeon: add dma32
> support") from Linus' tree and commit
> a987fcaa805fcb24ba885c2e29fd4fdb6816f08f ("ttm: Make parts of a struct
> ttm_bo_device global") from the drm tree.

I merged Linus tree soon after and pushed it out so it should be okay now.

Dave.
