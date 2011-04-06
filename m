From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Tue, 5 Apr 2011 22:12:57 -0700
Message-ID: <20110406051257.GA9065@kroah.com>
References: <20110406144122.8d67030e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:46611 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750738Ab1DFFNf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Apr 2011 01:13:35 -0400
Content-Disposition: inline
In-Reply-To: <20110406144122.8d67030e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Olaf Hering <olaf@aepfle.de>, Hank Janssen <hjanssen@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>

On Wed, Apr 06, 2011 at 02:41:22PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/hv/vmbus_drv.c between commit 22356585712d ("staging: hv:
> use sync_bitops when interacting with the hypervisor") from the
> staging.current tree and commit 98e087022b61 ("staging: hv: Remove all
> unneeded DPRINT from hv_vmbus") from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks, yes, that looks correct, I'll resolve the conflict when I send
the staging-linus tree to Linus in a few days.

thanks,

greg k-h
