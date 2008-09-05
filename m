From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] ucb1400_ts depends SND_AC97_BUS
Date: Thu, 4 Sep 2008 21:44:44 -0700
Message-ID: <20080904214444.0dccf859.randy.dunlap@oracle.com>
References: <20061209003635.e778ff76.randy.dunlap@oracle.com>
	<200612092150.02940.dtor@insightbb.com>
	<20061209185737.1768315d.randy.dunlap@oracle.com>
	<200612092205.19358.dtor@insightbb.com>
	<Pine.LNX.4.64.0612092212410.2630@xanadu.home>
	<20061209210945.5abe2d89.randy.dunlap@oracle.com>
	<Pine.LNX.4.64.0612102244140.2630@xanadu.home>
	<20080904195744.f367cd2d.randy.dunlap@oracle.com>
	<alpine.LFD.1.10.0809050028590.23787@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:49962 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750720AbYIEEpD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Sep 2008 00:45:03 -0400
In-Reply-To: <alpine.LFD.1.10.0809050028590.23787@xanadu.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Pitre <nico@cam.org>
Cc: Dmitry Torokhov <dtor@insightbb.com>, lkml <linux-kernel@vger.kernel.org>, akpm <akpm@osdl.org>, linux-next@vger.kernel.org

On Fri, 05 Sep 2008 00:37:17 -0400 (EDT) Nicolas Pitre wrote:

> On Thu, 4 Sep 2008, Randy Dunlap wrote:
> 
> > On Sun, 10 Dec 2006 22:55:25 -0500 (EST) Nicolas Pitre wrote:
> > 
> > > On Sat, 9 Dec 2006, Randy Dunlap wrote:
> > > 
> > > > On Sat, 09 Dec 2006 22:17:55 -0500 (EST) Nicolas Pitre wrote:
> > > > 
> > > > > Please consider what SND_CONFIG_AC97_BUS corresponds to.  It is 
> > > > > sound/pci/ac97/ac97_bus.c and if you look into this file you'll see that 
> > > > > it is perfectly buildable even if sound is entirely configured out, just 
> > > > > like some lib code would be.
> > > > 
> > > > OK.  Should it (CONFIG_SND_AC97_BUS -> sound/pci/ac97/ac97_bus.c)
> > > > be buildable when sound is disabled?
> > > 
> > > Yes.
> > > 
> > > > If so, where should it be moved to (since afaik, make won't even
> > > > descend into sound/ if SOUND=n; I don't see that changing
> > > > any time soon).
> > > 
> > > What about this patch?
> > 
> > Can we get this patch or some patch into the input tree for linux-next?
> 
> This patch is commit e1036502e5263851259d147771226161e5ccc85a and 
> appeared in mainline almost 2 years ago.

Ack.  Sorry about that.  Wrong ucb thread.

ucb1400_core still has build errors in linux-next
since it uses ac97_bus_type even when CONFIG_SOUND=n.


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
