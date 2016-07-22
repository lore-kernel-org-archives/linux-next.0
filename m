From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Fri, 22 Jul 2016 14:08:35 +0200
Message-ID: <4317240.GoBAVxA9mF@vostro.rjw.lan>
References: <20160722115620.086b28ca@canb.auug.org.au> <20160722022628.GE27987@graphite.smuckle.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:49797 "HELO
	cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753340AbcGVMDj (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Jul 2016 08:03:39 -0400
In-Reply-To: <20160722022628.GE27987@graphite.smuckle.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve Muckle <steve.muckle@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>, kbuild-all@01.org

On Thursday, July 21, 2016 07:26:28 PM Steve Muckle wrote:
> On Fri, Jul 22, 2016 at 11:56:20AM +1000, Stephen Rothwell wrote:
> > Hi Rafael,
> > 
> > After merging the pm tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > ERROR: "cpufreq_driver_resolve_freq" [kernel/sched/cpufreq_schedutil.ko] undefined!
> > 
> > Caused by commit
> > 
> >   5cbea46984d6 ("cpufreq: schedutil: map raw required frequency to driver frequency")
> > 
> > I used the pm tree from next-20160721 for today.
> 
> Sorry - I have just sent a patch to address this.

OK, thanks!

Interestingly enough, that hasn't been caught by 0-day.

Thanks,
Rafael
