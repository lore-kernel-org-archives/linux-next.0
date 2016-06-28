From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 1/2] ipc/sem.c: Fix complex_count vs. simple op race
Date: Mon, 27 Jun 2016 22:27:17 -0700
Message-ID: <20160628052717.GA13793@linux-80c1.suse>
References: <20160615152318.164b1ebd@canb.auug.org.au>
 <1466280142-19741-1-git-send-email-manfred@colorfullife.com>
 <20160621003015.GA15593@linux-80c1.suse>
 <b5b4e032-8b1c-f102-ac23-3b331c2ed615@colorfullife.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b5b4e032-8b1c-f102-ac23-3b331c2ed615@colorfullife.com>
Sender: stable-owner@vger.kernel.org
To: Manfred Spraul <manfred@colorfullife.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, 1vier1@web.de, felixh@informatik.uni-bremen.de, stable@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 23 Jun 2016, Manfred Spraul wrote:

>What I'm not sure yet is if smp_load_acquire() is sufficient:
>
>Thread A:
>>       if (!READ_ONCE(sma->complex_mode)) {
>The code is test_and_test, no barrier requirements for first test

Yeah, it would just make us take the big lock unnecessarily, nothing fatal
and I agree its probably worth the optimization. It still might be worth
commenting.

>>                /*
>>                 * It appears that no complex operation is around.
>>                 * Acquire the per-semaphore lock.
>>                 */
>>                spin_lock(&sem->lock);
>>
>>                if (!smp_load_acquire(&sma->complex_mode)) {
>>                        /* fast path successful! */
>>                        return sops->sem_num;
>>                }
>>                spin_unlock(&sem->lock);
>>        }
>
>Thread B:
>>       WRITE_ONCE(sma->complex_mode, true);
>>
>>        /* We need a full barrier:
>>         * The write to complex_mode must be visible
>>         * before we read the first sem->lock spinlock state.
>>         */
>>        smp_mb();
>>
>>        for (i = 0; i < sma->sem_nsems; i++) {
>>                sem = sma->sem_base + i;
>>                spin_unlock_wait(&sem->lock);
>>        }
>
>If thread A is allowed to issue read_spinlock;read complex_mode;write 
>spinlock, then thread B would not notice that thread A is in the 
>critical section

Are you referring to the sem->lock word not being visibly locked before we
read complex_mode (for the second time)? This issue was fixed in 2c610022711
(locking/qspinlock: Fix spin_unlock_wait() some more). So smp_load_acquire
should be enough afaict, or are you referring to something else?

Thanks,
Davidlohr
