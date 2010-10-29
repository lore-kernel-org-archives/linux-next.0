From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next: Tree for October 29 (staging/ath6kl)
Date: Fri, 29 Oct 2010 16:51:25 -0700
Message-ID: <20101029235125.GA22122@suse.de>
References: <20101029121148.d27e03bc.sfr@canb.auug.org.au>
 <20101029161610.99e6f4ef.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:46928 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751003Ab0J2Xw3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Oct 2010 19:52:29 -0400
Content-Disposition: inline
In-Reply-To: <20101029161610.99e6f4ef.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Chris Ball <cjb@laptop.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Oct 29, 2010 at 04:16:10PM -0700, Randy Dunlap wrote:
> On Fri, 29 Oct 2010 12:11:48 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> 
> 
> drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c:288: error: 'struct mmc_host' has no member named 'max_hw_segs'
> drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c:289: error: 'struct mmc_host' has no member named 'max_hw_segs'

Looks like it was caused by:
	a36274e0184193e393fb82957925c3981a6b0477

	mmc: Remove distinction between hw and phys segments


and it's a simple fix.  I'll do it after -rc1 is out as I'm on my way to
Boston now...

thanks,

greg k-h
