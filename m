From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Tue, 7 Mar 2017 09:47:29 +0100
Message-ID: <20170307084729.GB20446@kroah.com>
References: <20170307122542.49126980@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:47786 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754750AbdCGItQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Mar 2017 03:49:16 -0500
Content-Disposition: inline
In-Reply-To: <20170307122542.49126980@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

On Tue, Mar 07, 2017 at 12:25:42PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/staging/media/atomisp/i2c/mt9m114.c:38:41: fatal error: linux/atomisp_gmin_platform.h: No such file or directory
> drivers/staging/media/atomisp/i2c/gc2235.c:32:41: fatal error: linux/atomisp_gmin_platform.h: No such file or directory
> drivers/staging/media/atomisp/i2c/ov2722.c:32:41: fatal error: linux/atomisp_gmin_platform.h: No such file or directory

I really can't duplicate this here, but you and the kbuild bot are
hitting this now.  in drivers/staging/media/atomisp/Makefile we have:
	LINUXINCLUDE        += -I drivers/staging/media/atomisp/include/
to point the include path at where atomisp_gmin_platform.h is at.

So I don't understand what is going on here.  Alan, any hints?

thanks,

greg k-h
