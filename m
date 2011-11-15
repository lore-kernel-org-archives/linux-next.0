From: "Yu, Fenghua" <fenghua.yu@intel.com>
Subject: RE: [PATCH] kernel/cpu.c: Add right qualifiers for
 intel_thermal_interrupt() and cpu_hotplug_pm_sync_init()
Date: Mon, 14 Nov 2011 16:02:28 -0800
Message-ID: <493994B35A117E4F832F97C4719C4C0401EE048E46@orsmsx505.amr.corp.intel.com>
References: <1320956564-21334-1-git-send-email-fenghua.yu@intel.com>
 <4EBCCE33.2090708@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:44295 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756676Ab1KOACk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Nov 2011 19:02:40 -0500
In-Reply-To: <4EBCCE33.2090708@linux.vnet.ibm.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-kernel <linux-kernel@vger.kernel.org>, linux-pm <linux-pm@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>

> > -int cpu_hotplug_pm_sync_init(void)
> > +static int __init cpu_hotplug_pm_sync_init(void)
> >  {
> >  	pm_notifier(cpu_hotplug_pm_callback, 0);
> 
> pm_notifier() macro will declare a static variable. I agree this won't
> be any problem functionality-wise. But it doesn't seem elegant to say
> "throw away the function but keep the static variable".
> So, if you want to add __init qualifier to this function, I suggest
> that
> you declare the static variable outside the function, and call
> register_pm_notifier() in the function, just to ensure it doesn't
> obscure
> things.
> 
Rmoving __init cpu_hotplug_pm_sync_init() function after boot time and keep the static data defined in pm_notifier() is a normal behavior and normal usage in kernel. Same notifier registration usage function examples are ia64_mca_init() and msic_init() in mrst.c. There are quite a few other similar static data in __init functions usage examples in kernel source code.

So I would keep the same code in the patch.

I'll send an updated patch just to change the title typo.

Thanks.

-Fenghua
