From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: + softirq-fix-tasklet_kill-and-its-users.patch added to -mm tree
Date: Wed, 21 Sep 2016 17:09:43 +0900
Message-ID: <20160921080942.GA476@swordfish>
References: <57e1b041.zRoBcsxStpPQoyeo%akpm@linux-foundation.org>
 <20160921051810.GA396@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160921051810.GA396@swordfish>
Sender: linux-kernel-owner@vger.kernel.org
To: ssantosh@kernel.org
Cc: akpm@linux-foundation.org, davem@davemloft.net, giovanni.cabiddu@intel.com, gregkh@linuxfoundation.org, herbert@gondor.apana.org.au, isdn@linux-pingi.de, mingo@elte.hu, pebolle@tiscali.nl, peterz@infradead.org, salvatore.benedetto@intel.com, tadeusz.struk@intel.com, tglx@linutronix.de, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, sergey.senozhatsky@gmail.com, sergey.senozhatsky.work@gmail.com
List-Id: linux-next.vger.kernel.org

didn't look into the issue, but this thing

> > tasklet_init() == Init and Enable scheduling
[..]
> > @@ -559,7 +559,7 @@ void tasklet_init(struct tasklet_struct
> >  {
> >  	t->next = NULL;
> >  	t->state = 0;
> > -	atomic_set(&t->count, 0);
> > +	atomic_set(&t->count, 1);
			^^^^^^^^
> >  	t->func = func;
> >  	t->data = data;
> >  }

seems to be in conflict with

 #define DECLARE_TASKLET(name, func, data) \
 struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(0), func, data }
						^^^^^^^

 #define DECLARE_TASKLET_DISABLED(name, func, data) \
 struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(1), func, data }
						^^^^^^^


as well as with the tasklet_{disable, enable} helpers

static inline void tasklet_disable_nosync(struct tasklet_struct *t)
{
	atomic_inc(&t->count);
	smp_mb__after_atomic();
}

static inline void tasklet_disable(struct tasklet_struct *t)
{
	tasklet_disable_nosync(t);
	tasklet_unlock_wait(t);
	smp_mb();
}

static inline void tasklet_enable(struct tasklet_struct *t)
{
	smp_mb__before_atomic();
	atomic_dec(&t->count);
}

	-ss
