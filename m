From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the driver-core tree
Date: Mon, 01 Dec 2008 11:17:02 +0000
Message-ID: <1228130222.25929.43.camel@pc1117.cambridge.arm.com>
References: <20081201111552.8b1cbf9b.sfr@canb.auug.org.au>
	 <20081201092314.GA28971@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:61017 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750748AbYLAL3P (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Dec 2008 06:29:15 -0500
In-Reply-To: <20081201092314.GA28971@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, David Woodhouse <dwmw2@infradead.org>

On Mon, 2008-12-01 at 09:23 +0000, Russell King wrote:
> On Mon, Dec 01, 2008 at 11:15:52AM +1100, Stephen Rothwell wrote:
> > Today's linux-next merge of the driver-core tree got a conflict in
> > drivers/mtd/maps/integrator-flash.c between commit
> > ffc86cf850dcd0e181a69c6fa0217d6c7ddf9c85 ("Add armflash support for
> > multiple blocks of flash") from the arm tree and commit
> > 0b1ea7e6450b3cc2e87d1c7295439483d007bb6e ("mtd: struct device - replace
> > bus_id with dev_name(), dev_set_name()") from the driver-core tree.
> > 
> > I fixed it up (see below).  Maybe you, Russell and David Woodhouse could
> > sort out who should coordinate these updates.
> 
> Or maybe Catalin rather than me.

Sorry for this, I didn't follow the linux-next tree. I sent the patch to
Russell as he wrote the initial driver but I should have cc'ed David W.
as well.

The fix looks alright. Should I resend an updated patch?

Thanks.

-- 
Catalin
