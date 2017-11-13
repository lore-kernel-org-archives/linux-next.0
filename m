From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the FIXME tree
Date: Mon, 13 Nov 2017 16:32:14 +1100
Message-ID: <20171113163214.0c3021f9@canb.auug.org.au>
References: <20171011161035.sudulg5gpvw4lp4o@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171011161035.sudulg5gpvw4lp4o@sirena.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Mark Brown <broonie@kernel.org>, Will Deacon <will.deacon@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Mark,

On Wed, 11 Oct 2017 17:10:35 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/s390/include/asm/spinlock.h
> 
> between a series of commits adding wait queuing to s390 spinlocks
> from the s390 tree:
> 
> eb3b7b848fb3dd00f7a57d633 s390/rwlock: introduce rwlock wait queueing
> b96f7d881ad94203e997cd2aa s390/spinlock: introduce spinlock wait queueing
> 8153380379ecc8381f6d55f64 s390/spinlock: use the cpu number +1 as spinlock value
> 
> and Will's series of commits removing dummy implementations of spinlock
> related things from the tip tree:
> 
> a4c1887d4c1462b0ec5a8989f locking/arch: Remove dummy arch_{read,spin,write}_lock_flags() implementations
> 0160fb177d484367e041ac251 locking/arch: Remove dummy arch_{read,spin,write}_relax() implementations
> a8a217c22116eff6c120d753c locking/core: Remove {read,spin,write}_can_lock()
> 
> I'm don't feel confident I can resolve this conflict sensibly without
> taking too long so I've used the tip tree from yesterday.

Just a reminder that this conflict still exists.

-- 
Cheers,
Stephen Rothwell
