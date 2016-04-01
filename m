From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Fri, 01 Apr 2016 22:51:54 +0200
Message-ID: <8212055.EkZiUjln8g@vostro.rjw.lan>
References: <20160401122743.08b7a655@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:52249 "HELO
	cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751210AbcDAUta (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Apr 2016 16:49:30 -0400
In-Reply-To: <20160401122743.08b7a655@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday, April 01, 2016 12:27:43 PM Stephen Rothwell wrote:
> Hi Rafael,

Hi Stephen,

> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: "__tracepoint_cpu_frequency" [kernel/sched/cpufreq_schedutil.ko] undefined!
> 
> Caused by commit
> 
>   d4913d2934b5 ("cpufreq: schedutil: New governor based on scheduler utilization data")
> 
> I have used the pm tree from next-20160331 for today.

Sorry for the breakage.  It hasn't been caught by 0-day somehow, not sure why.

Will fix shortly.

Thanks,
Rafael
