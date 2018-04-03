From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 3 Apr 2018 11:30:30 +0200
Message-ID: <20180403093030.GB4082@hirez.programming.kicks-ass.net>
References: <20180403154122.00d76d61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180403154122.00d76d61@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 03, 2018 at 03:41:22PM +1000, Stephen Rothwell wrote:

> Caused by commit
> 
>   9b8cce52c4b5 ("sched/wait: Remove the wait_on_atomic_t() API")
> 
> interacting with commits
> 
>   d3be4d244330 ("xrpc: Fix potential call vs socket/net destruction race")
>   31f5f9a1691e ("rxrpc: Fix apparent leak of rxrpc_local objects")
> 
> from the net-next tree.
> 
> Haven't we figured out how to remove/change APIs yet? :-(

I figured that since there were only a handful of users it wasn't a
popular API, also David very much knew of those patches changing it so
could easily have pulled in the special tip/sched/wait branch :/
