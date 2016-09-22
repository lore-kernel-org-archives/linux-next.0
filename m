From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: + softirq-fix-tasklet_kill-and-its-users.patch added to -mm
 tree
Date: Thu, 22 Sep 2016 09:05:23 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1609220854090.5599@nanos>
References: <57e1b041.zRoBcsxStpPQoyeo%akpm@linux-foundation.org> <20160921051810.GA396@swordfish> <20160921080942.GA476@swordfish> <d072b085-2d07-066c-f1f7-7eab0a45273a@oracle.com> <20160922004204.GA701@swordfish>
 <36fffd08-17ec-0a73-17f3-378597e0c25a@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <36fffd08-17ec-0a73-17f3-378597e0c25a@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, ssantosh@kernel.org, David Miller <davem@davemloft.net>, giovanni.cabiddu@intel.com, gregkh@linuxfoundation.org, herbert@gondor.apana.org.au, isdn@linux-pingi.de, mingo@elte.hu, pebolle@tiscali.nl, Peter Zijlstra <peterz@infradead.org>, salvatore.benedetto@intel.com, tadeusz.struk@intel.com, mm-commits@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, sergey.senozhatsky@gmail.com, Ingo Molnar <mingo@kernel.org>
List-Id: linux-next.vger.kernel.org

B1;2802;0cOn Wed, 21 Sep 2016, Santosh Shilimkar wrote:
> I requested you to include this patch but now am not sure anymore.
> Looks like there are almost 30 more users which are directly
> tweaking 'tasklet_struct' fields and calling other APIs. Hunting them
> and fixing them probably would be an exercise and also those changes
> needs those changed drivers to be tested.
> 
> What do you suggest ? At least this patch needs to be dropped as of now
> till we can have complete coverage for those bad users.

Yes, it needs to be dropped. Stephen, can you please revert it from next?

How to fix this: The only way is to review all tasklet usage sites for
creative abuse and then fix them one by one. This needs to be done anyway
because those are ticking timebombs even without changes in the core
code. I looked at one of the offenders and it's broken today, it's just
protected by the extremly low probablity to hit the wreckage case.

What you can do to coerce the developers/maintainers of offending code into
looking at the mess they created/merged is to implement accessors for the
tasklet struct fields and replace the open coded fiddling with them.

Once that is done, rename the struct fields to something which is absurd
enough to type.  But don't worry, you will find people doing that. I
catched a few brainwrecks who actually used:

 irqdesc->core_internal_state__do_not_mess_with_it

in their code.

Now after having everything converted to accessors, you can add sanity
checks into the accessors and emit WARN_ONCE() when they are used in the
wrong context. That'll make them look and explain why they think that
fiddling in the internals is a good idea.

Thanks,

	tglx
