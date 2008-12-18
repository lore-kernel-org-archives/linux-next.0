From: Samuel Ortiz <sameo@openedhand.com>
Subject: Re: linux-next: Tree for December 15 (mfd)
Date: Thu, 18 Dec 2008 11:57:01 +0100
Message-ID: <20081218105700.GC2517@sortiz.org>
References: <20081216020642.fc1007d9.sfr@canb.auug.org.au> <4946AF6A.8030107@oracle.com> <20081217114300.9476f8da.randy.dunlap@oracle.com>
Reply-To: Samuel Ortiz <sameo@openedhand.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]:45462 "EHLO
	pug.o-hand.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750746AbYLRKyf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Dec 2008 05:54:35 -0500
Content-Disposition: inline
In-Reply-To: <20081217114300.9476f8da.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, David Brownell <david-b@pacbell.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Dec 17, 2008 at 11:43:00AM -0800, Randy Dunlap wrote:
> On Mon, 15 Dec 2008 11:26:34 -0800 Randy Dunlap wrote:
> 
> > Lots of mfd build failures like this:
> > 
> > 
> > build-r7123.out:/local/linsrc/linux-next-20081215/drivers/mfd/twl4030-irq.c:183: error: 'irq_desc' undeclared (first use in this function)
> > build-r7123.out:/local/linsrc/linux-next-20081215/drivers/mfd/twl4030-irq.c:455: error: 'irq_desc' undeclared (first use in this function)
> > build-r7123.out:/local/linsrc/linux-next-20081215/drivers/mfd/twl4030-irq.c:515: error: 'irq_desc' undeclared (first use in this function)
> > build-r7123.out:make[3]: *** [drivers/mfd/twl4030-irq.o] Error 1
> 
> 
> This build error still happens in linux-next-20081217.
It should be fixed with the latest mfd tree.
David, are you ok with this fix:
http://git.o-hand.com/cgit.cgi/linux-mfd/commit/?h=for-next&id=1e6b6a411fd4f6f99e4d9f003946823007e3c34f

Cheers,
Samuel.

 
> It only occurs when I2C=y (see drivers/mfd/Kconfig).
> 
> Stephen, doing an allyesconfig i386 or x86_64 build will catch this,
> then you can drop the mfd tree and hopefully prod someone into fixing this...
> 
> ---
> ~Randy

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
