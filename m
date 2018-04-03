From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 03 Apr 2018 13:39:08 +0100
Message-ID: <29149.1522759148@warthog.procyon.org.uk>
References: <20180403093030.GB4082@hirez.programming.kicks-ass.net> <20180403154122.00d76d61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180403093030.GB4082@hirez.programming.kicks-ass.net>
Content-ID: <29148.1522759148.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Peter Zijlstra <peterz@infradead.org> wrote:

> I figured that since there were only a handful of users it wasn't a
> popular API, also David very much knew of those patches changing it so
> could easily have pulled in the special tip/sched/wait branch :/

I'm not sure I could, since I have to base on net-next.  I'm not sure what
DaveM's policy on that is.

Also, it might've been better not to simply erase the atomic_t wait API
immediately, but substitute wrappers for it to be removed one iteration hence.

David
