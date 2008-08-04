From: Pavel Machek <pavel@suse.cz>
Subject: Re: next-20080725: System hangs while suspending to disk
Date: Mon, 4 Aug 2008 13:28:11 +0200
Message-ID: <20080804112811.GA12844@atrey.karlin.mff.cuni.cz>
References: <1217145731.3053.6.camel@dhcppc2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754737AbYHDL2W@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1217145731.3053.6.camel@dhcppc2>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Meyer <thomas@m3y3r.de>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

> I tried to get some console output, so i tried "test" instead of
> plattform and got an oops in native_cpu_up().
> 
> When i do "echo 0 > /sys/devices/system/cpu/cpu1/online" and
> "echo 1 > /sys/devices/system/cpu/cpu1/online" again, i get the
> same Oops report (as compared to a "test run with state disk")
> 
> http://kerneloops.org/guilty.php?guilty=native_cpu_up&version=2.6.26-release&start=1736704&end=1769471&class=oops
> 
> What is wrong here?

You may want to ping cpu hotplug people.


-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
