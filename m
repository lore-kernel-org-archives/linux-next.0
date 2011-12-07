From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: linux-next not booting on snowball
Date: Tue, 6 Dec 2011 23:09:29 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1112062227120.2907@xanadu.home>
References: <4ED79454.1090304@linaro.org> <20111201145801.GB2103@sirena.org.uk> <4ED79E9F.7060103@linaro.org> <alpine.LFD.2.02.1112011400380.2357@xanadu.home> <4ED8087F.7030507@linaro.org> <alpine.LFD.2.02.1112011856310.2357@xanadu.home>
 <4ED90B6F.6050205@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:53132 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753459Ab1LGEJg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2011 23:09:36 -0500
Received: by qcqz2 with SMTP id z2so69639qcq.19
        for <linux-next@vger.kernel.org>; Tue, 06 Dec 2011 20:09:36 -0800 (PST)
In-Reply-To: <4ED90B6F.6050205@linaro.org>
Content-ID: <alpine.LFD.2.02.1112062248251.2907@xanadu.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Lists Linaro-dev <linaro-dev@lists.linaro.org>, Stephen Warren <swarren@nvidia.com>, Kevin Hilman <khilman@ti.com>, Jamie Iles <jamie@jamieiles.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Fri, 2 Dec 2011, Daniel Lezcano wrote:

> ##########################################################################
> ## ez-pine-gpg v0.4h ## http://Business-PHP.com/opensource/ez-pine-gpg/
> ## Tue Dec  6 22:27:12 EST 2011 ## xanadu.home
> ##########################################################################
> gpg: Signature made Fri 02 Dec 2011 12:31:27 PM EST using RSA key ID A9506600
> gpg: Can't check signature: public key not found
> %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
> %%%%%%%%%%%% Something went wrong --- See above for more info %%%%%%%%%%%%
> %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 12/02/2011 01:11 AM, Nicolas Pitre wrote:
> > Yes.  Either you have access to a fancy debugger and then you could 
> > trace what happens from the moment devicemaps_init() is entered.
> > 
> > Or, using the good old way, just insert a couple of
> > 
> > 	printk("%s:%s line %d\n", __FILE__, __func__, __LINE__);
> > 
> > in a couple places (still with the 2 earlier patches applied).  Good 
> > locations for those traces would be:
> > 
> >  - Upon entering devicemaps_init() to confirm it makes that far.
> > 
> >  - Just before and right after the call to mdesc->map_io(), still in 
> >    devicemaps_init().
> > 
> >  - If you don't see the trace after mdesc->map_io(), then the problem is
> >    most likely in u8500_map_io(), in which case you should add more 
> >    traces in there to narrow the problem area down to the problematic
> >    call.
> 
> The kernel hangs at:
> 
> u8500_map_io
>  -> ux500_map_io
>    -> ux500_read_asicid(addr=9001dbf4), base=9001d000
>      ->  readl(__io_address(9001dbf4)=f901dbf4);

OK, forget my debug patches then.  They won't help you in that case 
because the ux500_read_asicid code is cheating.  It is expecting 
mappings from the iotable_init() to be valid right away.  The 
local_flush_tlb_all() + flush_cache_all() calls that follows are a clear 
indicator of a layering violation here.  My debugging patch expressly 
doesn't make those mappings effective untill they're all set up in order 
to preserve the debug UART alive.  So the readl() is crashing the kernel 
since there is no actual mapping for it.

If my install_temp_mm() code is disabled (make it #if 0 instead of 
#ifdef CONFIG_DEBUG_LL), execution should go past that point as the 
needed mapping would be installed and ux500_map_io() would complete its 
job.

In fact, the first thing that u8500_map_io() does is to re-map the debug 
UART so you should be able to continue tracing the code past that point 
(or past the call to ux500_map_io() given its included cache/TLB 
flushes).

So try this:

 - Disable the install_temp_mm() code.

 - Remove all printk traces you added so far.

 - Keep the printascii() hack in printk.c active.

 - Test that kernel and see what you get.

 - If still nothing then resume adding your printk traces but only from 
   the moment ux500_map_io() returned in u8500_map_io() and beyond.


Nicolas
