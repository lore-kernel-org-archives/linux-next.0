From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
Date: Mon, 11 Feb 2019 08:17:37 +0100
Message-ID: <20190211071737.GB55579@gmail.com>
References: <20190211073657.7f9cd5ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190211073657.7f9cd5ef@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commit
> 
>   f6783319737f ("sched/fair: Fix insertion in rq->leaf_cfs_rq_list")
> 
> Fixes tag
> 
>   Fixes: 9c2791f936ef ("Fix hierarchical order in rq->leaf_cfs_rq_list")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject

It's still a unique substring of the original subject, so not a big deal 
IMO.

Thanks,

	Ingo
