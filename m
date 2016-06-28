From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 2/2] ipc/sem: sem_lock with hysteresis
Date: Tue, 28 Jun 2016 10:54:50 -0700
Message-ID: <20160628175450.GA19886@linux-80c1.suse>
References: <20160615152318.164b1ebd@canb.auug.org.au>
 <1466280142-19741-1-git-send-email-manfred@colorfullife.com>
 <1466280142-19741-2-git-send-email-manfred@colorfullife.com>
 <20160621202902.GB3790@linux-80c1.suse>
 <fb23c7da-52a3-5e90-6c45-10e33d80417b@colorfullife.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35772 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751977AbcF1RzF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jun 2016 13:55:05 -0400
Content-Disposition: inline
In-Reply-To: <fb23c7da-52a3-5e90-6c45-10e33d80417b@colorfullife.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, 1vier1@web.de, felixh@informatik.uni-bremen.de

On Sat, 25 Jun 2016, Manfred Spraul wrote:

>- Only simple ops: patch has no impact (the first 10 semops do not matter)

Agreed.

>- sleeping complex ops: patch has no impact, we are always in complex mode
>- not sleeping complex ops: depends on the size of the array.
>With a 4.000 semaphore array, I see an improvement of factor 20.
>
>There is obviously one case where the patch causes a slowdown:
>- complex op, then 11 simple ops, then repeat.

Yeah, you reset the counter to COMPLEX_MODE_ENTER every time we do a
complexmode_enter(), so if you have interleaving of complex and simple
ops you could end up always taking the big lock. This is my main concern
and not an unusual scenario at all.

I wonder if we could be a bit less aggressive if already in complex_mode
and do something like:

if (sma->complex_mode > 0) {
   WRITE_ONCE(sma->complex_mode, min(complex_mode + 1, COMPLEX_MODE_ENTER));
   return;
}

and still be constrained by COMPLEX_MODE_ENTER... of course that has its own
additional overhead, albeit less contention on the big lock :/

>
>Perhaps: set COMPLEX_MODE_ENTER to 1 or 2, then allow to configure it
>from user space.

Nah, I don't think it's a good idea to expose such internals to userspace.

>Or do not merge the patch and wait until someone come with a profile
>that shows complexmode_enter().

Testing/benchmarking this patch is on my todo list mainly because I'm lacking
a decent box to test it on. But I'm not conformable having this one without
any numbers for say at least a rdbms benchmark. I'm very eager to add the
first patch (complex_mode) once the nits are settled, as it fixes a real bug.

Thanks,
Davidlohr
