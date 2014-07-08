From: Joerg Roedel <joro@8bytes.org>
Subject: Re: linux-next: build failure after merge of the iommu tree
Date: Tue, 8 Jul 2014 13:20:10 +0200
Message-ID: <20140708112009.GI1958@8bytes.org>
References: <20140708140246.72b72682@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 8bytes.org ([85.214.48.195]:47181 "EHLO mail.8bytes.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753645AbaGHLUN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2014 07:20:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.8bytes.org (Postfix) with SMTP id 0731E12B16B
	for <linux-next@vger.kernel.org>; Tue,  8 Jul 2014 13:20:10 +0200 (CEST)
Content-Disposition: inline
In-Reply-To: <20140708140246.72b72682@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>

Hi Stephen,

On Tue, Jul 08, 2014 at 02:02:46PM +1000, Stephen Rothwell wrote:
> Caused by commit c61959ecbbc6 ("iommu: Add sysfs support for IOMMUs").
> CONFIG_IOMMU_API is not set for this build.  Forgotten "static
> inline"s :-(
> 
> I have used the iommu tree from next-20140707 for today.

I have committed the patch from Alex and published a new next branch. It
should be fixed now.


Thanks,

	Joerg
