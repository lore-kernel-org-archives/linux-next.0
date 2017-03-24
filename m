From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Fri, 24 Mar 2017 09:05:39 +0100
Message-ID: <20170324080539.2bmioalq5hmcsz6f@hirez.programming.kicks-ass.net>
References: <20170324164026.4f305846@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170324164026.4f305846@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Mar 24, 2017 at 04:40:26PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   arch/x86/include/asm/atomic.h
> 
> between commit:
> 
>   e6790e4b5d5e ("locking/atomic/x86: Use atomic_try_cmpxchg()")
> 
> from the tip tree and patch:
> 
>   "x86/atomic: move __arch_atomic_add_unless out of line"
> 
> from the akpm tree.

Urgh, that patch shouldn't be in mm in any case. Also with the
try_cmpxchg() change, the text gain is reduced (about half).

Furthermore, micro-benchmarks show that turning cmpxchg loops like this
into a function makes them more expensive; see:

  https://lkml.kernel.org/r/20170322165144.dtidvvbxey7w5pbd@hirez.programming.kicks-ass.net
