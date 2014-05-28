From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the iommu
 tree
Date: Wed, 28 May 2014 11:35:23 -0700
Message-ID: <20140528183523.GA16719@kroah.com>
References: <20140528175531.4ce48afd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56916 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751353AbaE1Sbt (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 28 May 2014 14:31:49 -0400
Content-Disposition: inline
In-Reply-To: <20140528175531.4ce48afd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joerg Roedel <joro@8bytes.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.de>, Cho KyongHo <pullip.cho@samsung.com>, Shaik Ameer Basha <shaik.ameer@samsung.com>

On Wed, May 28, 2014 at 05:55:31PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/iommu/exynos-iommu.c between commit 7222e8db2d50
> ("iommu/exynos: Fix build errors") from the iommu tree and commit
> 8283b4919e00 ("driver core: dev_set_drvdata can no longer fail") from
> the driver-core tree.
> 
> I fixed it up (the former removed the code changed by the latter) and
> can carry the fix as necessary (no action is required).

Sounds good, thanks.

greg k-h
