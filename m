From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Crashes in arm qemu emulations due to 'cpufreq: governor:
 Replace timers with utilization ...'
Date: Tue, 16 Feb 2016 07:06:28 +0530
Message-ID: <20160216013628.GK6334@vireshk-i7>
References: <20160215170527.GA24453@roeck-us.net>
 <CAJZ5v0gLankSuziQq25qTCyNqeOX43yD9jnJu_XXwbdyajfmKg@mail.gmail.com>
 <20160216011335.GI6334@vireshk-i7>
 <6826860.yxabWEoz5T@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6826860.yxabWEoz5T@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Guenter Roeck <linux@roeck-us.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On 16-02-16, 02:27, Rafael J. Wysocki wrote:
> Yes, that's what we should be doing, but it seemed to me that we didn't.
> 
> Or maybe the trace just contained the last one, because that's when the
> crash happened.

Ofcourse, it wouldn't mention the function calls that have already
finished :)

-- 
viresh
