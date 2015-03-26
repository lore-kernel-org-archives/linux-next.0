From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 13:27:50 +0000
Message-ID: <20150326132750.GA2805@arm.com>
References: <20150326193112.2c87eb39@canb.auug.org.au>
 <20150326103442.GV21418@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150326103442.GV21418@twins.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 26, 2015 at 10:34:42AM +0000, Peter Zijlstra wrote:
> On Thu, Mar 26, 2015 at 07:31:12PM +1100, Stephen Rothwell wrote:
> > Hi Christian,
> > 
> > After merging the access_once tree, today's linux-next build (arm
> > multi_v7_defconfig) produced lots of this warning:
> > 
> > In file included from include/linux/linkage.h:4:0,
> >                  from include/linux/preempt.h:9,
> >                  from include/linux/spinlock.h:50,
> >                  from include/linux/lockref.h:17,
> >                  from lib/lockref.c:2:
> > In function '__read_once_size',
> >     inlined from 'lockref_get' at lib/lockref.c:50:2:
> > include/linux/compiler.h:216:3: warning: call to 'data_access_exceeds_word_size' declared with attribute warning: data access exceeds word size and won't be atomic
> >    data_access_exceeds_word_size();
> >    ^
> > 
> > Introduced by commit 6becd6bd5e89 ("compiler.h: Fix word size check for
> > READ/WRITE_ONCE") presumably interacting with commit 4d3199e4ca8e
> > ("locking: Remove ACCESS_ONCE() usage") from the tip tree.
> 
> Hmm, valid warning though, ARM is a 32bit arch and therefore it will
> 'have' to load a u64 in two goes, which violates the
> ACCESS_ONCE/READ_ONCE 'promise'.
> 
> Now ARM can indeed to the cmpxchg64 thing, but I'm not sure what to do
> here, I suspect the code is fine, seeing how the cmpxchg64 will fail if
> the split loads got it wrong, but I've not overly thought about it.

Yeah, I think it's fine because, as you point out, the cmpxchg can only
succeed if the 64-bit load appeared to be single-copy atomic (amongst other
things).

Have fun getting ACCESS_ONCE to figure that out, though...

Will
