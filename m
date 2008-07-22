From: Adrian Bunk <bunk@kernel.org>
Subject: Re: linux-next build error (PNP/IXJ)
Date: Tue, 22 Jul 2008 20:39:57 +0300
Message-ID: <20080722173957.GA14846@cs181140183.pp.htv.fi>
References: <20080722102739.61462b04.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:40669 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752996AbYGVRkI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 13:40:08 -0400
Content-Disposition: inline
In-Reply-To: <20080722102739.61462b04.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: bjorn.helgaas@hp.com, linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On Tue, Jul 22, 2008 at 10:27:39AM -0700, Randy Dunlap wrote:
> Hi,
> 
> I'm seeing several build errors in linux-next-20080722 that I haven't
> seen previously, although I don't know what changed to cause this.
> 
> They are all basically the same, in ixj (drivers/telephony/ixj*), when
> CONFIG_PNP=n, and CONFIG_PHONE_IXJ=y or =m (so the actual error message
> varies depending on IXJ=y or =m):
> 
> IXJ=y:
> ixj.c:(.text+0x329d98): undefined reference to `pnp_get_resource'
> or IXJ=m:
> ERROR: "pnp_get_resource" [drivers/telephony/ixj.ko] undefined!
> 
> 
> Suggestions?

Please send a .config

> Thanks,

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
