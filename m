From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: manual merge of the driver-core tree with Linus' tree
Date: Fri, 7 Aug 2015 11:00:40 +0530
Message-ID: <20150807053040.GK6325@linux>
References: <20150807152655.27e0e47b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150807152655.27e0e47b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
List-Id: linux-next.vger.kernel.org

On 07-08-15, 15:26, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/cpufreq/cpufreq.c
> 
> between commit:
> 
>   559ed40752dc ("cpufreq: Avoid attempts to create duplicate symbolic links")
> 
> from Linus' tree and commit:
> 
>   71db87ba5700 ("bus: subsys: update return type of ->remove_dev() to void")
> 
> from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks fine. Thanks.

-- 
viresh
