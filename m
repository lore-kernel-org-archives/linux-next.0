From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: input tree build failure
Date: Tue, 19 Aug 2008 09:01:24 -0400
Message-ID: <20080819084729.ZZRA012@mailhub.coreip.homeip.net>
References: <20080819163148.159c7d8c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wx-out-0506.google.com ([66.249.82.225]:50279 "EHLO
	wx-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753691AbYHSNBk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Aug 2008 09:01:40 -0400
Received: by wx-out-0506.google.com with SMTP id h29so2703365wxd.4
        for <linux-next@vger.kernel.org>; Tue, 19 Aug 2008 06:01:38 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20080819163148.159c7d8c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, "Alfred E. Heggestad" <aeh@db.org>

On Tue, Aug 19, 2008 at 04:31:48PM +1000, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/input/misc/cm109.c: In function 'cm109_usb_suspend':
> drivers/input/misc/cm109.c:768: error: implicit declaration of function 'info'
> 
> Caused by commit c04148f915e5ba7947752e6348e0da4cdab1329e ("Input: add
> driver for USB VoIP phones with CM109 chipset") adding a usage of the info
> () function while commit 8aac48f4f2460b00468fd5f1101addf3df04e94c ("USB:
> remove info() macro from usb.h") from the usb tree removed it.
> 
> I applied the following patch (which may not be the best).

Thank you Stephen, but I wonder if total removal of info() and warn()
is a good thing, since they provide standard way of outputting data
from modules when there is no device, i.e. at the time of driver
registration or removal.

Greg, do you think we could keep err, warn and info (maybe renaming to
dr_err, dr_warn and dr_info and probably moving them to kernel.h)
while still taking the parts of your patch that convert drivers to use
dev_* macros when possible?

-- 
Dmitry
