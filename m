From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/6] irq_work: Implement remote queueing
Date: Sat, 28 Jun 2014 20:19:31 +0200
Message-ID: <20140628181931.GB6357@pd.tnic>
References: <20140625051721.GG3588@twins.programming.kicks-ass.net>
 <53AA6E11.1000404@linux.vnet.ibm.com>
 <20140625093657.GN19860@laptop.programming.kicks-ass.net>
 <20140625093944.GV16155@laptop.programming.kicks-ass.net>
 <53AA9B68.4050104@linux.vnet.ibm.com>
 <53AA9C43.3020903@linux.vnet.ibm.com>
 <20140625101915.GO19860@laptop.programming.kicks-ass.net>
 <53AAF779.8060006@wwwdotorg.org>
 <20140625163820.GC3935@laptop>
 <53AAFF74.8090308@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53AAFF74.8090308@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>, Stephen Warren <swarren@wwwdotorg.org>, Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Eric Dumazet <eric.dumazet@gmail.com>, Ingo Molnar <mingo@kernel.org>, Kevin Hilman <khilman@linaro.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Viresh Kumar <viresh.kumar@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 25, 2014 at 10:27:24PM +0530, Srivatsa S. Bhat wrote:
> > https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git/commit/?h=timers/nohz&id=921d8b81281ecdca686369f52165d04fa3505bd7

Just hit it here too. Cherry-picking it ontop of latest tip fixes the
issue, thanks.

Tested-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
