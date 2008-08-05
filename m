From: Adrian Bunk <bunk@kernel.org>
Subject: Re: linux-next: mfd tree build failure
Date: Tue, 5 Aug 2008 19:05:25 +0300
Message-ID: <20080805160524.GE22895@cs181140183.pp.htv.fi>
References: <20080806000856.a5609577.sfr@canb.auug.org.au> <1217950794.18866.32.camel@wirenth>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:57970 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754516AbYHEQGs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 12:06:48 -0400
Content-Disposition: inline
In-Reply-To: <1217950794.18866.32.camel@wirenth>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ian <spyro@f2s.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Ortiz <sameo@openedhand.com>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Tue, Aug 05, 2008 at 04:39:54PM +0100, ian wrote:
> On Wed, 2008-08-06 at 00:08 +1000, Stephen Rothwell wrote:
> > Hi Samuel,
> > 
> > Today's linux-next build (sparc allmodconfig) failed like this:
> > 
> > drivers/mfd/t7l66xb.c:167: error: implicit declaration of function
> > `get_irq_data'
> 
> Hi.
> 
> I'd have expected the other TMIO drivers to fail too.
> 
> get_irq_data is defined in linux/irq.h only if 
> 
> CONFIG_GENERIC_HARDIRQs is set and you arent on S390 (so why doesnt S390
> fail?)
>...

The "Multifunction device drivers" menu depends on HAS_IOMEM.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
