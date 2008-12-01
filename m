From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the driver-core tree
Date: Mon, 1 Dec 2008 09:23:14 +0000
Message-ID: <20081201092314.GA28971@flint.arm.linux.org.uk>
References: <20081201111552.8b1cbf9b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:51634 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750748AbYLAJXi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Dec 2008 04:23:38 -0500
Content-Disposition: inline
In-Reply-To: <20081201111552.8b1cbf9b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Kay Sievers <kay.sievers@vrfy.org>, David Woodhouse <dwmw2@infradead.org>

On Mon, Dec 01, 2008 at 11:15:52AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/mtd/maps/integrator-flash.c between commit
> ffc86cf850dcd0e181a69c6fa0217d6c7ddf9c85 ("Add armflash support for
> multiple blocks of flash") from the arm tree and commit
> 0b1ea7e6450b3cc2e87d1c7295439483d007bb6e ("mtd: struct device - replace
> bus_id with dev_name(), dev_set_name()") from the driver-core tree.
> 
> I fixed it up (see below).  Maybe you, Russell and David Woodhouse could
> sort out who should coordinate these updates.

Or maybe Catalin rather than me.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
