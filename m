From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: next-20090202: task kmemleak:763 blocked for more than 120
	seconds.
Date: Tue, 3 Feb 2009 21:52:06 +0100
Message-ID: <20090203205204.GC6344@nowhere>
References: <a4423d670902020327x61a1d9dehb1642b25ec7f82f1@mail.gmail.com> <tnxiqns28mm.fsf@pc1117.cambridge.arm.com> <c62985530902020715u73407d4dqe14c340de310c866@mail.gmail.com> <20090202215740.GA26550@google.com> <20090203004141.GA22718@nowhere> <1233665314.1568.46.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f31.google.com ([209.85.219.31]:40127 "EHLO
	mail-ew0-f31.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751075AbZBCUwR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Feb 2009 15:52:17 -0500
Content-Disposition: inline
In-Reply-To: <1233665314.1568.46.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mandeep Singh Baines <msb@google.com>, Alexander Beregalov <a.beregalov@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Feb 03, 2009 at 12:48:34PM +0000, Catalin Marinas wrote:
> On Tue, 2009-02-03 at 01:41 +0100, Frederic Weisbecker wrote:
> > Right. BTW, I wonder how it behaves in case of suspend to disk.
> > But changing the state to TASK_INTERRUPTIBLE wouldn't change it in this case since the
> > signals are only sent to userpace threads to freeze them.


I made a mistake here. Only kernel threads in TASK_INTERRUPTIBLE are woken up
while hibernation.
Yes, if you want kmemleak to be freezable, that's the right state.

 
> > Kernel threads try to freeze by themselves.
> > 
> > But for such very long schedule_timeout, will the hibernation wait for kmemleak
> > to wake up and then try_to_freeze() before suspend to disk?
> 
> I haven't added anything to kmemleak for this. Does something like below
> look feasible?
> 
> --- a/mm/kmemleak.c
> +++ b/mm/kmemleak.c
> @@ -88,6 +88,7 @@
>  #include <linux/errno.h>
>  #include <linux/uaccess.h>
>  #include <linux/string.h>
> +#include <linux/freezer.h>
>  
>  #include <asm/sections.h>
>  #include <asm/processor.h>
> @@ -1070,8 +1071,11 @@ static int kmemleak_scan_thread(void *arg)
>  
>  		mutex_unlock(&scan_mutex);
>  		/* wait before the next scan */
> -		while (timeout && !kthread_should_stop())
> +		while (timeout && !kthread_should_stop()) {
> +			if (try_to_freeze())
> +				break;
>  			timeout = schedule_timeout_interruptible(timeout);
> +		}
>  	}


That looks good, but you have to set kmemleak thread as freezable before
by calling set_freezable() in the beggining of your thread.

Note that requiring kmemleak to be freezable looks only relevant if it does
some memory allocations (hibernation needs some memory and prefer that there
are not too much parallel memory allocations.)


>  
>  	pr_info("kmemleak: Automatic memory scanning thread ended\n");
> 
> Thanks.
> 
> -- 
> Catalin
> 
