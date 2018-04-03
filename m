From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 3 Apr 2018 14:42:02 +0200
Message-ID: <20180403124202.GD4082@hirez.programming.kicks-ass.net>
References: <20180403093030.GB4082@hirez.programming.kicks-ass.net>
 <20180403154122.00d76d61@canb.auug.org.au>
 <29149.1522759148@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <29149.1522759148@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 03, 2018 at 01:39:08PM +0100, David Howells wrote:
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > I figured that since there were only a handful of users it wasn't a
> > popular API, also David very much knew of those patches changing it so
> > could easily have pulled in the special tip/sched/wait branch :/
> 
> I'm not sure I could, since I have to base on net-next.  I'm not sure what
> DaveM's policy on that is.
> 
> Also, it might've been better not to simply erase the atomic_t wait API
> immediately, but substitute wrappers for it to be removed one iteration hence.

Yeah, I know, but I really wasn't expecting new users of this thing, it
seemed like quite an exotic API with very limited users.

A well..
