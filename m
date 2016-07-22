From: Steve Muckle <steve.muckle@linaro.org>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Thu, 21 Jul 2016 19:26:28 -0700
Message-ID: <20160722022628.GE27987@graphite.smuckle.net>
References: <20160722115620.086b28ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160722115620.086b28ca@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steve Muckle <steve.muckle@linaro.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 22, 2016 at 11:56:20AM +1000, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> ERROR: "cpufreq_driver_resolve_freq" [kernel/sched/cpufreq_schedutil.ko] undefined!
> 
> Caused by commit
> 
>   5cbea46984d6 ("cpufreq: schedutil: map raw required frequency to driver frequency")
> 
> I used the pm tree from next-20160721 for today.

Sorry - I have just sent a patch to address this.

thanks,
Steve
