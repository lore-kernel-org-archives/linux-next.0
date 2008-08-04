From: Thomas Meyer <thomas@m3y3r.de>
Subject: Re: next-20080725: System hangs while suspending to disk
Date: Mon, 04 Aug 2008 13:35:19 +0200
Message-ID: <1217849719.4896e9771be61@213.133.104.17>
References: <1217145731.3053.6.camel@dhcppc2> <20080804112811.GA12844@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www17.your-server.de ([213.133.104.17]:38106 "EHLO
	www17.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752570AbYHDLfo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Aug 2008 07:35:44 -0400
In-Reply-To: <20080804112811.GA12844@atrey.karlin.mff.cuni.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pavel Machek <pavel@suse.cz>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

Zitat von Pavel Machek <pavel@suse.cz>:

> > I tried to get some console output, so i tried "test" instead of
> > plattform and got an oops in native_cpu_up().
> > 
> > When i do "echo 0 > /sys/devices/system/cpu/cpu1/online" and
> > "echo 1 > /sys/devices/system/cpu/cpu1/online" again, i get the
> > same Oops report (as compared to a "test run with state disk")
> > 
> >
>
http://kerneloops.org/guilty.php?guilty=native_cpu_up&version=2.6.26-release&start=1736704&end=1769471&class=oops
> > 
> > What is wrong here?
> 
> You may want to ping cpu hotplug people.

Problem is already solved. See commit 583323b9d2f624884a8c9563fb5a4d795f39ab07

Vegard Nossum did take care of the problem. See also thread "-git: BUG: unable
to handle kernel paging request at c0100248 [CPU hotplug]" from 27.07.

Suspending to disk works fine now.
