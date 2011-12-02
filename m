From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: linux-next not booting on snowball
Date: Thu, 1 Dec 2011 19:11:18 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1112011856310.2357@xanadu.home>
References: <4ED79454.1090304@linaro.org> <20111201145801.GB2103@sirena.org.uk> <4ED79E9F.7060103@linaro.org> <alpine.LFD.2.02.1112011400380.2357@xanadu.home> <4ED8087F.7030507@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:60704 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755715Ab1LBALX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2011 19:11:23 -0500
Received: by qadb14 with SMTP id b14so853180qad.19
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2011 16:11:22 -0800 (PST)
In-Reply-To: <4ED8087F.7030507@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Lists Linaro-dev <linaro-dev@lists.linaro.org>, Stephen Warren <swarren@nvidia.com>, Kevin Hilman <khilman@ti.com>, Jamie Iles <jamie@jamieiles.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Fri, 2 Dec 2011, Daniel Lezcano wrote:

> On 12/01/2011 08:03 PM, Nicolas Pitre wrote:
> > Please have a look at this email:
> > 
> > http://article.gmane.org/gmane.linux.ports.arm.kernel/141386
> > 
> > There are two patches in there which should help you get some debugging 
> > info out.
> 
> 
> Thanks Nicolas,
> 
> I have applied the patches and I get:
> 
> ---------------------
> 
> <6>Booting Linux on physical CPU 0
> <6>Initializing cgroup subsys cpuset
> <6>Initializing cgroup subsys cpu
> <5>Linux version 3.2.0-rc2+ (dlezcano@monster) (gcc version 4.3.2
> (Debian 4.3.2-1.1) ) #7 SMP PREEMPT Thu Dec 1 2
> 3:58:34 CET 2011
> CPU: ARMv7 Processor [412fc091] revision 1 (ARMv7), cr=10c5387f
> CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> Machine: Calao Systems Snowball platform
> <4>Ignoring unrecognised tag 0x41000403
> Memory policy: ECC disabled, Data cache writealloc
> 
> ---------------------
> 
> I am not able to understand these informations, I hope they can help to
> understand the problem.
> 
> Is there something else I can do to help ?

Yes.  Either you have access to a fancy debugger and then you could 
trace what happens from the moment devicemaps_init() is entered.

Or, using the good old way, just insert a couple of

	printk("%s:%s line %d\n", __FILE__, __func__, __LINE__);

in a couple places (still with the 2 earlier patches applied).  Good 
locations for those traces would be:

 - Upon entering devicemaps_init() to confirm it makes that far.

 - Just before and right after the call to mdesc->map_io(), still in 
   devicemaps_init().

 - If you don't see the trace after mdesc->map_io(), then the problem is
   most likely in u8500_map_io(), in which case you should add more 
   traces in there to narrow the problem area down to the problematic
   call.


Nicolas
