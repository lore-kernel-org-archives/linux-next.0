From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the workqueues tree
Date: Fri, 3 Nov 2017 06:59:11 -0700
Message-ID: <20171103135911.GS3252168@devbig577.frc2.facebook.com>
References: <20171102143440.67acc666@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171102143440.67acc666@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tal Shorer <tal.shorer@gmail.com>, Frederic Weisbecker <frederic@kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 02, 2017 at 02:34:40PM +1100, Stephen Rothwell wrote:
> Hi Tejun,
> 
> After merging the workqueues tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> kernel/workqueue.c: In function 'workqueue_init_early':
> kernel/workqueue.c:5561:56: error: 'cpu_isolated_map' undeclared (first use in this function)
>   cpumask_andnot(wq_unbound_cpumask, cpu_possible_mask, cpu_isolated_map);
>                                                         ^
> 
> Caused by commit
> 
>   b5149873a0c2 ("workqueue: respect isolated cpus when queueing an unbound work")
> 
> interacting with commit
> 
>   edb9382175c3 ("sched/isolation: Move isolcpus= handling to the housekeeping code")
> 
> from the tip tree.
> 
> I am not sure how to fix this, so I have reverted b5149873a0c2 for today.

I'm reverting it from my tree.  Tal, can you please spin up a new
patch against the sched branch?  Let's either route it through sched
branch or try again after the rc1.

Thanks.

-- 
tejun
