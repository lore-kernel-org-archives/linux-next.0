From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the final tree (usb
 tree related)
Date: Fri, 13 Aug 2010 07:49:29 -0700
Message-ID: <20100813144929.GA25259@kroah.com>
References: <20100802141823.143b2a36.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:49251 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934371Ab0HMO6X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Aug 2010 10:58:23 -0400
Content-Disposition: inline
In-Reply-To: <20100802141823.143b2a36.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>

On Mon, Aug 02, 2010 at 02:18:23PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) produced these warnings:
> 
> /scratch/sfr/next/drivers/usb/gadget/storage_common.c:718: warning: 'fsg_show_nofua' defined but not used
> /scratch/sfr/next/drivers/usb/gadget/storage_common.c:782: warning: 'fsg_store_nofua' defined but not used
> /scratch/sfr/next/drivers/usb/gadget/storage_common.c:718: warning: 'fsg_show_nofua' defined but not used
> /scratch/sfr/next/drivers/usb/gadget/storage_common.c:782: warning: 'fsg_store_nofua' defined but not used
> 
> Introduced by commit ed4825f7332669779540be27cb263daf22af3b1c ("USB:
> gadget: storage: optional SCSI WRITE FUA bit") from the usb tree.

Sorry about missing this, I have a patch to fix this up now.

greg k-h
