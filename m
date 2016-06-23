From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
Date: Thu, 23 Jun 2016 11:43:29 -0500
Message-ID: <20160623164329.GD17987@localhost>
References: <20160623114429.1815794f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:46248 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750950AbcFWQnd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jun 2016 12:43:33 -0400
Content-Disposition: inline
In-Reply-To: <20160623114429.1815794f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>, Jens Axboe <axboe@fb.com>

On Thu, Jun 23, 2016 at 11:44:29AM +1000, Stephen Rothwell wrote:
> Hi Bjorn,
> 
> Today's linux-next merge of the pci tree got a conflict in:
> 
>   drivers/nvme/host/pci.c
> 
> between commit:
> 
>   edb50a5403d2 ("NVMe: Only release requested regions")
> 
> from Linus' tree and commit:
> 
>   a1f447b35b72 ("NVMe: Use pci_(request|release)_mem_regions")
> 
> from the pci tree.
> 
> I fixed it up (I just used the pci tree version of this file) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Thanks for the heads-up.  I think using the pci tree version is the
correct resolution.

Bjorn
