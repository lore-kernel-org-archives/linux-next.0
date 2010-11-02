From: Vipin Mehta <Vipin.Mehta@Atheros.com>
Subject: RE: linux-next: Tree for October 29 (staging/ath6kl)
Date: Tue, 2 Nov 2010 11:37:23 -0700
Message-ID: <35B17FE5076C7040809188FBE7913F983F847B52A2@SC1EXMB-MBCL.global.atheros.com>
References: <20101029121148.d27e03bc.sfr@canb.auug.org.au>
 <20101029161610.99e6f4ef.randy.dunlap@oracle.com>
 <20101029235125.GA22122@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.atheros.com ([12.19.149.2]:32391 "EHLO mail.atheros.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754826Ab0KBShY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2010 14:37:24 -0400
Received: from mail.atheros.com ([10.10.20.105])
	by sidewinder.atheros.com
	for <linux-next@vger.kernel.org>; Tue, 02 Nov 2010 11:37:12 -0700
In-Reply-To: <20101029235125.GA22122@suse.de>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>, Randy Dunlap <randy.dunlap@oracle.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Chris Ball <cjb@laptop.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>


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

I had submitted a patch for this a few weeks back and the required
changes were present in the tag next-20101028. They somehow got
reverted back in the tag next-20101029. Both Greg and Stephen
should have the original patch but I can send it again if it helps.

(Sorry my mutt is acting up so sending it through Outlook)
