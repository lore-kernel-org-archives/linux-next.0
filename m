From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 15:22:20 +0100
Message-ID: <20150326142220.GY21418@twins.programming.kicks-ass.net>
References: <20150326193112.2c87eb39@canb.auug.org.au>
 <20150326103442.GV21418@twins.programming.kicks-ass.net>
 <20150326132750.GA2805@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150326132750.GA2805@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Linus Torvalds <torvalds@linux-foundation.org>, Paul McKenney <paulmck@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 26, 2015 at 01:27:50PM +0000, Will Deacon wrote:
> On Thu, Mar 26, 2015 at 10:34:42AM +0000, Peter Zijlstra wrote:
> > On Thu, Mar 26, 2015 at 07:31:12PM +1100, Stephen Rothwell wrote:
> > > In function '__read_once_size',
> > >     inlined from 'lockref_get' at lib/lockref.c:50:2:


> Yeah, I think it's fine because, as you point out, the cmpxchg can only
> succeed if the 64-bit load appeared to be single-copy atomic (amongst other
> things).

So one option to get rid of this warning is to rely on the fact that all
CMPXCHG_LOOP users are at the beginning of !pure function calls, which
already imply a compiler barrier and therefore it must already emit that
load.

And as already argued, split loads aren't an issue because the cmpxchg
will catch those for us.

So we can either just remove the READ_ONCE(), or replace it with a
leading barrier() call just to be on the paranoid side of things.

Any preferences?

Something like so, but with a sensible comment I suppose.

---
 lib/lockref.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/lockref.c b/lib/lockref.c
index 494994bf17c8..b5ca1f65c8a3 100644
--- a/lib/lockref.c
+++ b/lib/lockref.c
@@ -18,7 +18,8 @@
 #define CMPXCHG_LOOP(CODE, SUCCESS) do {					\
 	struct lockref old;							\
 	BUILD_BUG_ON(sizeof(old) != 8);						\
-	old.lock_count = READ_ONCE(lockref->lock_count);			\
+	barrier();								\
+	old.lock_count = lockref->lock_count;					\
 	while (likely(arch_spin_value_unlocked(old.lock.rlock.raw_lock))) {  	\
 		struct lockref new = old, prev = old;				\
 		CODE								\
