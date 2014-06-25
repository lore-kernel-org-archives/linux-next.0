From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/6] irq_work: Implement remote queueing
Date: Wed, 25 Jun 2014 10:23:21 -0600
Message-ID: <53AAF779.8060006@wwwdotorg.org>
References: <1402413309-3415-1-git-send-email-fweisbec@gmail.com> <1402413309-3415-3-git-send-email-fweisbec@gmail.com> <53A9E0A5.5040402@wwwdotorg.org> <20140625051234.GD6758@twins.programming.kicks-ass.net> <20140625051721.GG3588@twins.programming.kicks-ass.net> <53AA6E11.1000404@linux.vnet.ibm.com> <20140625093657.GN19860@laptop.programming.kicks-ass.net> <20140625093944.GV16155@laptop.programming.kicks-ass.net> <53AA9B68.4050104@linux.vnet.ibm.com> <53AA9C43.3020903@linux.vnet.ibm.com> <20140625101915.GO19860@laptop.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140625101915.GO19860@laptop.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Eric Dumazet <eric.dumazet@gmail.com>, Ingo Molnar <mingo@kernel.org>, Kevin Hilman <khilman@linaro.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Viresh Kumar <viresh.kumar@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 06/25/2014 04:19 AM, Peter Zijlstra wrote:
> On Wed, Jun 25, 2014 at 03:24:11PM +0530, Srivatsa S. Bhat wrote:
>> Wait, that was a stupid idea. hotplug_cfd() already invokes irq_work_run
>> indirectly via flush_smp_call_function_queue(). So irq_work_cpu_notify()
>> doesn't need to invoke it again, AFAIU. So perhaps we can get rid of
>> irq_work_cpu_notify() altogether?
> 
> Just so...
> 
> getting up at 6am and sitting in an airport terminal doesn't seem to
> agree with me; any more silly fail here?
> 
> ---
> Subject: irq_work: Remove BUG_ON in irq_work_run()
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Wed Jun 25 07:13:07 CEST 2014
> 
> Because of a collision with 8d056c48e486 ("CPU hotplug, smp: flush any
> pending IPI callbacks before CPU offline"), which ends up calling
> hotplug_cfd()->flush_smp_call_function_queue()->irq_work_run(), which
> is not from IRQ context.
> 
> And since that already calls irq_work_run() from the hotplug path,
> remove our entire hotplug handling.

Tested-by: Stephen Warren <swarren@nvidia.com>

[with the s/static// already mentioned in this thread, obviously:-)]
