From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Wed, 4 Aug 2010 08:52:13 -0700
Message-ID: <20100804155213.GA27244@kroah.com>
References: <20100804142531.aea95c0b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:59919 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754426Ab0HDPxJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Aug 2010 11:53:09 -0400
Content-Disposition: inline
In-Reply-To: <20100804142531.aea95c0b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Narendra K <Narendra_K@dell.com>, Jordan Hargrave <jordan_hargrave@dell.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Guenter Roeck <guenter.roeck@ericsson.com>

On Wed, Aug 04, 2010 at 02:25:31PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/pci/pci-label.c:100: error: unknown field 'owner' specified in initializer
> drivers/pci/pci-label.c:100: warning: initialization from incompatible pointer type
> drivers/pci/pci-label.c:105: error: unknown field 'owner' specified in initializer
> drivers/pci/pci-label.c:105: warning: initialization from incompatible pointer type
> 
> Caused by commit 60cc62ad579afa0eb5bded82e08dd0617d461d52 ("sysfs: Remove
> owner field from sysfs struct attribute") interacting with commit
> 911e1c9b05a8e3559a7aa89083930700a0b9e7ee ("PCI: export SMBIOS provided
> firmware instance and label to sysfs") from the pci tree.
> 
> I applied the following merge fix patch (Jesse, this patch can already be
> applied to the pci tree without problems):

Thanks, your fix looks correct, that field is now gone.

greg k-h
